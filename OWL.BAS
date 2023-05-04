   10 REM Sprite Demo
   20 :
   30 MODE 2  : REM set screenmode to 2 320x200 pixels 64 colors
   40 SW%=320 : REM Screen Width
   50 SH%=200 : REM Screen Height
   60 C%=16 : REM Number of sprites displayed on screen
   70 :
   80 REM Create a simple bitmap
   90 :
  100 VDU 23,27,0,0: REM Select bitmap 0
  110 READ W%,H% : REM READ the width and height of the image in the DATA block (line 530)
  120 VDU 23,27,1,W%;H%; : REM Turn of the cursor
  130 FOR I%=1 TO W%*H% : REM Iterate over the image data and set the color values
  140   READ B%
  150   VDU B%,B%,B%,B%
  160 NEXT
  170 :
  180 REM Set up some sprites (arrays X%, Y%, XP%, YP% of size C%-1)
  190 :
  200 DIM X%(C%-1),Y%(C%-1),XP%(C%-1),YP%(C%-1)
  210 :
  220 FOR I%=0 TO C%-1
  230   X%(I%)=RND(SW%): REM Set X%(I%) to a random value between 0 and the screen width
  240   Y%(I%)=RND(SH%): REM Set Y%(I%) to a random value between 0 and the screen width
  250   XP%(I%)=1: REM Initialize XP%(I%) to 1
  260   YP%(I%)=1: REM Initialize XP%(I%) to 1
  270   VDU 23,27,4,I%: REM Select sprite I%
  280   VDU 23,27,5: REM Clear frames for current sprite
  290   VDU 23,27,6,0: REM Add bitmap 0 as frame 0 of sprite
  300   VDU 23,27,11: REM Show the sprite
  310 NEXT
  320 VDU 23,27,7,C%: REM Activate 16 sprites
  330 :
  340 REM Move the sprite
  350 :
  360 FOR I%=0 TO C%-1
  370   VDU 23,27,4,I%,23,27,13,X%(I%);Y%(I%);: REM Select sprite I% and move it to X%(I%) and Y%(I%)
  380   X%(I%)=X%(I%)+XP%(I%): REM Update the sprites X position for next time
  390   Y%(I%)=Y%(I%)+YP%(I%): REM Update the sprites Y position for next time
  400   IF X%(I%)<0 OR X%(I%)>SW% THEN XP%(I%)=-XP%(I%)
  410   IF Y%(I%)<0 OR Y%(I%)>SH% THEN YP%(I%)=-YP%(I%)
  420 NEXT
  430 :
  440 *FX 19: REM Wait for vertical blank retrace
  450 VDU 23,27,15: REM Refresh the sprites
  460 :
  470 GOTO 360
  480 :
  490 STOP
  500 :
  510 REM Bitmap data
  520 :
  530 DATA 17,21
  540 :
  550 DATA 255,0,255,0,255,0,255,0,255,0,255,0,255,0,255,0,255
  560 DATA 0,255,0,0,0,0,0,255,0,255,0,0,0,0,0,255,0
  570 DATA 255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255
  580 DATA 0,0,0,255,0,255,0,0,0,0,0,255,0,255,0,0,0
  590 DATA 255,0,0,0,255,0,0,0,0,0,0,0,255,0,0,0,255
  600 DATA 0,255,0,0,0,0,0,255,0,255,0,0,0,0,0,255,0
  610 DATA 255,0,255,0,0,0,0,0,255,0,0,0,0,0,255,0,255
  620 DATA 0,255,0,255,0,0,0,0,0,0,0,0,0,255,0,0,0
  630 DATA 255,0,255,0,255,0,255,0,255,0,255,0,255,0,0,0,255
  640 DATA 0,255,0,255,0,255,0,255,0,0,0,0,0,0,0,0,0
  650 DATA 255,0,255,0,255,0,255,0,255,0,0,0,0,0,0,0,255
  660 DATA 0,255,0,255,0,255,0,255,0,0,0,0,0,0,0,0,0
  670 DATA 0,0,255,0,255,0,255,0,255,0,0,0,0,0,0,0,255
  680 DATA 0,0,0,255,0,255,0,255,0,255,0,0,0,0,0,0,0
  690 DATA 0,0,0,0,255,0,255,0,255,0,255,0,0,0,0,0,255
  700 DATA 0,0,0,0,0,255,0,255,0,255,0,255,0,0,0,0,0
  720 DATA 0,0,0,0,0,0,255,0,255,0,255,0,255,0,0,0,255
  730 DATA 0,0,0,0,0,0,0,255,0,0,0,255,0,255,0,0,0
  740 DATA 0,0,0,0,0,0,255,0,0,0,255,0,0,0,255,0,255
  750 DATA 0,255,0,255,0,255,0,255,0,255,0,255,0,0,0,255,0
  760 DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
