#!/usr/bin/env python

import sys
import urllib
import optparse
import copy
import math

def read_bed_file(bedfilename):
    """
    Takes in bedfile and returns a dictionary containing keys that refer to the chromosome and values that are lists of tuples containing the start posistion and end position of each location in the chromosome. """
    bedfile = open(bedfilename,'r')
    datadict = {}
    chroms = []
    for line in bedfile:
        line = line.strip()
        if line.startswith('track') or line.startswith('browse') or line.startswith('#') or not line:
            # skip comment lines, config lines for browser and empty lines
            continue
        data = line.split()
        if data[0] not in datadict:
            datadict[data[0]] = []
        datadict[data[0]].append((int(data[1]),int(data[2])))
    return datadict
    
def make_cluster(datadict1,datadict2):
    """ Takes in two datadicts containing information on the chromsome and posistions of region in the bed file.  Returns datadicts that contain the overlapping posistions and modifies the old dicts to not contain the overlapping regions. """
    datadict12 = {}
    datadict1_new = {}
    datadict2_new = {}
    datadict2_temp = {}
    for key in datadict2:
        datadict2[key].sort()
        datadict2_new[key] = datadict2[key][:]
        datadict2_temp[key] = datadict2[key][:]     
    for key in datadict1:
        datadict1[key].sort()
        datadict1_new[key]=datadict1[key][:]
        if key in datadict2:
            for e1 in datadict1[key]:
                copylist = datadict2_temp[key][:]
                for e2 in copylist:
                    #checking if regions do not overlap
                    if e2[0] > e1[1]:
                        break
                    if e1[0] > e2[1]:
                        datadict2_temp[key].remove(e2)
                        continue
                    if key not in datadict12:
                        datadict12[key] = []
                    #calculating minimum and maximum of overlapping region    
                    minimum = min([e1[0],e2[0]])
                    maximum = max([e1[1],e2[1]])
                    #checking to see if cluster containing overlap is already in the new datadict.
                    in_new_dict = False
                    for e12 in datadict12[key]:
                        if minimum <= e12[0] and maximum >= e12[0]:
                            in_new_dict = True
                        elif minimum <= e12[1] and maximum >= e12[1]:
                            in_new_dict = True
                    if in_new_dict == True:
                        minimum = min([minimum,e12[0]])
                        maximum = max([maximum,e12[1]])
                        datadict12[key].remove(e12)
                    datadict12[key].append((minimum,maximum))
                    try: datadict1_new[key].remove(e1)
                    except: pass
                    try: datadict2_new[key].remove(e2)
                    except: pass
    return datadict12,datadict1_new,datadict2_new
   
def make_cluster2(datadict1,datadict2):
    """
    Takes in two datadicts containing information on the chromsome and posistions of region in the bed file.  Returns datadicts that contain the overlapping posistions and modifies the old dicts to not contain the overlapping regions.
    Different from make_cluster(dict1,dict2) because doesn't make a copy of datadict1 and datadict2 so the inputs are changed.
    """
    datadict12 = {}
    for key in datadict1:
        if key in datadict2:
            datadict1[key].sort()
            datadict2[key].sort()
            for e1 in datadict1[key]:
                copylist = datadict2[key][:]
                for e2 in copylist:
                    #checking if regions do not overlap
                    if e2[0] > e1[1]:
                        break
                    if e1[0] > e2[1]:
                        continue
                    if key not in datadict12:
                        datadict12[key] = []
                    #calculating minimum and maximum of overlapping region    
                    minimum = min([e1[0],e2[0]])
                    maximum = max([e1[1],e2[1]])
                    #checking to see if cluster containing overlap is already in the new datadict.
                    in_new_dict = False
                    for e12 in datadict12[key]:
                        if minimum <= e12[0] and maximum >= e12[0]:
                            in_new_dict = True
                        elif minimum <= e12[1] and maximum >= e12[1]:
                            in_new_dict = True
                    if in_new_dict == True:
                        minimum = min([minimum,e12[0]])
                        maximum = max([maximum,e12[1]])
                        datadict12[key].remove(e12)
                    datadict12[key].append((minimum,maximum))
                    try: datadict1[key].remove(e1)
                    except: pass
                    try: datadict2[key].remove(e2)
                    except: pass
    return datadict12,datadict1,datadict2


def combine_dicts(dict1,dict2):
    """
    Takes in two dictionaries and returns one dictionary containing key values that were previously in both of the input dictionaries.
    Input dictionaries must be sorted:
    Only works if the key values in the previous dictionaries are exactly the same.
    """

    new_dict = {}
    for key in dict1:
        if key in dict2:
            new_dict[key] = []
            for e in dict1[key]:
                if e in dict2[key]:
                    new_dict[key].append(e)
    return new_dict

