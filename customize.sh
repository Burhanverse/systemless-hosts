#!/system/bin/sh

#
# Systemless Hosts by the
# open source loving GL-DP and all contributors;
# Consolidating and extending hosts files from several well-curated sources
#

# Checking for installation environment
if [ $BOOTMODE = true ]; then
 ROOT=$(find `magisk --path` -type d -name "mirror" | head -n 1)
    ui_print "- Root path: $ROOT"
else
 ROOT=""
fi

# Define hosts URL
HOSTS_URL="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
GIT_URL="https://github.com/StevenBlack/hosts"

# Downloading hosts
ui_print "- Downloading latest hosts file from $GIT_URL"
curl -o $MODPATH/hosts $HOSTS_URL
if [ $? -ne 0 ]; then
    ui_print "Error: Failed to download hosts file."
    exit 1
fi

# Patch default hosts file
PATH=/system/etc
ui_print "- Patching hosts file"
mkdir -p $MODPATH$PATH
mv -f $MODPATH/hosts $MODPATH$PATH

# Clean up
rm -rf $MODPATH/LICENSE
