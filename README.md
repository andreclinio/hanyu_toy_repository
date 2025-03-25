# hanyu_toy_repository

This repository is used by HanYu Toy application (Windows, Andoid, Snap).
Feel free to contribute!  

## Useful One Line Checks

Check absence of image file.

```bash
$ for d in `find repository -maxdepth 2 -mindepth 2 -type d  ! -name '.*'` ; do [ ! -e $d/image.svg ] && echo -n "$d - " && cat $d/pt.txt && echo "" ; done
...
```

# V Env

```
$ python -m venv venv 
...
$ source ./venv/bin/activate
$ ./venv/bin/pip install gtts
...


```