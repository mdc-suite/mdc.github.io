---
title: "Convert bitstream to binary for fpgautil"
permalink: /miscellaneous/bitstream-to-binary

toc: true
---

If you want to load a bitstream at runtime from your OS, using `fpgautil`, you need to convert it into a binary version.

Install `bootgen`, a Xilinx tool that lets to stitch binary files together and generate device boot images:
```bash
$ sudo apt-get install bootgen-xlnx
    
# How to use it
$ bootgen --help
```

Create a directory into `build/` for your bitstreams:
```bash
$ mkdir build/bitstream/<project-name>
$ cd build/bitstream/<project-name>

# copy into this directory your bitstream
```

Create a `<bif-file>.bif` with this content:
```
# <bif-file>.bif content
all:
{
    <absolute-path-to-bitstream-file>
}
```
The execute `bootgen`:
```bash
# Generate a binary file from bitstream (arch-family = zynqmp for zynqmp family as zcu102)
$ bootgen -image <bif-file>.bif -arch <arch-family> -o <bitname>.bit.bin
```

Now `<bitname>.bit.bin` is available into the work directory, it can be copied into the SD card and loaded through `fpgautil`.

**Immagine degli step effettuati**
