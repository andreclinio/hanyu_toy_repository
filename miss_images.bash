# /bin/bash

for d in `find repository -maxdepth 2 -mindepth 2 -type d  ! -name '.*'` ; do [ ! -e $d/image.svg ] && echo -n "$d ("  && cat $d/pinyin.txt && echo -n ") - " && cat $d/pt.txt && echo "" ; done
