# MyStellinaPostProcess using Siril

**Stellina_Create_MasterDark_&_MasterFlat.ssf** creates master-dark.fit and master-flat.fit.

**Stellina_Stack_Lights.ssf** stacks lights.



Prerequisites are:
- use fits with same Bayer pattern
- create following arborescence
```
 C:\TEMP\MYSTELLINA
├───L
│   └───S
│       ├───DARKFLATS
│       │   └───SRC
│       ├───DARKS
│       │   └───SRC
│       ├───FLATS
│       │   └───SRC
│       ├───IMAGES
│       │   └───SRC
│       └───MASTER
└───Temp

```

How to use scripts in Siril: https://free-astro.org/index.php?title=Siril:scripts

List of Siril commands https://free-astro.org/index.php/Siril:Commands#Siril_command_line_functions_reference


# MyStellinaPostProcess using VBscript

**Parse_jpeg_for_mosaic.vbs** parses all your Stellina files to find best jpeg regarding all re-framings for a specific target

Prerequisite is:
exiftool.exe from https://exiftool.org/

![Tuto](https://github.com/ShamanFlamingo/MyStellinaPostProcess/blob/master/materials/Parse_jpeg_for_mosaic.mp4)
