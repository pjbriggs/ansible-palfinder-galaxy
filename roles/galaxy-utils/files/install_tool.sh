#!/bin/sh

# Install tool using nebulizer & Galaxy API

if [ $# -eq 0 ] ; then
    echo Usage: $0 SHED TOOL OWNER APIKEY \[URL\] \[--section SECTION\]
    exit
fi

SHED=$1
TOOL=$2
OWNER=$3
APIKEY=$4
SECTION=
URL=http://localhost:80
while [ ! -z "$5" ] ; do
    case "$5" in
	--section)
	    shift
	    SECTION=$5
	    ;;
	*)
	    URL=$5
	    ;;
    esac
    shift
done

NEBULIZER=$(dirname $0)/nebulizer

function tool_installed() {
    $NEBULIZER -k $APIKEY list_installed_tools $URL --name "$TOOL" | grep -w $SHED | grep -w $OWNER | grep -w "Installed$" | head -n 1 | cut -f1
}

function tool_installing() {
    $NEBULIZER -k $APIKEY list_installed_tools $URL --name "$TOOL" | grep -w $SHED | grep -w $OWNER | grep -w "Installing$" | head -n 1 | cut -f1
}

echo RUN
echo \"$(tool_installed)\"
echo RUN

# Check for tool
if [ -n "$(tool_installed)" ] ; then
    echo $TOOL: already installed
    exit
fi

# Install the tool
if [ -z "$SECTION" ] ; then
    $NEBULIZER -k $APIKEY install_tool $URL $SHED $OWNER $TOOL
else
    $NEBULIZER -k $APIKEY install_tool --tool-panel-section "$SECTION" $URL $SHED $OWNER $TOOL
fi
retcode=$?
echo Tool installation returned $retcode
if [ $retcode -ne 0 ] ; then
    echo Nonzero return code ignored
fi

# Check that tool exists
ntries=0
while [ $ntries -lt 10 ] ; do
    if [ -n "$(tool_installing)" ] ; then
	echo -n .
	ntries=$((ntries+1))
	sleep 30
    elif [ -n "$(tool_installed)" ] ; then
	echo $TOOL: installed
	exit
    fi
    ntries=$((ntries+1))
    sleep 30
done
echo Failed to install tool $TOOL >&2
exit 1
