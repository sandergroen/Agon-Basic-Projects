   10 MODE 2
   20 VDU 23,227,170,85,170,85,170,85,170,85
   30 COLOUR 2
   40 COLOUR 182
   50 VDU 23,1,0
   60 FOR Y=0 TO 23
   70   FOR X=0 TO 39
   80     PRINT TAB(X,Y)CHR$(227)
   90   NEXT X
  100 NEXT Y
