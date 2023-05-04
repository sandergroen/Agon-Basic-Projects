   10 MODE 2
   20 VDU 23, 1, 0
   30 index = 0
   40 ycount = 0
   50 xcount = 0
   60 width=1280
   65 modewidth =320
   70 heigth=1024
   75 modeheight = 200
   80 numColors = 64
   90 xblocks = INT(modewidth/numColors)
  100 yblocks = INT(modeheight/numColors)
  110 xratio = width/modewidth
  120 xratio = heigth/modeheight
  120 FOR Y=0 TO (modeheight - 1)
  130   IF ycount = yblocks THEN index = (index+1) MOD numColors
  140   IF ycount = yblocks THEN ycount = 0
  150   ycount = ycount + 1
  160   FOR X=0 TO (modewidth - 1)
  170     IF xcount = xblocks THEN index = (index+1) MOD numColors
  180     IF xcount = xblocks THEN xcount = 0
  190     xcount = xcount + 1
  200     PROC_DrawPixel((X*xratio),(Y*xratio),index)
  210   NEXT X
  220 NEXT Y
  230 END
  240 DEF PROC_DrawPixel(x,y,color)
  250 GCOL 0,color
  260 PLOT 69,x,y
  270 ENDPROC
