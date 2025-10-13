# hanyu_toy_repository

This repository is used by HanYu Toy application (Windows, Andoid, Snap).
Feel free to contribute!  

## Useful One Line Checks

Check absence of image file.

```bash
$ for d in `find repository -maxdepth 2 -mindepth 2 -type d  ! -name '.*'` ; do [ ! -e $d/image.svg ] && echo -n "$d - " && cat $d/pt.txt && echo "" ; done
...
```

## Google API

Verificar:

* Ir no Google Cloud Console
* Selecionar o projeto correto no topo da página.
  * IAM & Administração → Contas de Serviço.
  * Aba Chaves (Adicionar chave → Criar chave.)
  * Ver a opção JSON.

Se não tiver, gerar uma chave de credenciais JSON para a conta de serviço:
Chave: achar algo do tipo `XXx_xxxSfhc` no google api console.
`export GOOGLE_APPLICATION_CREDENTIALS="~/clinio-chave.json"`

## Virtual Env

Ajuste para uso de Python local.

```bash
$ python -m venv venv 
...
$ source ./venv/bin/activate
$ ./venv/bin/pip install gtts
$ ./venv/bin/pip install google-cloud-texttospeech 

$ ./venv/bin/python enhanced_google_sound.py 鱼
...

```
