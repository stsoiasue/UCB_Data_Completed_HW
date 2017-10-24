Sub StockAnalysisEasy()
    'The code below will organize and consolidate stock data
    
    'Find last row
    Dim LastRowData As Long
    LastRowData = Cells(Rows.Count, 1).End(xlUp).Row

    'Establish row reference for summary data
    Dim LastRowSummary As Long
    LastRowSummary = 2

    'Define TotalVolume variable to store total volume of ticker
    Dim TotalVolume As Double
    TotalVolume = 0
    
    'Add column headers for summary data
    Range("I1").Value = "Ticker"
    Range("J1").Value = "Total Volume"
    
    Dim i As Long

    For i = 2 To LastRowData

        'Add total volume to total
        TotalVolume = TotalVolume + Cells(i, 7).Value

        'Check if Stock ticker is the same.
        If Cells(i, 1).Value <> Cells(i + 1, 1) Then

            'Add ticker and TotalVolume to Summary data
            Cells(LastRowSummary, 9).Value = Cells(i, 1).Value
            Cells(LastRowSummary, 10).Value = TotalVolume

            'Reset TotalVolume to 0
            TotalVolume = 0
            LastRowSummary = LastRowSummary + 1

        End If
        
    Next i

End Sub

Sub StockAnalysisModerate()
    'The code below will organize and consolidate stock data
    
    'Find last row
    Dim LastRowData As Long
    LastRowData = Cells(Rows.Count, 1).End(xlUp).Row

    'Establish row reference for summary data
    Dim LastRowSummary As Long
    LastRowSummary = 2

    'Define TotalVolume variable to store total volume of ticker
    Dim TotalVolume As Double
    TotalVolume = 0

	'Define YearOpen as variable to store the 1st value for any stock
    Dim YearOpen As Double
    YearOpen = Cells(2,3).Value
    
    'Add column headers for summary data
    Range("I1").Value = "Ticker"
    Range("J1").Value = "Yearly Change"
    Range("K1").Value = "Percent Change"
	Range("L1").Value = "Total Volume"

    Dim i As Long

    For i = 2 To LastRowData

        'Add total volume to total
        TotalVolume = TotalVolume + Cells(i, 7).Value

        'Check if Stock ticker is the same.
        If Cells(i, 1).Value <> Cells(i + 1, 1) Then

            'Add ticker, YearlyChange, Percent Change, and TotalVolume to Summary data
            Cells(LastRowSummary, 9).Value = Cells(i, 1).Value
			Cells(LastRowSummary, 10).Value = Cells(i, 6).Value - YearOpen 
			Cells(LastRowSummary, 11).Value = (Cells(i, 6).Value - YearOpen) / YearOpen
            Cells(LastRowSummary, 12).Value = TotalVolume

			'Add conditional formatting to YearlyChange
			If Cells(LastRowSummary, 10).Value <0 Then
				Cells(LastRowSummary, 10).Interior.ColorIndex = 3
			Else 
				Cells(LastRowSummary, 10).Interior.ColorIndex = 4
			End If

            'Reset TotalVolume to 0
            TotalVolume = 0
            LastRowSummary = LastRowSummary + 1

			'Set YearOpen for next stock
			YearOpen = Cells(i + 1, 3).Value

        End If
        
    Next i

End Sub

Sub StockAnalysisHard()
    'The code below will organize and consolidate stock data
    
    'Find last row
    Dim LastRowData As Long
    LastRowData = Cells(Rows.Count, 1).End(xlUp).Row

    'Establish row reference for summary data
    Dim LastRowSummary As Long
    LastRowSummary = 2

    'Define TotalVolume variable to store total volume of ticker
    Dim TotalVolume As Double
    TotalVolume = 0

	'Define YearOpen as variable to store the 1st value for any stock
    Dim YearOpen As Double
    YearOpen = Cells(2,3).Value
    
    'Add column headers for summary data
    Range("I1").Value = "Ticker"
    Range("J1").Value = "Yearly Change"
    Range("K1").Value = "Percent Change"
	Range("L1").Value = "Total Volume"

    Dim i As Long

    For i = 2 To LastRowData

        'Add total volume to total
        TotalVolume = TotalVolume + Cells(i, 7).Value

        'Check if Stock ticker is the same.
        If Cells(i, 1).Value <> Cells(i + 1, 1) Then

            'Add ticker, YearlyChange, Percent Change, and TotalVolume to Summary data
            Cells(LastRowSummary, 9).Value = Cells(i, 1).Value
			Cells(LastRowSummary, 10).Value = Cells(i, 6).Value - YearOpen 
			Cells(LastRowSummary, 11).Value = (Cells(i, 6).Value - YearOpen) / YearOpen
            Cells(LastRowSummary, 12).Value = TotalVolume

			'Add conditional formatting to YearlyChange
			If Cells(LastRowSummary, 10).Value <0 Then

				'Change cell color to Red if negative
				Cells(LastRowSummary, 10).Interior.ColorIndex = 3
			
			Else

			 	'Change cell color to Green if not negative
				Cells(LastRowSummary, 10).Interior.ColorIndex = 4

			End If

            'Reset TotalVolume to 0
            TotalVolume = 0
            LastRowSummary = LastRowSummary + 1

			'Set YearOpen for next stock
			YearOpen = Cells(i + 1, 3).Value

        End If
        
    Next i

	'Define Greatest increase ticker and value variables
	Dim GreatestInc as Double
	Dim GreatestIncTicker as String
	GreatestInc = Cells(2,11).Value
	GreatestIncTicker = ""

	'Define Greatest decrease ticker and value variables
	Dim GreatestDec as Double
	Dim GreatestDecTicker as String
	GreatestDec = Cells(2,11).Value
	GreatestDecTicker = ""

	'Define Greatest total volume ticker and value variables
	Dim GreatestTotal as Double
	Dim GreatestTotalTicker as String
	GreatestTotal = Cells(2,12).Value
	GreatestTotalTicker = ""

	For i = 2 To LastRowSummary

		'Check if next value is larger than greatest increase
		If Cells(i,11).Value > GreatestInc Then

			'Reassign Greatest increase variables
			GreatestInc = Cells(i,11).Value
			GreatestIncTicker = Cells(i,9).Value

		End if

		'Check if next value is smaller than greatest decrease
		If Cells(i,11).Value < GreatestDec Then	

			'Reassign Greatest decrease variables
			GreatestDec = Cells(i,11).Value
			GreatestDecTicker = Cells(i,9).Value
			
		End if

		'Check if next value is larger than greatest total volume
		If Cells(i,12).Value > GreatestTotal Then

			'Reassign Greatest total variables
			GreatestTotal = Cells(i,12).Value
			GreatestTotalTicker = Cells(i,9).Value
		
		End if
	
	Next i

	'Set up headers for greatest section
	Cells(1,16).Value = "Ticker"
	Cells(1,17).Value = "Value"

	'Input Greatest Increase values
	Cells(2, 15).Value = "Greatest % Increase"
	Cells(2, 16).Value = GreatestIncTicker
	Cells(2, 17).Value = GreatestInc

	'Input Greatest Decrease values
	Cells(3, 15).Value = "Greatest % Decrease"
	Cells(3, 16).Value = GreatestDecTicker
	Cells(3, 17).Value = GreatestDec

	'Input Greatest Total Volume values
	Cells(4, 15).Value = "Greatest Total Volume"
	Cells(4, 16).Value = GreatestTotalTicker
	Cells(4, 17).Value = GreatestTotal

End Sub