
   10 REM  SNOW'VADERS
   20 REM MARTIN HOLLIS
   30 REM (c) Copyright
   40 REM  MICRO USER
   41 ONERRORRUN
   42 *FX200,2
   43 REM
   50 FLSH%=-1:JNGLE%=-1
   60 DIMMACHCODE 500:PROCass:MODE4
   70 VDU23;8202;0;0;0;:PROCsnva
   80 REM*SANTA
   90 ENVELOPE1,130,-3,0,6,84,10,72,0,0,0,-5,126,0
  100 ENVELOPE2,132,0,0,0,0,0,20,0,0,0,-4,126,0
  110 VDU23,224,0,0,3,7,15,5,4,10
  120 VDU23,225,62,255,253,250,248,80,16,40
  130 VDU23,226,29,45,94,174,175,79,7,15
  140 VDU23,227,222,217,189,185,126,248,112,120
  150 REM*SNOWMAN
  160 VDU23,228,7,15,9,13,15,12,7,30
  170 VDU23,229,224,240,144,176,240,48,224,120
  180 VDU23,230,62,127,126,126,127,126,62,31
  190 VDU23,231,124,254,126,126,254,126,124,248
  200 REM*REINDEER'S LEGS
  210 VDU23,236,31,63,95,139,4,2,2,2
  220 VDU23,237,252,248,248,208,8,4,4,4
  230 VDU23,238,31,63,95,139,4,2,4,8
  240 VDU23,239,252,248,248,208,8,4,8,16
  250 VDU23,240,31,63,95,139,8,8,16,32
  260 VDU23,241,252,248,248,208,16,16,32,64
  270 REM*BULLETS
  280 VDU23,242,0,62,127,127,127,127,127,62
  290 VDU23,243,0,24,24,24,24,24,24,0
  300 REM*IGLOO
  310 VDU23,244,0,0,1,0,14,30,30,0
  320 VDU23,245,1,55,247,0,254,254,254,0
  330 VDU23,246,247,247,247,0,254,254,254,0
  340 VDU23,247,128,244,247,0,254,254,254,0
  350 VDU23,248,0,0,128,0,240,248,248,0
  360 VDU23,249,55,55,119,0,126,126,254,0
  370 VDU23,250,244,244,246,0,254,254,255,0
  380 VDU23,251,246,245,243,7,247,239,239,15
  390 VDU23,252,126,255,255,255,195,129,0,0
  400 VDU23,253,119,183,215,224,239,247,247,240
  410 VDU23,254,247,247,247,0,127,127,127,0
  420 CLS:PROCinstr:MODE5
  430 DIMV$(7),S$(7),C%(6),H%(1),REIN$(2),HI%(5),HI$(5)
  440 RESTORE:FORA%=0TO6:READC%(A%):NEXT
  450 SA$=CHR$17+CHR$1+CHR$224+CHR$225+CHR$10+CHR$8+CHR$8+CHR$226+CHR$227
  460 TS$=CHR$17+CHR$3+STRING$(4,CHR$228+CHR$229+CHR$32)+CHR$228+CHR$229
  470 BS$=CHR$17+CHR$3+STRING$(4,CHR$230+CHR$231+CHR$32)+CHR$230+CHR$231
  480 TV$=CHR$17+CHR$2+STRING$(4,CHR$232+CHR$233+CHR$32)+CHR$232+CHR$233
  490 BV$=CHR$17+CHR$2+STRING$(4,CHR$234+CHR$235+CHR$32)+CHR$234+CHR$235
  500 S$=STRING$(4,CHR$32+CHR$32+CHR$9)+CHR$32+CHR$32
  510 SP$=CHR$32+CHR$32+CHR$8+CHR$8+CHR$10+CHR$32+CHR$32
  520 REINH$=CHR$255+CHR$32+CHR$32+CHR$255
  530 REIN$(0)=CHR$236+CHR$237+CHR$32+CHR$236+CHR$237
  540 REIN$(1)=CHR$238+CHR$239+CHR$32+CHR$238+CHR$239
  550 REIN$(2)=CHR$240+CHR$241+CHR$32+CHR$240+CHR$241
  560 REPEAT:VDU23;8202;0;0;0;
  570 !&80=0:DEAD%=0:LEVEL%=0:OHIT%=0:SCORE%=0:LIVES%=3
  580 REPEAT:REPEAT:IFDEAD%=-1 LIVES%=LIVES%-1
  590 FORA%=0TO7:S$(A%)=S$:NEXT
  600 PROCvdu(LEVEL%)
  610 FORA%=0TO4STEP4:V$(A%)=TV$:V$(A%+1)=BV$:V$(A%+2)=TS$:V$(A%+3)=BS$:NEXT
  620 LDOWN%=-1:LEFT%=20:X%=9
  630 IFLIVES%<0 GOTO750
  640 CLS:PROCigloo:PRINTTAB(X%,27);SA$
  650 L%=0:M%=3:DIR%=1:SH%=4:WI%=14:DE%=10:DEP%=7:RX%=-1:RT%=0:RP%=LEVEL%*10+20+RND(20):IFDEAD%=0 OHIT%=OHIT%+(LEVEL%+1)MOD2:IFOHIT%>3 OHIT%=OHIT%-3
  660 HIT%=OHIT%:DEAD%=0:PROCv:RESTORE3070:REPEAT
  670 RP%=RP%-1:IFRP%=0 RX%=0
  680 IFRX%>-1 PROCreindeer
  690 PROCmb:PROCmb:PROCmoveman
  700 DOWN%=0:IFLDOWN%=0ANDFNR NDIR%=-1:DOWN%=-1 ELSEIFLDOWN%=0ANDFNL DOWN%=-1:NDIR%=1
  710 R%=FNR:PROCmb:PROCb:PROCmb:PROCmoveman
  720 IFDOWN% DIR%=NDIR%:IFLEVEL%>5ORR%=-1 M%=M%+1 ELSEL%=L%+DIR%
  730 PROCv:LDOWN%=DOWN%:PROCmb:PROCmb:PROCmoveman
  740 UNTILLEFT%=0ORDEAD%ORLIVES%<0
  750 !&80=0:IFDEAD% PROCsplat
  760 IFDEAD%=0 LEVEL%=LEVEL%+1
  770 UNTILLEVEL%=12ORLIVES%<0
  780 IFLEVEL%=12ANDLIVES%>0 CLS:COLOUR1:PRINTSPC(5);"Well  Done":COLOUR3:PRINT''SPC(6)"You have"''SPC(4);"successfully"''SPC(5);"beaten all"''SPC(3);"the snowvaders"''':COLOUR1:PRINTSPC(2);"Now try again !!":LEVEL%=0:FORA=0TO10000:NEXT
  790 UNTILLIVES%<0:MODE4:PROChighscore:PROCspc:MODE5:UNTIL0
  800 DEFPROCvdu(N%)
  810 S%=232:IFN%<6 VDU19,2,C%(N%);0;:ONN%+1 GOSUB890,950,1010,1070,1130,1190:S%=228:GOSUB890:ENDPROC
  820 ONN%-4 GOSUB890,950,1010,1070,1130,1190,1250
  830 S%=228:ONN%-4 GOSUB890,950,1010,1070,1130,1190,1250
  840 VDU19,2,C%(N%-5);0;
  850 TS$=CHR$17+CHR$2+STRING$(4,CHR$228+CHR$229+CHR$32)+CHR$228+CHR$229
  860 BS$=CHR$17+CHR$2+STRING$(4,CHR$230+CHR$231+CHR$32)+CHR$230+CHR$231
  870 ENDPROC
  880 REM*SNOWMAN
  890 VDU23,S%,7,15,9,13,15,12,7,30
  900 VDU23,S%+1,224,240,144,176,240,48,224,120
  910 VDU23,S%+2,62,127,126,126,127,126,62,31
  920 VDU23,S%+3,124,254,126,126,254,126,124,248
  930 RETURN
  940 REM*TREE
  950 VDU23,S%,1,3,7,3,7,15,7,15
  960 VDU23,S%+1,0,128,192,128,192,224,192,224
  970 VDU23,S%+2,25,13,31,60,24,63,127,3
  980 VDU23,S%+3,48,96,240,120,48,248,252,128
  990 RETURN
 1000 REM*TEDDY
 1010 VDU23,S%,24,39,41,27,30,12,7,111
 1020 VDU23,S%+1,48,200,40,176,240,96,192,236
 1030 VDU23,S%+2,127,127,63,15,15,31,60,56
 1040 VDU23,S%+3,252,252,248,224,224,240,120,56
 1050 RETURN
 1060 REM*ROBOT
 1070 VDU23,S%,32,23,12,5,7,2,15,122
 1080 VDU23,S%+1,130,244,152,208,240,32,248,175
 1090 VDU23,S%+2,127,106,111,74,31,40,48,120
 1100 VDU23,S%+3,255,171,251,169,252,10,6,15
 1110 RETURN
 1120 REM*STOCKING
 1130 VDU23,S%,0,0,0,0,0,0,0,0
 1140 VDU23,S%+1,124,108,84,108,84,108,84,108
 1150 VDU23,S%+2,0,0,1,62,85,106,85,63
 1160 VDU23,S%+3,84,172,84,172,84,172,84,248
 1170 RETURN
 1180 REM*ESKIMO
 1190 VDU23,S%,7,15,16,18,8,28,99,160
 1200 VDU23,S%+1,192,224,16,144,32,112,140,10
 1210 VDU23,S%+2,160,160,96,19,14,26,34,30
 1220 VDU23,S%+3,10,10,12,144,224,176,136,240
 1230 RETURN
 1240 REM*SANTA
 1250 VDU23,S%,0,0,3,7,15,5,4,10
 1260 VDU23,S%+1,62,255,253,248,248,80,16,40
 1270 VDU23,S%+2,29,61,126,238,239,79,7,14
 1280 VDU23,S%+3,222,217,189,185,126,248,112,56
 1290 RETURN
 1300 DATA7,2,3,4,5,6,1
 1310 DEFFNR:?&71=0:CALLRI:IF?&70=1 =-1 ELSE=0
 1320 DEFFNL:?&71=0:CALLLE:IF?&70=1 =-1 ELSE=0
 1330 DEFFNCHR(Q,R):VDU31,Q,R:A%=135:Z%=USR(&FFF4):Z%=Z%AND &FFFF:Z%=Z%DIV &100:=Z%
 1340 DEFPROCigloo
 1350 VDU23,255,28,62,255,255,255,255,255,0
 1360 REM LAND
 1370 COLOUR3
 1380 PRINTTAB(3,23);
 1390 VDU244,245,246,247,248,32,32,32,32,244,245,246,247,248,13,10
 1400 VDU32,32,32,249,246,246,246,250,32,32,32,32,249,246,246,246,250,13,10
 1410 VDU32,32,32,246,251,252,253,254,32,32,32,32,246,251,252,253,254
 1420 PRINTTAB(0,29);STRING$(20,CHR$255);CHR$32;"LEVEL";CHR$32;CHR$17;CHR$1;LEVEL%+1;CHR$17;CHR$3'CHR$32;"SCORE";CHR$32;CHR$17;CHR$1;SCORE%;TAB(13,30);STRING$(LIVES%,SA$+CHR$11);
 1430 VDU23,255,0,0,5,34,100,20,15,15
 1440 ENDPROC
 1450 DEFPROCmoveman:IFINKEY(-99) PROCmfire
 1460 PROCmusic
 1470 MX%=0:IFINKEY(-98) MX%=-1 ELSEIFINKEY(-67) MX%=1
 1480 IFMX%<>0ANDX%+MX%>0ANDX%+MX%<19 PRINTTAB(X%,27);SP$:X%=X%+MX%
 1490 PRINTTAB(X%,27);SA$
 1500 IFINKEY(-82)THEN*FX210,0
 1510 IFINKEY(-17)THEN*FX210,1
 1520 IFINKEY(-102) JNGLE%=-1 ELSEIFINKEY(-86) JNGLE%=0
 1530 IFINKEY(-68) FLSH%=-1 ELSEIFINKEY(-84) FLSH%=0
 1540 PROCmb:ENDPROC
 1550 DEFPROCmb
 1560 IFH%(1)=0 ENDPROC
 1570 COLOUR1:CH%=FNCHR(H%(0),H%(1)-1)
 1580 IFCH%<>32 GOTO1630
 1590 PRINTTAB(H%(0),H%(1)-1);CHR$243:H%(1)=H%(1)-1
 1600 PRINTTAB(H%(0),H%(1)+1);CHR$32
 1610 IFH%(1)=0 PRINTTAB(H%(0),H%(1));" "
 1620 ENDPROC
 1630 PRINTTAB(H%(0),H%(1));" ":IFCH%>131ANDCH%<140ORCH%>147ANDCH%<159ORCH%>139ANDCH%<146 ELSEH%(1)=0:SOUND&11,0,0,0:ENDPROC
 1640 IFCH%>147ANDCH%<159 H%(1)=H%(1)-1:PRINTTAB(H%(0),H%(1));" ":H%(1)=0:SOUND&11,0,0,0:SOUND&10,-15,4,3:ENDPROC
 1650 IFCH%>139ANDCH%<146 PROCscoreup(80*FNSCTI):SOUND&10,2,6,10:H%(1)=0:RX%=-1:RT%=0:RP%=LEVEL%*10+20+RND(20):PRINTTAB(0,0);SPC(40):ENDPROC
 1660 HIT%=HIT%-1:IFHIT%>0 H%(1)=0:SOUND&12,2,4,10:SOUND&11,0,0,0:ENDPROC ELSE HIT%=OHIT%
 1670 AR%=H%(1)-M%:AR%=AR%DIV3*2+AR%MOD3-1:CR%=H%(0)-L%+2:CR%=CR%DIV2*2:AR%=AR%DIV2*2:CH1$=MID$(V$(AR%),CR%+1,1):CH2$=MID$(V$(AR%),CR%+2,1)
 1680 IFCH1$=CHR$229ORCH1$=CHR$233 CR%=CR%-1 ELSEIFCH2$=CHR$228ORCH2$=CHR$232 CR%=CR%+1
 1690 V$(AR%)=LEFT$(V$(AR%),CR%)+CHR$32+CHR$32+MID$(V$(AR%),CR%+3)
 1700 V$(AR%+1)=LEFT$(V$(AR%+1),CR%)+CHR$32+CHR$32+MID$(V$(AR%+1),CR%+3)
 1710 CR%=CR%-2
 1720 S$(AR%)=LEFT$(S$(AR%),CR%)+CHR$9+CHR$9+MID$(S$(AR%),CR%+3)
 1730 S$(AR%+1)=LEFT$(S$(AR%+1),CR%)+CHR$9+CHR$9+MID$(S$(AR%+1),CR%+3)
 1740 LEFT%=LEFT%-1:SOUND&10,2,6,10:SOUND&11,0,0,0:IFFLSH%=0 GOTO1760
 1750 FORA=0TO10:VDU19,0,1,0,0,0:FORB=0TO10:NEXT:VDU19,0,0,0,0,0:NEXT
 1760 PROCscoreup(10*(4-AR%DIV2)*FNSCTI)
 1770 PRINTTAB(H%(0)-1,H%(1)-2);CHR$32+CHR$32+CHR$32;TAB(H%(0)-1,H%(1)-1);CHR$32+CHR$32+CHR$32;TAB(H%(0)-1,H%(1));CHR$32+CHR$32+CHR$32
 1780 H%(1)=0:ENDPROC
 1790 DEFPROCmfire
 1800 IFH%(1)>0 ENDPROC
 1810 H%(1)=26:IFRX%=19 RX%=0
 1820 H%(0)=X%:SOUND&11,1,252,34:ENDPROC
 1830 DEFPROCv
 1840 IFL%=-1 L%=L%+1:FORLO%=0TO7:V$(LO%)=LEFT$(V$(LO%),2)+MID$(V$(LO%),4):S$(LO%)=MID$(S$(LO%),2):NEXT:WI%=WI%-1
 1850 FORLO%=0TO7
 1860 IFMID$(V$(LO%),3)=STRING$(LEN(V$(LO%))-2,CHR$32) V$(LO%)="":NEXT ELSENEXT
 1870 IFV$(DEP%)="" V$(DEP%)=CHR$11:V$(DEP%-1)=CHR$11:S$(DEP%)=CHR$11:S$(DEP%-1)=CHR$11:DEP%=DEP%-2:DE%=DE%-3
 1880 PRINTTAB(L%,M%);V$(0)
 1890 PRINTTAB(L%,M%+1);V$(1)
 1900 PRINTTAB(L%,M%+2);S$(1)
 1910 PRINTTAB(L%,M%+3);V$(2)
 1920 PRINTTAB(L%,M%+4);V$(3)
 1930 PRINTTAB(L%,M%+5);S$(3)
 1940 PROCmb
 1950 PRINTTAB(L%,M%+6);V$(4)
 1960 PRINTTAB(L%,M%+7);V$(5)
 1970 PRINTTAB(L%,M%+8);S$(5)
 1980 PRINTTAB(L%,M%+9);V$(6)
 1990 PRINTTAB(L%,M%+10);V$(7);
 2000 PROCmovebs
 2010 ENDPROC
 2020 DEFPROCb
 2030 PRINTTAB(L%,M%);S$(0)
 2040 PRINTTAB(L%,M%+1);S$(1)
 2050 PRINTTAB(L%,M%+3);S$(2)
 2060 PRINTTAB(L%,M%+4);S$(3)
 2070 PROCmb
 2080 PRINTTAB(L%,M%+6);S$(4)
 2090 PRINTTAB(L%,M%+7);S$(5)
 2100 PRINTTAB(L%,M%+9);S$(6)
 2110 PRINTTAB(L%,M%+10);S$(7);
 2120 PROCmovebs
 2130 ENDPROC
 2140 DEFPROCmovebs:IF?&81=0OR?&83=0 GOTO2170
 2150 CALLMBLLTS:IF?&70=ASC("D") DEAD%=-1 ELSEDEAD%=0
 2160 ENDPROC
 2170 B%=0:REPEAT:B%=B%+1:A%=RND(WI%):UNTILA%+L%<19ORB%>10
 2180 IFB%=10ORA%+L%>18ORL%<2 ENDPROC
 2190 B%=RND(2):IF?&81=0 Q%=&80 ELSEIF?&83=0 Q%=&82
 2200 ?Q%=A%+L%:?(Q%+1)=M%+DE%+B%:ENDPROC
 2210 DEFPROCscoreup(U%)
 2220 SCORE%=SCORE%+U%:PRINTTAB(7,31);SCORE%;:ENDPROC
 2230 DEFPROCreindeer
 2240 RPR%=ABS(RT%-2):RT%=(RT%+1)MOD4:COLOUR1:IFRPR%=1 RX%=RX%+1
 2250 IFRX%=19 RX%=-1:RP%=20*LEVEL%+10+RND(20):RT%=0:PRINTTAB(0,0);SPC(40);:ENDPROC
 2260 CUT%=RX%-14:IFCUT%<1 GOTO2290
 2270 PRINTTAB(RX%+1,0);CHR$32;LEFT$(REINH$,LEN(REINH$)-CUT%);TAB(RX%,1);CHR$32;LEFT$(REIN$(RPR%),LEN(REIN$(RPR%))-CUT%)
 2280 ENDPROC
 2290 PRINTTAB(RX%+1,0);CHR$32;REINH$;TAB(RX%,1);CHR$32;REIN$(RPR%):ENDPROC
 2300 DEFPROCmusic:PROCplay(0):ENDPROC
 2310 DEFPROCplay(S%)
 2320 CALLCLR:IF?&D00=0ORJNGLE%=0 ENDPROC
 2330 READD$:IFD$="*"ANDS%=0 RESTORE3070:GOTO2330 ELSEIFD$="*" ENDPROC
 2340 D%=EVAL("&"+D$):IFS%=0 SOUND3,-10,D%MOD256,D%DIV256:SOUND3,0,0,0:ENDPROC
 2350 SOUND2,-15,D%MOD256-96,D%DIV256*2
 2360 SOUND3,-15,D%MOD256-48,D%DIV256*2
 2370 SOUND2,0,0,0:SOUND3,0,0,0:ENDPROC
 2380 DEFFNSCTI
 2390 IFLEVEL%=10ORLEVEL%=11 T%=6
 2400 IFLEVEL%<10 T%=5
 2410 IFLEVEL%<8 T%=4
 2420 IFLEVEL%<6 T%=3
 2430 IFLEVEL%<4 T%=2
 2440 IFLEVEL%<2 T%=1
 2450 =T%
 2460 DEFPROCsplat:*FX15
 2470 RESTORE3090:XS%=X%*64-8:GCOL0,3
 2480 FORPX%=XS%TOXS%+128STEP8:D%=0
 2490 FORY%=92+64TO92STEP-4
 2500 IFPOINT(PX%,Y%)=1ANDD%=0 PLOT69,PX%,Y%+4:PLOT69,PX%,Y%+8:D%=-1
 2510 PROCplay(1):NEXT:NEXT:REPEAT:PROCplay(1)
 2520 XP%=XS%+RND(16)*8:YP%=92+RND(16)*4
 2530 IFPOINT(XP%,YP%)=1 PLOT69,XP%,YP%
 2540 UNTILD$="*"ORJNGLE%=0:ENDPROC
 2550 DEFPROCass:FORA%=0TO2STEP2:P%=MACHCODE:[OPT A%
 2560 .REACHR:LDA#31:JSR&FFEE:TXA
 2570 JSR&FFEE:TYA:JSR&FFEE:LDA#135
 2580 JSR&FFF4:TXA:RTS
 2590 .SET:LDX #1:STX &70:RTS
 2600 .RI:LDA #0:STA &70:LDA &71
 2610 STA &72:LDA #27:ADC &71:STA &71
 2620 .LOOP1:DEC &71:LDX #19:LDY &71
 2630 JSR REACHR:CMP #229-96:BEQ SET:CMP #233-96
 2640 BEQ SET:LDA &71:CMP &72:BNE LOOP1
 2650 RTS
 2660 .LE:LDA#0:STA&70:LDA&71
 2670 STA&72:LDA#27:ADC&71:STA&71
 2680 .LOOP2:DEC&71:LDX#0:LDY&71
 2690 JSR REACHR:CMP #230-96:BEQ SET:CMP #234-96
 2700 BEQ SET:LDA &71:CMP &72:BNE LOOP2
 2710 RTS
 2720 .MBLLTS:LDY #0:.LOOP3:LDA #&81,Y
 2730 BEQ RTN3:LDA #31:JSR &FFEE:LDA &80,Y
 2740 TAX:JSR&FFEE:LDA&81,Y:STY&71
 2750 TAY:JSR&FFEE:LDA#32:JSR&FFEE
 2760 INY:JSR REACHR:LDY &71:CMP #148
 2770 BCS MIGLOO:.RTN:CMP #128:BCS MSANTA
 2780 .RTN2:LDA &81,Y:CMP #28:BCS NDU
 2790 CLC:ADC #1:STA &81,Y:LDA #31
 2800 JSR&FFEE:LDA&80,Y:JSR&FFEE:LDA&81,Y
 2810 JSR &FFEE:LDA #17:JSR &FFEE:LDA #3
 2820 JSR &FFEE:LDA #146:JSR &FFEE:.RTN3
 2830 INY:INY:CPY #4:BCC LOOP3:RTS
 2840 .MIGLOO:CMP #159:BCS RTN:LDA #31
 2850 JSR &FFEE:LDA &80,Y:JSR &FFEE:LDX &81,Y:INX:TXA:JSR &FFEE:LDA #32
 2860 JSR &FFEE:JSR NDU:JMP RTN3:.MSANTA
 2870 CMP #132:BCS RTN2:LDA #68:STA &70
 2880 JSR NDU:JMP RTN3:.NDU:LDA #0
 2890 STA &81,Y:JMP RTN3:.CO:LDA #0
 2900 STA &73:LDA &70:STA &71:ADC #15
 2910 STA &70:.LOOP4:LDX &71:LDY &72
 2920 JSR REACHR:CMP #134:BEQ ADD:CMP #138
 2930 BEQ ADD:.RTN4:INC &71:LDA &71
 2940 CMP &70:BNE LOOP4:RTS
 2950 .ADD:INC &73:JMP RTN4:.PCK
 2960 LDA &70:STA &71:ADC #10:STA &70
 2970 LDA #0:STA &73:.LOOP5:LDX &71
 2980 LDY &72:JSR REACHR:CMP #134:JSR ADDC
 2990 CMP #138:JSR ADDC:.RTN5:INC &71
 3000 LDA &71:CMP &70:BNE LOOP4:RTS
 3010 .ADDC:INC &73:LDA &73:CMP &74
 3020 BNE RTN5:LDA &71:LDX &75:STA &80,X
 3030 LDA &72:STA &81,X:INC &81,X:JMP RTN5
 3040 .CLR:SEI:LDA #128:LDX #248
 3050 JSR&FFF4:STX &D00:CLI:RTS
 3060 ]:NEXT:ENDPROC
 3070 DATA565,589,581,579,F65,265,265,565,589,581,579,146D,56D,58D,589,581,1475,595,595,58D,581,1489,565,589,581,579,1465,56D,58D,589,581,F6D,56D,56D,58D,589,581,595,595,595,595,595,595,58D,581,A79,A95,589,589,A89,589,589,A89,589,595,779
 3080 DATA281,1489,58D,58D,58D,58D,58D,589,589,289,289,589,581,581,589,A81,A95
 3090 DATA589,589,A89,589,589,A89,589,595,779,281,1489,58D,58D,78D,28D,58D,589,589,289,289,595,595,58D,581,1479,*
 3100 DEFPROCinstr:RESTORE3440:READE$:PROCtitles(E$)
 3110 PRINTTAB(16,7);"KEYS"''SPC(7);"Z";SPC(9);"-";SPC(9);"Left"''SPC(7);"X";SPC(9);"-";SPC(9);"Right"''SPC(7);"SPACE";SPC(5);"-";SPC(9);"Fire"
 3120 PRINT'''SPC(7);"S";SPC(9);"-";SPC(9);"Sound on"''SPC(7);"Q";SPC(9);"-";SPC(9);"Sound off"''SPC(7);"F";SPC(9);"-";SPC(9);"Flash on"'
 3130 PRINTSPC(7);"G";SPC(9);"-";SPC(9);"Flash off"''SPC(7);"M";SPC(9);"-";SPC(9);"Music on"''SPC(7);"N";SPC(9);"-";SPC(9);"Music off"
 3140 PROCspc:ENDPROC
 3150 DEFPROCtitles(D$):FORA%=1TOLEND$
 3160 DB$=MID$(D$,A%,1):IFDB$="M" VDU242 ELSEVDU32
 3170 NEXT:VDU5:GCOL0,1:MOVE144,988
 3180 VDU242,10,10,242,4:ENDPROC
 3190 DEFPROCspc:PRINTTAB(9,30);"Press SPACE to continue";
 3200 RESTORE3070:REPEAT:PROCmusic:UNTILINKEY(-99):*FX15
 3210 CLS:ENDPROC
 3220 DEFPROCsnva
 3230 VDU23,242,0,62,127,127,127,127,127,62
 3240 RESTORE3460:REPEAT:READD$
 3250 FORA%=1TOLEND$:DB$=MID$(D$,A%,1)
 3260 IFDB$="7" VDU242,242,8,8,10,242,242,11 ELSEIFDB$>"@"ANDDB$<"Z" PRINTSTRING$(ASC(DB$)-64,CHR$9); ELSEIFDB$="@" PRINT
 3270 NEXT:UNTILDB$="*"
 3280 PRINTTAB(12,27);"By Martin Hollis"
 3290 PROCspc:ENDPROC
 3300 DEFPROCdisplay:CLS:RESTORE3440
 3310 READE$:PROCtitles(E$):PRINT
 3320 READE$:PROCtitles(E$):PRINT
 3330 FORA%=1TO5:PRINT''A%;")";CHR$32;HI%(A%),,HI$(A%):NEXT:ENDPROC
 3340 DEFPROChighscore
 3350 IFSCORE%<=HI%(5) PROCdisplay:ENDPROC
 3360 B%=6:REPEAT:B%=B%-1
 3370 UNTILHI%(B%)>=SCORE%ORB%=0:B%=B%+1
 3380 FORA%=5TOB%+1STEP-1:HI%(A%)=HI%(A%-1):HI$(A%)=HI$(A%-1):NEXT
 3390 HI%(B%)=SCORE%:PROCdisplay
 3400 PRINTTAB(0,28);"Please enter your name then press RETURN";TAB(20,11+B%*3);SPC(90);TAB(19,11+B%*3);:*FX15
 3410 INPUT"";HI$(B%)
 3420 IFLEN(HI$(B%))>10 GOTO3400
 3430 ENDPROC
 3440 DATA"MMM,M,M,MMM,M,,,M,M,M,,M,,MM,,MM,MM,,MMMM,,,M,M,M,M,M,M,M,M,M,M,M,M,M,M,,M,M,M,,MMM,MMM,M,M,M,M,M,M,M,MMM,M,M,MM,MM,,MMM,,M,M,M,M,M,M,M,M,MMM,M,M,M,M,M,,M,M,,,MMMM,M,M,MMM,MMMMM,,M,,M,M,MM,,MM,M,M,MMM"
 3450 DATA"M,M,M,MMM,M,M,,,,MMM,MMM,MMM,MM,,MMM,MMMM,M,M,M,,,M,M,,,,M,,,M,M,M,M,M,M,M,,,M,,MMM,M,M,M,MMM,MM,MMM,M,,,M,M,MM,,MM,,MMMM,M,M,M,M,M,M,,,,,,M,M,M,M,M,M,M,M,,,,,MM,M,M,MMM,M,M,,,,MMM,MMM,MMM,M,M,MMM,MMM"
 3460 DATA@@F7M7@D7B7A7C7A7B7A7B7B7@@D7E77A7A7B7A7B7B7@F7@H7A7A77A7B7A7B7B7@@D7B7A7C7A7B7A7B7B7@F7M7E7B7@@
 3470 DATA@7B7C7C77D77A77E7@G7B7E7K7A7B77B7H7E7D7@G7B7E7K7A7@7B7C7C7E77B77E7@
 3480 DATAG7B7E7R7A77I7E7D7A7@G7B7E7N7B7B7C7B7A77D77A7B7C7@*
