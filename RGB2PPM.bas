   10 REM Convert binary RGB file to PPM (Portable Pixmap Format)
   20 INPUT "Enter input file name: ", file_in$
   30 INPUT "Enter output file name: ", file_out$
   40 REM Array of size 16*16*3 to hold rgb data of the 16 by 16 image
   50 DIM rgb_data%(768)
   60 fnum=OPENIN file_in$:REM Open the selected input file
   70 FOR i% = 0 TO 767
   80   REM Read a byte from file
   90   tmp = BGET#fnum
  100   REM Cast it to an integer and store it in the rgb_data array
  110   rgb_data%(i%) = INT(tmp)
  120 NEXT i%
  130 CLOSE#fnum : REM Close the input file
  140 out=OPENOUT file_out$: REM Open the output file
  150 PRINT#out,"P3":REM Write the P3 magic number for identifying the PPM file type
  160 PRINT#out,"16 16":REM Write the image dimentions
  170 PRINT#out,"255":REM Print the maximum value of the following RGB data
  180 FOR i% = 0 TO 767 STEP 3
  190   PRINT#out,STR$(rgb_data%(i%))+" "+STR$(rgb_data%(i%+1))+" "+STR$(rgb_data%(i%+2))
  200 NEXT i%
  210 CLOSE#out
  220 END
