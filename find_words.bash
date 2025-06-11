# /bin/bash

for dir in `find repository -mindepth 2 -maxdepth 2 -type d`
do
  word=`basename $dir`
  path=`find . -name "$word" -type d`
  pt=$path/pt.txt
  py=$path/pinyin.txt
  repo=`dirname $path`
  if [ -e $pt ]; then
     text=`more $pt`
  else 
     text="??"
  fi
  if [ -e $py ]; then
     pinyin=`more $py`
  else 
     pinyin="??"
  fi
  echo "$word ($repo/$word) - $text [$pinyin]"
done


