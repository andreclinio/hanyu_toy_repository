# /bin/bash

echo $# arguments 
if [ $# -ne 6 ]; then 
   echo "illegal number of parameters"
fi
  
level=$1
shift
hanzi=$1
shift
pinyin=$1
shift
pt=$1
shift
en=$1
shift
es=$1
shift


echo "L:$level ($hanzi: $pinyin) - $pt/$en/$es"

dir="repository/$level/$hanzi"
if [ -e $dir ]; then
   echo "Já existe! ($dir)"
   exit 0;
fi
mkdir -p $dir
mkdir -p $dir/sounds/female
mkdir -p $dir/sounds/male
./venv/bin/python enhanced_google_sound.py $hanzi
mv male.mp3 $dir/sounds/male/$hanzi.mp3
mv female.mp3 $dir/sounds/female/$hanzi.mp3
echo -n $pinyin > $dir/pinyin.txt
echo -n $pt > $dir/pt.txt
echo -n $en > $dir/en.txt
echo -n $es > $dir/es.txt
echo "OK: ($dir)"
