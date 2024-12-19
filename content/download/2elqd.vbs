MSGBOX "Program to calculate the dimensions of a resonant square 2-element quad beam." & CHR(13) &"All equations calibrated to NEC antenna modeling software for wire diameters"&CHR(13) & "from 3.16E-5 to 1E-2 wavelengths within about 0.5% from 3.5 - 250 MHz." & CHR(13) & CHR(13) & "L. B. Cebik, W4RNL",,"2 Element Quad"

Sub Calculate

F = INPUTBOX ("Enter Desired Frequency in MHz:","Operating Frequency")
U = INPUTBOX ("Select Units for Wire Diameter in 1. Inches, 2. Millimeters, 3. Wavelengths","Wire Diameter")
WD = INPUTBOX ("Enter Wire Diameter in your Selected Units","Wire Diameter")
IF U=1 THEN WLI=11802.71/F:D=WD/WLI
IF U=2 THEN WLI=299792.5/F:D=WD/WLI
IF U=3 THEN D=WD
MSGBOX "Wire Diameter in Wavelengths: " & Round(D,6),,"Wire Diameter"
L=.4342945*LOG(D*10^5):LL=L^2:LM=LL*.0128:LN=LM+1.0413:D1=.4342945*LOG(D)
IF D1<-4.5 then MSGBOX "Wire diameter less than 3E-5 wavelengths:  results uncertain."
IF d1>-2 THEN MSGBOX "Wire diameter greater than 1E-2 wavelengths:  results uncertain."
AD=.00336:BD=.04966518519:CD=.2731955556:DD=.6716364021:ED=1.644147937
DE=(AD*(D1^4))+(BD*(D1^3))+(CD*(D1^2))+(DD*D1)+ED
AR=.003173333333:BR=.0508237037:CR=.3081977778:DR=.8663851852:ER=2.040064444
RE=(AR*(D1^4))+(BR*(D1^3))+(CR*(D1^2))+(DR*D1)+ER
AS1=-.003:BS=-.03551851852:CS=-.1553055556:DS=-.2902116402:ES=-.02540079365
SP=(AS1*(D1^4))+(BS*(D1^3))+(CS*(D1^2))+(DS*D1)+ES
AZ=1.976333333:BZ=30.84751852:CZ=172.4909722:DZ=419.5162831:EZ=519.8747579
ZR=(AZ*(D1^4))+(BZ*(D1^3))+(CZ*(D1^2))+(DZ*D1)+EZ
AG=-.06333333333:BG=-.7203703704:CG=-3.010277778:DG=-5.381375661:EG=3.738769841
GN=(AG*(D1^4))+(BG*(D1^3))+(CG*(D1^2))+(DG*D1)+EG
AW=1.688666667:BW=23.76837037:CW=124.9339444:DW=295.8872328:EW=281.2755159
SW=(AW*(D1^4))+(BW*(D1^3))+(CW*(D1^2))+(DW*D1)+EW
AF=-.00266666667:BF=.388:CF=4.790666667:DF=19.55485714:EF=28.76628571
FB=(AF*(D1^4))+(BF*(D1^3))+(CF*(D1^2))+(DF*D1)+EF
AN=-.08333333333:BN=-.9462962963:CN=-3.943055556:DN=-7.582671958:EN=-5.23234127
DG=(AN*(D1^4))+(BN*(D1^3))+(CN*(D1^2))+(DN*D1)+EN
WL=299.7925/F
WF=983.5592/F
MSGBOX "Wavelength in Meters = "& Round(WL,4) & CHR(13) & "Wavelength in Feet = "&Round(WF,4),,"WaveLength"
MSGBOX "Quad Dimensions in Wavelengths, Feet, and Meters:" & CHR(13) & CHR(13) & "Driver Side =                      "&Round((DE/4),4)&" WL or "&Round((DE/4)*WF,4)&" Feet or "&Round((DE/4)*WL,4)&" Meters" & CHR(13) &"Driver Circumference =      "&Round(DE,4)&" WL or "&Round(DE*WF,4)&" Feet or "&Round(DE*WL,4)&" Meters" & CHR(13) & "Reflector Side =                 "&Round((RE/4),4)&" WL or "&Round((RE/4)*WF,4)&" Feet or "&Round((RE/4)*WL,4)&" Meters" & CHR(13) & "Reflector Circumference = "&Round(RE,4)&" WL or "&Round(RE*WF,4)&" Feet or "&Round(RE*WL,4)&" Meters" & CHR(13) & "Reflector-Driver Space =   "&Round(SP,4)&" WL or "&Round(SP*WF,4)&" Feet or "&Round(SP*WL,4)&" Meters" & CHR(13) & "Approximate Resonant Feedpoint Impedance = "&Round(ZR,3)&" Ohms",,"Dimensions"

MSGBOX "Approximate Free-Space Gain = "&Round(GN,4)&" dBi" & CHR(13) & "Approximate 2:1 VSWR Bandwidth = "&Round(SW,4)&"% of Design Frequency" & CHR(13) & "Approximate >20 dB F-B Ratio Bandwidth = "&Round(FB,4)&"% of Design Frequency" & CHR(13) & "Approximate Rate of Gain Change = "&Round(DG,4)&"dB per 1% of Design Frequency",,"Calculations"
End Sub

Do Until P = 7
  P = MSGBOX ("Calculate Quad Demensions",4,"Yes or No")
  if P = 6 then Calculate
Loop
