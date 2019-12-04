# container-libpostal

A libpostal container with Python binding installed.

Currently it is built from https://github.com/openvenues/libpostal/commit/610b5e12de946679a62591a51c3f816cf58bc542.

Features:
- Use Python 3.7.5 Debian stretch as the base
- The libpostal is compiled in the docker build

## How to use
1. Currently it can be used as a base image.
2. To test it:

```shell script
docker run -it container-libpostal /bin/bash
```

In the docker console, type:
```shell script
python
```

```python
from postal.expand import expand_address
expand_address('Quatre vingt douze Ave des Champs-Élysées')

from postal.parser import parse_address
parse_address('The Book Club 100-106 Leonard St, Shoreditch, London, Greater London, EC2A 4RH, United Kingdom')
```