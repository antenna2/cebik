MSGBOX "Program to calculate the perimeter length of a resonant quad loop." & CHR(13) & "All equations correlated to NEC antenna modeling software." & CHR(13) & CHR(13) & "L. B. Cebik, W4RNL",,"Resonant Quad Loop"

Sub Calculate

    F = INPUTBOX ("Enter Desired Frequency in MHz:","Desired Frequency")
    U = INPUTBOX ("Select Units for Wire Diameter in 1. Inches or 2. Millimeters","Wire Diameter")
    WD = INPUTBOX ("Enter Wire Diameter in your Selected Units","Wire Diameter")
    IF U=1 THEN WLI=11802.71/F:D=WD/WLI
    IF U=2 THEN WLI=299792.5/F:D=WD/WLI
    L=.4343*LOG(D*10^5):LL=L^2:LM=LL*.0128:LN=LM+1.0413
    WL=299.7925/F
    PM=LN*WL
    WF=983.5592/F
    PF=LN*WF

    'MSGBOX "Wire Diameter in Wavelengths:" & Round(D,4) & CHR(13) & "Perimeter Length in Wavelengths =" & Round(LN,4) & CHR(13) & "Wavelength in Meters =" & Round(WL,4) & CHR(13) & "Perimeter Length in Meters =" & Round(PM,4) & CHR(13) & "Wavelength in Feet =" & Round(WF,4) & CHR(13) & "Perimeter Length in Feet =" & Round(PF,4),,"Dimensions"

    MSGBOX "Wire Diameter in Wavelengths:" & Round(D,4) & CHR(13) & "Perimeter Length in Wavelengths =" & Round(LN,4) & " Meters: " & Round(PM,4) & " Feet: " & Round(PF,4) & CHR(13) & "Wavelength in Meters =" & Round(WL,4) & " Feet " & Round(WF,4),,"Dimensions"
End Sub

Do Until P = 7
  P = MSGBOX ("Calculate Quad Demensions",4,"Yes or No")
  if P = 6 then Calculate
Loop