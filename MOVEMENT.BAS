   10 MODE 2
   20 REM Define a custom character
   30 REM in this case a 8x8 rectangle
   40 VDU 23,224,255,255,255,255,255,255,255,255
   50 REM Define player variable
   60 P$=CHR$(224)
   70 REM Instantiate variables for moving the player
   80 X%=0:Y%=0:LASTX%=0:LASTY%=0
   90 A%=INKEY(0):REM Get keyboard input from the player
  110 VDU 23,1,0:REM Disable cursor
  120 IF A%=21 THEN X%=X%+1:REM 21 right arrow key
  130 IF A%=8 THEN X%=X%-1:REM 8 left arrow key
  140 IF A%=10 THEN Y%=Y%+1:REM 10 up arrow key
  150 IF A%=11 THEN Y%=Y%-1:REM 11 down arrow key
  160 REM If the X and Y variables did not change do nothing
  170 REM else clear the screen
  180 IF X%=LASTX% AND Y%=LASTY% THEN ELSE CLS
  190 REM Keep the player within screen bounds
  200 IF X%>39 THEN X%=39
  210 IF X%<0 THEN X%=0
  220 IF Y%>23 THEN Y%=23
  230 IF Y%<0 THEN Y%=0
  240 LASTX%=X%:LASTY%=Y%:REM Store last X and Y
  250 REM Print the player at the X,Y position
  260 PRINT TAB(X%,Y%)P$
  270 GOTO 90
