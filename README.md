# MyStellinaPostProcess using Siril

**Stellina_Create_MasterDark_&_MasterFlat.ssf** creates master-dark.fit and master-flat.fit.

**Stellina_Stack_Lights.ssf** stacks lights.



Prerequisites are:
* use fits with same Bayer pattern
* create following arborescence
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
```

Doc to add scripts to Siril: https://free-astro.org/index.php?title=Siril:scripts
