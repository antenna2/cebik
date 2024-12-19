MSGBOX "Program to calculate the dimensions of a resonant square (High Gain) 3-element quad beam. All equations calibrated to NEC antenna modeling software for wire diameters from 3.16E-5 to 1E-2 wavelengths within about 0.5% from 3.5 - 250 MHz." &CHR(13) & CHR(13) &"L. B. Cebik, W4RNL",,"3 Element Quad Calculations" 
DIM f, U, WLI, WD, D, L, LL, LM, D1, AD, BD, CD, DD, ED, DE, AR, BR, CR, DR, ER, RE
DIM AI, BI, CI, DI, EI, IR, AS1, BS, CS, DS, ES, AP, BP, CP, DP, IP, EP, AZ, BZ, CZ, DZ, EZ
DIM ZR, AG, CG, BG, DG, EG, GN, AW, BW, CW, DW, EW, SW, AF, BF, CF, DF, EF, FB, WS, WF
SUB Calculate
  F = INPUTBOX ("Enter Desired Frequency in MHz:","Desired Frequency")
  U = INPUTBOX ("Select Units for Wire Diameter in 1. Inches, 2. Millimeters, 3. Wavelengths","Select Units")
  'U = INPUTBOX ("Choose 1. or 2. or 3.")
  WD = INPUTBOX ("Enter Wire Diameter in your Selected Units","Wire Diameter")
  IF U=1 THEN WLI=11802.71/F:D=WD/WLI
  IF U=2 THEN WLI=299792.5/F:D=WD/WLI
  IF U=3 THEN D=WD

  L=.4342945*LOG(D*10^5):LL=L^2:LM=LL*.0128:LN=LM+1.0413:D1=.4342945*LOG(D)
  IF D1<-4.5 then MSGBOX "Wire diameter less than 3E-5 wavelengths:  results uncertain."
  if d1>-2 THEN MSGBOX "Wire diameter greater than 1E-2 wavelengths:  results uncertain."
  AD=.000266666667:BD=.00506666667:CD=.03633333333:DD=.1221904762:ED=1.183285714
  DE=(AD*(D1^4))+(BD*(D1^3))+(CD*(D1^2))+(DD*D1)+ED
  DE = Round(DE, 3)
  AR=.0037333333333:BR=.05362962963:CR=.29275555556:DR=.7424529101:ER=1.814412698
  RE=(AR*(D1^4))+(BR*(D1^3))+(CR*(D1^2))+(DR*D1)+ER
  RE = Round(RE, 3)
  AI=-.00266666667:BI=-.033244444444:CI=-.1550666667:DI=-.3222793651:EI=.7283809524
  IR=(AI*(D1^4))+(BI*(D1^3))+(CI*(D1^2))+(DI*D1)+EI
  IR = Round(IR, 3)
  as1=.00033333333:BS=.004837037037:CS=.02552777778:DS=.05643756614:ES=.2191230159
  SP=(as1*(D1^4))+(BS*(D1^3))+(CS*(D1^2))+(DS*D1)+ES 
  SP = Round(SP, 3)
  AP=-.002333333333:BP=-.03128148148:CP=-.15586111111:DP=-.3417669312:EP=-.05499206349
  IP=(AP*(D1^4))+(BP*(D1^3))+(CP*(D1^2))+(DP*D1)+EP
  IP = Round(IP,3)
  AZ=4.4029:BZ=53.43954444:CZ=239.2408583:DZ=462.3614437:EZ=373.3035655
  ZR=(AZ*(D1^4))+(BZ*(D1^3))+(CZ*(D1^2))+(DZ*D1)+EZ
  ZR = Round(ZR,3)
  AG=-.15:BG=-1.768518519:CG=-7.763055556:DG=-14.78592593:EG=-.609722222
  AG=Round(AG,3)
  GN=(AG*(D1^4))+(BG*(D1^3))+(CG*(D1^2))+(DG*D1)+EG
  GN = Round(GN,3)
  AW=.16666666667:BW=2.265925926:CW=11.706111111:DW=27.93058201:EW=28.88753968
  SW=(AW*(D1^4))+(BW*(D1^3))+(CW*(D1^2))+(DW*D1)+EW
  SW = Round(SW, 3)
  AF=.11933333333:BF=1.671777778:CF=8.9885:DF=22.45931746:EF=23.68797619
  FB=(AF*(D1^4))+(BF*(D1^3))+(CF*(D1^2))+(DF*D1)+EF
  FB = Round(FB,3)
  WL=299.7925/F: WL = Round(WL,3)
  WF=983.5592/F:WF = Round(WF,3)
  d = Round(D,5)
  MSGBOX "Wire Diameter in Wavelengths: " & D & chr(13) & "Wavelength in Meters =" & WL & chr(13) & "Wavelength in Feet =" & WF,,"Characteristics at " & F & " Mhz"
  MSGBOX "Quad Dimensions in Wavelengths, Feet, and Meters:" & chr(13) & chr(13) & "Driver Side =" & (DE/4) &" WL or "&(DE/4)*WF &" Feet or "&(DE/4)*WL&"Meters" &CHR(13) & "Driver Circumference ="&DE&" WL or "&DE*WF&" Feet or "&DE*WL&"Meters" &(CHR(13))&  "Reflector Side ="&(RE/4)&" WL or "&(RE/4)*WF&" Feet or "&(RE/4)*WL&"Meters" & CHR(13) & "Reflector Circumference ="&RE&" WL or "&RE*WF&" Feet or "&RE*WL&"Meters" & CHR(13) & "Reflector-Driver Space ="&SP&" WL or "&SP*WF&" Feet or "&SP*WL&"Meters" & CHR(13) & "Director Side ="&(IR/4)&" WL or "&(IR/4)*WF&" Feet or "&(IR/4)*WL&"Meters" & CHR(13) & "Director Circumference ="&IR&" WL or "&IR*WF&" Feet or "&IR*WL&"Meters" & CHR(13) & "Director-Driver Space ="&IP&" WL or "&IP*WF&" Feet or "&IP*WL&"Meters" & CHR(13) & "Approx. Feedpoint Impedance ="&ZR&" Ohms   ",,"Quad Dimensions"
  MSGBOX "Free-Space Gain ="&GN&"dBi" & CHR(13) & "Approximate 2:1 VSWR Bandwidth ="&SW&"% of Design Frequency" & CHR(13)& "Approximate >20 dB F-B Ratio Bandwidth ="&FB&"% of Design Frequency",,"Gain, Bandwidth and F/B Ratio"
End Sub

Do Until P = 7
  P = MSGBOX ("Calculate Quad Demensions",4,"Yes or No")
  if P = 6 then Calculate
Loop
