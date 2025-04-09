# /bin/bash

n=1
for dir in `find repository -mindepth 2 -maxdepth 2 -type d` 
do
    hanzi=`basename $dir`
    source1=$dir/sounds/duan
    target1=$dir/sounds/male
    if [ ! -e $file ]; then
       echo "$n: não existe! ($source1)"
    else
       echo "$n: moved! ($source1 -> $target1)"
       mv $source1 $target1
    fi

    source1=$dir/sounds/machine
    target1=$dir/sounds/female
    if [ ! -e $file ]; then
       echo "$n: não existe! ($source1)"
    else
       echo "$n: moved! ($source1 -> $target1)"
       mv $source1 $target1
    fi

    n=$((n+1))
done
