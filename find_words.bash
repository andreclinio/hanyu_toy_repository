# /bin/bash

for word in "$@"
do
  path=`find . -name "$word" -type d`
  pt=$path/pt.txt
  if [ -e $pt ]; then
     text=`more $pt`
  else 
     text="??"
  fi
  echo $word - $text
done


