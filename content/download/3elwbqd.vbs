MSGBOX "Program to calculate the dimensions of a resonant square 3-element quad beam." & CHR(13) & CHR(13) & "All equations calibrated to NEC antenna modeling software for wire diameters" & CHR(13) & "from 3.16E-5 to 1E-2 wavelengths within about 0.5% from 3.5 - 250 MHz." & CHR(13) & CHR(13) &"L. B. Cebik, W4RNL",, "WideBand 3 Element Quad"

Sub Calculate

F = INPUTBOX ("Enter Desired Frequency in MHz:","Operating Frequency")
U = INPUTBOX ("Select Units for Wire Diameter in 1. Inches, 2. Millimeters, 3. Wavelengths", "Wire Diameter")
WD =INPUTBOX ("Enter Wire Diameter in your Selected Units","Wire Diameter")
IF U=1 THEN WLI=11802.71/F:D=WD/WLI
IF U=2 THEN WLI=299792.5/F:D=WD/WLI
IF U=3 THEN D=WD
MSGBOX "Wire Diameter in Wavelengths: " & Round(D,6),,"Wire Diameter"
L=.4342945*LOG(D*10^5):LL=L^2:LM=LL*.0128:LN=LM+1.0413:D1=.4342945*LOG(D)
IF D1<-4.5 then MSGBOX "Wire diameter less than 3E-5 wavelengths:  results uncertain."
IF d1>-2 THEN MSGBOX "Wire diameter greater than 1E-2 wavelengths:  results uncertain."
AD=.00064:BD=.01044148148:CD=.06484444444:DD=.1886626455:ED=1.232080635
DE=(AD*(D1^4))+(BD*(D1^3))+(CD*(D1^2))+(DD*D1)+ED
AR=.0009333333333:BR=.01915555556:CR=.13983333333:DR=.4587492063:ER=1.64042381
RE=(AR*(D1^4))+(BR*(D1^3))+(CR*(D1^2))+(DR*D1)+ER
AI=-.0012:BI=-.0209037037:CI=-.13021111111:DI=-.3498137566:EI=.5941126984
IR=(AI*(D1^4))+(BI*(D1^3))+(CI*(D1^2))+(DI*D1)+EI
AS1=-.0033:BS=-.03927777778:CS=-.1724583333:DS=-.3239603175:ES=-.04951547619
SP=(AS1*(D1^4))+(BS*(D1^3))+(CS*(D1^2))+(DS*D1)+ES
AP=-.004866666667:BP=-.06262962963:CP=-.29347222222:DP=-.6174457672:EP=-.2289269841
IP=(AP*(D1^4))+(BP*(D1^3))+(CP*(D1^2))+(DP*D1)+EP
AZ=-2.227066667:BZ=-26.75247407:CZ=-115.9142556:DZ=-217.8183323:EZ=-79.59203175
ZR=(AZ*(D1^4))+(BZ*(D1^3))+(CZ*(D1^2))+(DZ*D1)+EZ
AG=-.07:BG=-.7877777778:CG=-3.350833333:DG=-6.143888889:EG=5.104166667
GN=(AG*(D1^4))+(BG*(D1^3))+(CG*(D1^2))+(DG*D1)+EG
AW=-.05847333333:BW=-.5028392593:CW=-.4586494444:DW=6.080227037:EW=17.61091389
SW=(AW*(D1^4))+(BW*(D1^3))+(CW*(D1^2))+(DW*D1)+EW
AF=.11695666667:BF=1.717985556:CF=9.6510925:DF=25.23848992:EF=27.78167988
FB=(AF*(D1^4))+(BF*(D1^3))+(CF*(D1^2))+(DF*D1)+EF
AN=-.04666666667:BN=-.5414814815:CN=-2.302777778:DN=-4.364074074:EN=-3.092777778
DG=(AN*(D1^4))+(BN*(D1^3))+(CN*(D1^2))+(DN*D1)+EN
WL=299.7925/F
WF=983.5592/F

MSGBOX "Wavelength in Meters ="& Round(WL,4) & CHR(13) & "Wavelength in Feet ="& Round(WF,4),,"WaveLength"


MSGBOX "Quad Dimensions in Wavelengths, Feet, and Meters:" & CHR(13) & CHR(13) & "Driver Side =                      "&Round((DE/4),4)&" WL or " & Round((DE/4)*WF,4) & " Feet or "&Round((DE/4)*WL,4)&" Meters" & CHR(13) & "Driver Circumference =      "&Round(DE,4)&" WL or "&Round(DE*WF,4)&" Feet or "&Round(DE*WL,4)&" Meters" & CHR(13) & "Reflector Side =                 "&Round(RE/4,4)&" WL or "&Round((RE/4)*WF,4)&" Feet or "&Round((RE/4)*WL,4)&" Meters" & CHR(13) & "Reflector Circumference = "&Round(RE,4)&" WL or "&Round(RE*WF,4)&" Feet or "&Round(RE*WL,4)&" Meters" & CHR(13) & "Reflector-Driver Space =   "&Round(SP,4)&" WL or "&Round(SP*WF,4)&" Feet or "&Round(SP*WL,4)&" Meters" & CHR(13) & "Director Side =                   "&Round((IR/4),4)&" WL or "& Round((IR/4)*WF,4)&" Feet or "&Round((IR/4)*WL,4)&" Meters" & CHR(13) & "Director Circumference =   "&Round(IR,4)&" WL or "&Round(IR*WF,4)&" Feet or "&Round(IR*WL,4)&" Meters" & CHR(13) & "Director-Driver Space =     "&Round(IP,4)&" WL or "&Round(IP*WF,4)&" Feet or "&Round(IP*WL,4)&" Meters" & CHR(13) & "Approx. Feedpoint Impedance = "&Round(ZR,3)&" Ohms",,"Dimensions"


MSGBOX "Free-Space Gain = "& Round(GN,5)&" dBi" & CHR(13) & "Approximate 2:1 VSWR Bandwidth = " & Round(SW,5) & "  % of Design Frequency" & CHR(13) & "Approximate >20 dB F-B Ratio Bandwidth = "& Round(FB,5) & "% of Design Frequency" & CHR(13) & "Approximate Rate of Gain Change = "& Round(DG,5) & "dB per 1% of Design Frequency",,"Characteristics"
End Sub

Do Until P = 7
  P = MSGBOX ("Calculate Quad Demensions",4,"Yes or No")
  if P = 6 then Calculate
Loop