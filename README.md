# hanyu_toy_repository

This repository is used by HanYu Toy application (Windows, Andoid, Snap).
Feel free to contribute!  

## Useful One Line Checks

Check absence of image file.

```bash
user@host$ for d in `find . -maxdepth 1 -type d  ! -name '.*'` ; do [ ! -e $d/image.svg ] && echo -n $d && cat $d/pt.txt && echo "" ; done
```
