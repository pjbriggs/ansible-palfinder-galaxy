#!/bin/sh

# Install tool using nebulizer & Galaxy API

if [ $# -eq 0 ] ; then
    echo Usage: $0 SHED TOOL OWNER APIKEY
    exit
fi

SHED=$1
TOOL=$2
OWNER=$3
APIKEY=$4

MANAGE_TOOLS=.venv/bin/manage_tools
URL=http://localhost:80

function tool_exists() {
    $MANAGE_TOOLS installed $URL -k $APIKEY --name "$TOOL" | grep -w $SHED | grep -w $OWNER | grep -w "Installed$" | head -n 1 | cut -f1
}

echo RUN
echo \"$(tool_exists)\"
echo RUN

# Check for tool
if [ -n "$(tool_exists)" ] ; then
    echo $TOOL: already installed
    exit
fi

# Install the tool
$MANAGE_TOOLS install $URL -k $APIKEY $SHED $OWNER $TOOL
if [ $? -ne 0 ] ; then
    echo Failed to install tool $TOOL 2>&1
    exit 1
fi

# Check that tool exists
ntries=0
while [ $ntries -lt 10 ] ; do
    if [ -n "$(tool_exists)" ] ; then
	echo $TOOL: installed
	exit
    fi
    ntries=$((ntries+1))
    sleep 5
done
echo Failed to install tool $TOOL 2>&1
exit 1
