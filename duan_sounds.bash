# /bin/bash

level=1

echo "L:$level"
n=1
for dir in `find repository -mindepth 2 -maxdepth 2 -type d` 
do
    hanzi=`basename $dir`
    file=$dir/sounds/male/$hanzi.mp3
    if [ -e $file ]; then
       echo "$n: já existe! ($file)"
       continue;
    fi
    # dir="repository/$level/$hanzi"
    mkdir -p $dir/sounds/male
    echo "$n: call enhanced_google_sound.py for $hanzi (file: $file)..."

    ./venv/bin/python enhanced_google_sound.py $hanzi
    mv male.mp3 $file
    echo "$n: OK ($dir $n)"
    n=$((n+1))
done
