# /bin/bash

echo $# arguments 
if [ $# -ne 1 ]; then 
   echo "illegal number of parameters"
   exit 1
fi
  
dir=$1
shift

name=image.svg
file=$dir/$name

echo "CNV file ($file) at $dir"
if [ ! -e $file ]; then 
   echo "file $file does not exist!"
   exit 1
fi
if [ ! -f $file ]; then 
   echo "file $file is not a regular file!"
   exit 1
fi

absolut_file=$(realpath "$file")
inkscape $absolut_file --export-type="svg" --export-plain-svg --export-filename="$absolut_file"


echo "OK: ($dir) - $file"

