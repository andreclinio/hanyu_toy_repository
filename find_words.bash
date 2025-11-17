# /bin/bash

for dir in `find repository -mindepth 2 -maxdepth 2 -type d`
do
  word=`basename $dir`
  path=`find . -name "$word" -type d`
  pt=$path/pt.txt
  en=$path/en.txt
  py=$path/pinyin.txt
  repo=`dirname $path`
  if [ -e $en ]; then
     text_en=`more $en`
  else 
     text_en="??"
  fi
  if [ -e $pt ]; then
     text_pt=`more $pt`
  else 
     text_pt="??"
  fi
  if [ -e $py ]; then
     pinyin=`more $py`
  else 
     pinyin="??"
  fi
  echo "$word ($repo/$word) - $text_pt - $text_en [$pinyin]"
done