def combine_dicts_2(dict1,dict2):
    """
    Takes in two dictionaries and returns one dictionary containing key values that were previously in either of the input dictionaries.
    Input dictionaries must be sorted.
    If there are two regions that contain shared locations the regions will be combined in the new dictionary.
    """
    new_dict = {}
    for key in dict1:
        new_dict[key] = [] 
        if key in dict2:
            first_time = 'yes'
            while True:
                if first_time == 'yes':    
                    e1 = dict1[key].pop()
                    e2 = dict2[key].pop()
                    first_time = 'no'
                if e1[0]>e2[1]:
                    new_dict[key].append(e1)
                    try: e1 = dict1[key].pop()
                    except:
                        new_dict[key].append(e2)
                        for e in dict2[key]:
                            new_dict[key].append(e)
                        break
                    continue
                if e2[0]>e1[1]:
                    new_dict[key].append(e2)
                    try: e2 = dict2[key].pop()
                    except:
                        new_dict[key].append(e1)
                        for e in dict1[key]:
                            new_dict[key].append(e)
                        break
                    continue
                if e1[0]<e2[0]:
                    e1 = (min(e1[0],e2[0]),max(e1[1],e2[1]))
                    try: e2 =dict2[key].pop()
                    except:
                        new_dict[key].append(e1)
                        for e in dict1[key]:
                            new_dict[key].append(e)
                        break
                else:
                    e2 = (min(e1[0],e2[0]),max(e1[1],e2[1]))
                    try: e1 =dict1[key].pop()
                    except:
                        new_dict[key].append(e2)
                        for e in dict2[key]:
                            new_dict[key].append(e)
                        break
        else:
            new_dict[key] = dict1[key]
    for key in dict2:
        if key not in new_dict:
            new_dict[key] = dict2[key]
    return new_dict

