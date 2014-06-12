
# paths
dirname=$(dirname "$(readlink -f "$0")")
lib="/usr/local/lib/"
bin="/usr/local/bin/"

# Copy the path
cp -R $dirname $lib

# symlink dots
ln -s "$dirname/dots.sh" "$bin/dots"
