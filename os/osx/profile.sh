
# paths
dirname=$(dirname "$(readlink -f "$0")")
lib="$dirname/../../lib"
os="$dirname/../../os"

# modules
source "$lib/symlink/index.sh"
# export -f symlink

