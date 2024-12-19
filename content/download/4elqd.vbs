MSGBOX "Program to calculate the dimensions of a resonant square 4-element quad beam." & chr(13) & "All equations calibrated to NEC antenna modeling software for wire diameters" & " from 3.16E-5 to 1E-2 wavelengths within about 0.5% from 3.5 - 250 MHz." & CHR(13) & CHR(13) & "L. B. Cebik, W4RNL",,"Wide Bandwidth 4 Element Quad"

Sub Calculate
  F = INPUTBOX ("Enter Desired Frequency in MHz:","Operating Frequency")
  U = INPUTBOX ("Select Units for Wire Diameter in 1. Inches, 2. Millimeters, 3. Wavelengths","Wire Diameter")
  WD = INPUTBOX ("Enter Wire Diameter in your Selected Units","Wire Diameter")
  IF U=1 THEN WLI=11802.71/F:D=WD/WLI
  IF U=2 THEN WLI=299792.5/F:D=WD/WLI
  IF U=3 THEN D=WD
  D = Round(D,5)

  L=.4342945*LOG(D*10^5):LL=L^2:LM=LL*.0128:LN=LM+1.0413:D1=.4342945*LOG(D)
  IF D1<-4.5 then MSGBOX "Wire diameter less than 3E-5 wavelengths:  results uncertain."
  if d1>-2 THEN MSGBOX "Wire diameter greater than 1E-2 wavelengths:  results uncertain."
  AD=-.00018:BD=-.002359259259:CD=-.01090277778:DD=-.01971296296:ED=.1174938889
  DE=(AD*(D1^4))+(BD*(D1^3))+(CD*(D1^2))+(DD*D1)+ED:DE=DE*8
  DE = Round(DE, 3)
  AR=.0002666666667:BR=.004237037037:CR=.02554444444:DR=.07158756614:ER=.2119230159
  RE=(AR*(D1^4))+(BR*(D1^3))+(CR*(D1^2))+(DR*D1)+ER:RE=RE*8
  RE = Round(RE,3)
  AI=-.0002:BI=-.002525925926:CI=-.01182777778:DI=-.02473915344:EI=.1008246032
  IR=(AI*(D1^4))+(BI*(D1^3))+(CI*(D1^2))+(DI*D1)+EI:IR=IR*8
  IR = Round(IR,3)
  AT=-.0006:BT=-.009059259259:CT=-.04912777778:DT=-.1152343915:ET=.01678174603
  TT=(AT*(D1^4))+(BT*(D1^3))+(CT*(D1^2))+(DT*D1)+ET:TT=TT*8
  TT = Round(TT,3)
  SP=.1635:IP=.481
  ATT=.0026666666667:BTT=.036888888889:CTT=.177:DTT=.3386587302:ETT=1.046738095
  TTP=(ATT*(D1^4))+(BTT*(D1^3))+(CTT*(D1^2))+(DTT*D1)+ETT
  TTP = Round(TTP,3)
  AZ=1.2:BZ=13.92592593:CZ=60.777777778:DZ=113.9177249:EZ=132.618254
  ZR=(AZ*(D1^4))+(BZ*(D1^3))+(CZ*(D1^2))+(DZ*D1)+EZ
  ZR = Round(ZR,2)
  AG=-.1:BG=-1.184444444:CG=-5.228333333:DG=-9.831507937:EG=4.045238095
  GN=(AG*(D1^4))+(BG*(D1^3))+(CG*(D1^2))+(DG*D1)+EG
  GN = Round(GN,3)
  AW=-.06663333333:BW=-.6539148148:CW=-1.677836111:DW=1.361137831:EW=9.502790079
  SW=(AW*(D1^4))+(BW*(D1^3))+(CW*(D1^2))+(DW*D1)+EW
  SW = Round(SW,3)
  AF=-.03:BF=-.27666667:CF=-.4475:DF=2.348809524:EF=7.853214286
  FB=(AF*(D1^4))+(BF*(D1^3))+(CF*(D1^2))+(DF*D1)+EF
  FB = Round(FB,3)
  WL=299.7925/F
  WF=983.5592/F
  WL = Round(WL,4)
  WF = Round(WF,4)

  MSGBOX "Wire Diameter in Wavelengths: " & D & CHR(13) & "Wavelength in Meters = " & WL & CHR(13) & "Wavelength in Feet = " & WF,,"Wire Diameter"

  MSGBOX "Quad Dimensions in Wavelengths, Feet, and Meters:" & CHR(13) & CHR(13) &"Driver Side ="&(DE/4)&" WL or"&(DE/4)*WF&"Feet or "&(DE/4)*WL&"Meters" & CHR(13) & "Driver Circumference ="&DE&" WL or"&DE*WF&"Feet or "&DE*WL&"Meters" & CHR(13) & "Reflector Side ="&(RE/4)&" WL or "&(RE/4)*WF&"Feet or "&(RE/4)*WL&"Meters" & CHR(13) & "Reflector Circumference ="&RE&" WL or "&RE*WF&"Feet or "&RE*WL&"Meters" & CHR(13) & "Reflector-Driver Space ="&SP&" WL or "&SP*WF&"Feet or "&SP*WL&"Meters" & CHR(13) & "Director 1 Side ="&(IR/4)&" WL or "&(IR/4)*WF&"Feet or "&(IR/4)*WL&"Meters" & CHR(13) & "Director 1 Circumference ="&IR&" WL or "&IR*WF&"Feet or "&IR*WL&"Meters" & CHR(13) & "Director 1-Reflector Space ="&IP&" WL or "&IP*WF&"Feet or "&IP*WL&"Meters" & CHR(13) & "Director 2 Side ="&(TT/4)&" WL or "&(TT/4)*WF&"Feet or "&(TT/4)*WL&"Meters" & CHR(13) & "Director 2 Circumference ="&TT&" WL or "&TT*WF&"Feet or "&TT*WL&"Meters" & CHR(13) & "Director 2-Reflector Space ="&TTP&" WL or "&TTP*WF&"Feet or "&TTP*WL&"Meters" & CHR(13) & "Approx. Feedpoint Impedance ="&ZR&" Ohms   ",,"Quad Demensions"
  MSGBOX "Free-Space Gain ="&GN&"dBi" & CHR(13) & "Approximate 2:1 VSWR Bandwidth ="&SW&"% of Design Frequency" & CHR(13) & "Approximate >20 dB F-B Ratio Bandwidth ="&FB&"% of Design Frequency",,"Gain/SWR and Bandwith"
end sub

Do Until P = 7
  P = MSGBOX ("Calculate Quad Demensions",4,"Yes or No")
  if P = 6 then Calculate
Loop