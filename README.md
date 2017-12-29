# AIS [![Build Status](https://travis-ci.org/AdrianKoshka/AIS.svg?branch=master)](https://travis-ci.org/AdrianKoshka/AIS)
Automatic Installation Scripts.

## Structure

```
.
├── anaconda-kickstart
├── clc
├── docker-compose
├── mkosi
└── VyOS
```

- `anaconda-kickstart` directory with [kickstart](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-syntax.html) scripts.
- `clc` directory with for [Container Linux](https://coreos.com/why/) configs before they go into the [Container Linux config transpiler](https://coreos.com/os/docs/latest/overview-of-ct.html)
- `mkosi` where my [mkosi](http://0pointer.net/blog/mkosi-a-tool-for-generating-os-images.html) templates are kept.
- `VyOS` where I store my [VyOS](https://vyos.io/) templates.

## [License](LICENSE): ![GPLv3 logo](https://www.gnu.org/graphics/gplv3-127x51.png)

## Authors:

- [Adrian Lucrèce Céleste](https://github.com/AdrianKoshka)
