#!/bin/sh

# Install tool using nebulizer & Galaxy API

if [ $# -eq 0 ] ; then
    echo Usage: $0 SHED TOOL OWNER APIKEY \[URL\]
    exit
fi

SHED=$1
TOOL=$2
OWNER=$3
APIKEY=$4
if [ ! -z "$5" ] ; then
    URL=$5
else
    URL=http://localhost:80
fi

MANAGE_TOOLS=.venv/bin/manage_tools

function tool_installed() {
    $MANAGE_TOOLS installed $URL -k $APIKEY --name "$TOOL" | grep -w $SHED | grep -w $OWNER | grep -w "Installed$" | head -n 1 | cut -f1
}

function tool_installing() {
    $MANAGE_TOOLS installed $URL -k $APIKEY --name "$TOOL" | grep -w $SHED | grep -w $OWNER | grep -w "Installing$" | head -n 1 | cut -f1
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
$MANAGE_TOOLS install $URL -k $APIKEY $SHED $OWNER $TOOL
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
