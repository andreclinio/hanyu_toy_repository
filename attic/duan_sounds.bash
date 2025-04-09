# /bin/bash

n=1
for dir in `find repository -mindepth 2 -maxdepth 2 -type d` 
do
    hanzi=`basename $dir`
    file=$dir/sounds/male/$hanzi.mp3
    if [ -e $file ]; then
       echo "$n: já existe! ($file)"
       n=$((n+1))
       continue;
    fi
    mkdir -p $dir/sounds/male
    echo "$n: call enhanced_google_sound.py for $hanzi (file: $file)..."

    ./venv/bin/python enhanced_google_sound.py $hanzi
    mv male.mp3 $file
    echo "$n: OK ($dir $n)"
    n=$((n+1))
done