def main(bed1,bed2,bed3,title,height,width,url,png_out='venn_diagram.png'):
    """
    This function takes in three bed files and creats a png file containing a venn_diagram which illustrates the number of regions shared by the bed files.
    """
    #placing the data from each bed file into a datadict
    datadict1 = read_bed_file(bed1)
    datadict2 = read_bed_file(bed2)
    datadict3 = read_bed_file(bed3)

    tempsize = 0
    for key in datadict1:
        tempsize+=len(datadict1[key])
    print('tmpsize= %s' % tempsize)

    #developing new datadicts based on clustering
    datadict12,datadict1_12,datadict2_12 = make_cluster(datadict1,datadict2)
    datadict13,datadict1_13,datadict3_13 = make_cluster(datadict1,datadict3)
    datadict23,datadict2_23,datadict3_23 = make_cluster(datadict2,datadict3)
    #Making datadicts which contain clusters containly locations only from one of the bed files
    #Making datadicts which contain clusters containing locations from only two of the bed files
    datadict_AC,datadict_A1,datadict_C1=make_cluster(datadict1_12,datadict3_23)
    datadict_AB,datadict_A2,datadict_B1=make_cluster(datadict1_13,datadict2_23)
    datadict_BC,datadict_B2,datadict_C2=make_cluster(datadict2_12,datadict3_13)
    datadict_A = combine_dicts(datadict_A1,datadict_A2)
    datadict_B = combine_dicts(datadict_B1,datadict_B2)
    datadict_C = combine_dicts(datadict_C1,datadict_C2)
    #Making datadict_ABC which has clusters containing locations from all three bed files
    datadict123,datadict12_123,datadict3_123 = make_cluster(datadict12,datadict3)
    datadict132,datadict13_123,datadict2_123 = make_cluster(datadict13,datadict2)
    datadict231,datadict23_123,datadict1_123 = make_cluster(datadict23,datadict1)
    datadict_ABC_temp = combine_dicts_2(datadict123,datadict132)
    for key in datadict_ABC_temp:
        datadict_ABC_temp[key].sort()
    datadict_ABC = combine_dicts_2(datadict_ABC_temp,datadict231)

    #calclating size of each cluster
    sizeA=sizeB=sizeC=sizeAB=sizeBC=sizeAC=sizeABC=0
    #print datadict_ABC
    for key in datadict_A:
        sizeA+=len(datadict_A[key])
    for key in datadict_B:
        sizeB+=len(datadict_B[key])
    for key in datadict_C:
        sizeC+=len(datadict_C[key])
    for key in datadict_AB:
        sizeAB+=len(datadict_AB[key])
    for key in datadict_BC:
        sizeBC+=len(datadict_BC[key])
    for key in datadict_AC:
        sizeAC+=len(datadict_AC[key])
    for key in datadict_ABC:
        sizeABC+=len(datadict_ABC[key])
    print(sizeABC)
    total_size = sizeA+sizeB+sizeC+sizeAB+sizeBC+sizeAC+sizeABC    
    sizeA_tot = sizeA+sizeAB+sizeAC+sizeABC
    sizeB_tot = sizeB+sizeAB+sizeBC+sizeABC
    sizeC_tot = sizeC+sizeAC+sizeBC+sizeABC
    sizeAB_tot = sizeAB+sizeABC
    sizeAC_tot = sizeAC+sizeABC  #fixed a typo here, was AB+ABC before now changed to AC+ABC
    sizeBC_tot = sizeBC+sizeABC
    #generating html page which defines the venn diagram
    if opts.notporportional:
        data_sizes = str(100.0*sizeA_tot/total_size)+','+str(100.0*sizeB_tot/total_size)+','+str(100.0*sizeC_tot/total_size)+','+str(100.0*sizeAB_tot/total_size)+','+str(100.0*sizeAC_tot/total_size)+','+str(100.0*sizeBC_tot/total_size)+','+str(100.0*sizeABC/total_size)  #changed to float math instead of int math, with int math things may become zeros of other wrong values due to division and rounding
    elif not opts.notporportional:
        data_sizes = '100,100,100,20,20,20,10'   #added fixed values for none porportional diagrams
    colors = 'ff0000,0000ff,00ff00,ffffff,ffffff,ffffff,ffffff'
    if int(width)*int(height) > 300000:
        width='500'
        height='600'
    image_size=width+'x'+height
    if bed2 == bed3:
        if opts.notporportional:
            data_sizes = str(100.0*sizeA_tot/total_size)+','+str(100.0*sizeB_tot/total_size)+',0,'+str(100.0*sizeABC/total_size)
        elif not opts.notporportional:
            data_sizes = '100,100,0,25' #added fixed values for none porportional option
        colors = 'ff0000,0000ff,ffffff'
        legend = opts.bedlabel[0]+' only (locations= '+str(sizeA)+')|'+opts.bedlabel[1]+' only (locations= '+str(sizeBC)+')|'+opts.bedlabel[0]+' and '+opts.bedlabel[1]+'(shared locations= '+str(sizeABC)+')'
    else:
        legend = opts.bedlabel[0]+' only (locations= '+str(sizeA)+')|'+opts.bedlabel[1]+' only (locations= ' +str(sizeB)+')|'+opts.bedlabel[2]+' only (locations= '+str(sizeC)+')|'+opts.bedlabel[0]+' and '+opts.bedlabel[1]+' only (shared locations= '+str(sizeAB)+')|'+opts.bedlabel[0]+' and '+opts.bedlabel[2]+' only (shared locations= '+str(sizeAC)+')|'+opts.bedlabel[1]+' and '+opts.bedlabel[2]+' only (shared locations= '+str(sizeBC)+')|'+opts.bedlabel[0]+','+opts.bedlabel[1]+', and '+opts.bedlabel[2]+' (shared locations= '+str(sizeABC)+')'
    venn_diagram_webpage = 'http://chart.apis.google.com/chart?cht=v&chs='+image_size+'&chd=t:'+data_sizes+'&chco='+colors+'&chdl='+legend+'&chtt='+title+'&chdlp='+'bv'
    url = venn_diagram_webpage.replace(' ','%20')
    if opts.url == 'yes':
        print(url)
    #accessing webpage and copying png image to file
    opener = urllib.FancyURLopener({})
    f = opener.open(url)
    venn_diagram = f.read()
    newFile = open(png_out, "wb")
    newFile.write(venn_diagram)
    newFile.close()

    return datadict_ABC

if __name__ == '__main__':
    parser = optparse.OptionParser()
    parser.add_option('-H','--height', dest ='height', default='500')
    parser.add_option('-W','--width', dest='width', default='500')
    parser.add_option('-t','--title',dest='title',default='Bed Venn Diagram')
    parser.add_option('-u','--url',dest='url',default='no')
    parser.add_option('-n','--notporportional',action='store_false',dest='notporportional',default=True)  #added option for none porportional diagrams
    parser.add_option('-o',"--output",dest='png_out',type='string',action='store',default='venn_diagram.png')
    parser.add_option("-l","--bed-label",dest="bedlabel",type="string",action="append")
    (opts, args) = parser.parse_args(sys.argv)
    if len(args)<3:
        parser.print_help()
        sys.exit()
    if not opts.bedlabel:
        opts.bedlabel=["Bed File 1","Bed File 2","Bed File 3"]
    bed1=args[1]
    bed2=args[2]
    try:
        open(args[3])
    except (IOError, IndexError):
        bed3=bed2
    else:
        bed3=args[3]
    main(bed1,bed2,bed3,opts.title,opts.height,opts.width,opts.url,png_out=opts.png_out)
