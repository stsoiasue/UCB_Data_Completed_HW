Sub StockAnalysisEasyMulti()
    'The code below will organize and consolidate stock data

    'Define wks variable
    Dim wks As Worksheet
    
    'Loop through all sheets in workbook
    For Each wks In Worksheets

        'Find last row
        Dim LastRowData As Long
        LastRowData = wks.Cells(Rows.Count, 1).End(xlUp).Row

        'Establish row reference for summary data
        Dim LastRowSummary As Long
        LastRowSummary = 2

        'Define TotalVolume variable to store total volume of ticker
        Dim TotalVolume As Double
        TotalVolume = 0
        
        'Add column headers for summary data
        wks.Range("I1").Value = "Ticker"
        wks.Range("J1").Value = "Total Volume"
        
        Dim i As Long

        For i = 2 To LastRowData

            'Add total volume to total
            TotalVolume = TotalVolume + wks.Cells(i, 7).Value

            'Check if Stock ticker is the same.
            If wks.Cells(i, 1).Value <> wks.Cells(i + 1, 1) Then

                'Add ticker and TotalVolume to Summary data
                wks.Cells(LastRowSummary, 9).Value = wks.Cells(i, 1).Value
                wks.Cells(LastRowSummary, 10).Value = TotalVolume

                'Reset TotalVolume to 0
                TotalVolume = 0
                LastRowSummary = LastRowSummary + 1

            End If
            
        Next i
    
    Next wks

End Sub

Sub StockAnalysisModerateMulti()
    'The code below will organize and consolidate stock data
    
    'Define wks variable
    Dim wks As Worksheet
    
    'Loop through all sheets
    For Each wks In Worksheets
    
        'Find last row
        Dim LastRowData As Long
        LastRowData = wks.Cells(Rows.Count, 1).End(xlUp).Row
    
        'Establish row reference for summary data
        Dim LastRowSummary As Long
        LastRowSummary = 2
    
        'Define TotalVolume variable to store total volume of ticker
        Dim TotalVolume As Double
        TotalVolume = 0
    
        'Define YearlyChange variable to store the yearly change of ticker
        Dim YearlyChange As Double
        YearlyChange = 0
        
        'Define YearOpen as variable to store the 1st value for any stock
        Dim YearOpen As Double
        YearOpen = wks.Cells(2, 3).Value
        
        'Dim YearClose as a variable to store year close
        Dim YearClose As Double
        
        'Add column headers for summary data
        wks.Range("I1").Value = "Ticker"
        wks.Range("J1").Value = "Yearly Change"
        wks.Range("K1").Value = "Percent Change"
        wks.Range("L1").Value = "Total Volume"
    
        Dim i As Long
    
        For i = 2 To LastRowData
    
            'Add total volume to total
            TotalVolume = TotalVolume + wks.Cells(i, 7).Value
            
            'Check to See if YearOpen is equal to 0
            If YearOpen = 0 Then
                
                'Change YearOpen to next row value
                YearOpen = wks.Cells(i, 3).Value
        
            End If
            
            'Check if Stock ticker is the same.
            If wks.Cells(i, 1).Value <> wks.Cells(i + 1, 1) Then
                
                'Store value in YearClose
                YearClose = wks.Cells(i, 6).Value
                
                'Make sure there is a change
                If YearClose = 0 And YearOpen = 0 Then
                    
                    'Add ticker, YearlyChange, Percent Change, and TotalVolume to Summary data
                    wks.Cells(LastRowSummary, 9).Value = wks.Cells(i, 1).Value
                    wks.Cells(LastRowSummary, 10).Value = "N/A"
                    wks.Cells(LastRowSummary, 11).Value = "N/A"
                    wks.Cells(LastRowSummary, 12).Value = TotalVolume
                
                Else
                
                    'Store value in YearlyChange variable
                    YearlyChange = YearClose - YearOpen
                    
                    'Add ticker, YearlyChange, Percent Change, and TotalVolume to Summary data
                    wks.Cells(LastRowSummary, 9).Value = wks.Cells(i, 1).Value
                    wks.Cells(LastRowSummary, 10).Value = YearlyChange
                    wks.Cells(LastRowSummary, 11).Value = YearlyChange / YearOpen
                    wks.Cells(LastRowSummary, 11).Style = "Percent"
                    wks.Cells(LastRowSummary, 12).Value = TotalVolume
        
                    'Check if value is less than 0
                    If wks.Cells(LastRowSummary, 10).Value < 0 Then
                        
                        'Change cell color to Red
                        wks.Cells(LastRowSummary, 10).Interior.ColorIndex = 3
                        
                    Elseif wks.Cells(LastRowSummary, 10).Value > 0 Then
                        
                        'Change cell color to Green
                        wks.Cells(LastRowSummary, 10).Interior.ColorIndex = 4
                        
                    End If
        
                    'Reset TotalVolume to 0
                    TotalVolume = 0
        
                    'Set YearOpen for next stock
                    YearOpen = wks.Cells(i + 1, 3).Value
                
                End If
                
                'Increase LastRowSummary by 1
                LastRowSummary = LastRowSummary + 1
    
            End If
            
        Next i
        
    Next wks

End Sub

Sub StockAnalysisHardMulti()
    'The code below will organize and consolidate stock data
    
    'Define wks variable
    Dim wks As Worksheet
    
    'Loop through all sheets
    For Each wks In Worksheets
    
        'Find last row
        Dim LastRowData As Long
        LastRowData = wks.Cells(Rows.Count, 1).End(xlUp).Row
    
        'Establish row reference for summary data
        Dim LastRowSummary As Long
        LastRowSummary = 2
    
        'Define TotalVolume variable to store total volume of ticker
        Dim TotalVolume As Double
        TotalVolume = 0
    
        'Define YearlyChange variable to store the yearly change of ticker
        Dim YearlyChange As Double
        YearlyChange = 0
        
        'Define YearOpen as variable to store the 1st value for any stock
        Dim YearOpen As Double
        YearOpen = wks.Cells(2, 3).Value
        
        'Dim YearClose as a variable to store year close
        Dim YearClose As Double
        
        'Add column headers for summary data
        wks.Range("I1").Value = "Ticker"
        wks.Range("J1").Value = "Yearly Change"
        wks.Range("K1").Value = "Percent Change"
        wks.Range("L1").Value = "Total Volume"
    
        Dim i As Long
    
        For i = 2 To LastRowData
    
            'Add total volume to total
            TotalVolume = TotalVolume + wks.Cells(i, 7).Value
            
            'Check to See if YearOpen is equal to 0
            If YearOpen = 0 Then
                
                'Change YearOpen to next row value
                YearOpen = wks.Cells(i, 3).Value
        
            End If
            
            'Check if Stock ticker is the same.
            If wks.Cells(i, 1).Value <> wks.Cells(i + 1, 1) Then
                
                'Store value in YearClose
                YearClose = wks.Cells(i, 6).Value
                
                'Make sure there is a change
                If YearClose = 0 And YearOpen = 0 Then
                    
                    'Add ticker, YearlyChange, Percent Change, and TotalVolume to Summary data
                    wks.Cells(LastRowSummary, 9).Value = wks.Cells(i, 1).Value
                    wks.Cells(LastRowSummary, 10).Value = 0
                    wks.Cells(LastRowSummary, 11).Value = 0
                    wks.Cells(LastRowSummary, 12).Value = TotalVolume
                
                Else
                
                    'Store value in YearlyChange variable
                    YearlyChange = YearClose - YearOpen
                    
                    'Add ticker, YearlyChange, Percent Change, and TotalVolume to Summary data
                    wks.Cells(LastRowSummary, 9).Value = wks.Cells(i, 1).Value
                    wks.Cells(LastRowSummary, 10).Value = YearlyChange
                    wks.Cells(LastRowSummary, 11).Value = YearlyChange / YearOpen
                    wks.Cells(LastRowSummary, 11).Style = "Percent"
                    wks.Cells(LastRowSummary, 12).Value = TotalVolume
        
                    'Check if value is less than 0
                    If wks.Cells(LastRowSummary, 10).Value < 0 Then
                        
                        'Change cell color to Red
                        wks.Cells(LastRowSummary, 10).Interior.ColorIndex = 3
                        
                    ElseIf wks.Cells(LastRowSummary, 10).Value > 0 Then
                        
                        'Change cell color to Green
                        wks.Cells(LastRowSummary, 10).Interior.ColorIndex = 4
                        
                    End If
        
                    'Reset TotalVolume to 0
                    TotalVolume = 0
        
                    'Set YearOpen for next stock
                    YearOpen = wks.Cells(i + 1, 3).Value
                
                End If
                
                'Increase LastRowSummary by 1
                LastRowSummary = LastRowSummary + 1
    
            End If
            
        Next i

        'Define Greatest increase ticker and value variables
        Dim GreatestInc As Double
        Dim GreatestIncTicker As String
        GreatestInc = wks.Cells(2, 11).Value
        GreatestIncTicker = ""

        'Define Greatest decrease ticker and value variables
        Dim GreatestDec As Double
        Dim GreatestDecTicker As String
        GreatestDec = wks.Cells(2, 11).Value
        GreatestDecTicker = ""

        'Define Greatest total volume ticker and value variables
        Dim GreatestTotal As Double
        Dim GreatestTotalTicker As String
        GreatestTotal = wks.Cells(2, 12).Value
        GreatestTotalTicker = ""

        For i = 2 To LastRowSummary

            'Check if next value is larger than greatest increase
            If wks.Cells(i, 11).Value > GreatestInc Then

                'Reassign Greatest increase variables
                GreatestInc = wks.Cells(i, 11).Value
                GreatestIncTicker = wks.Cells(i, 9).Value

            End If

            'Check if next value is smaller than greatest decrease
            If wks.Cells(i, 11).Value < GreatestDec Then

                'Reassign Greatest decrease variables
                GreatestDec = wks.Cells(i, 11).Value
                GreatestDecTicker = wks.Cells(i, 9).Value
                
            End If

            'Check if next value is larger than greatest total volume
            If wks.Cells(i, 12).Value > GreatestTotal Then

                'Reassign Greatest total variables
                GreatestTotal = wks.Cells(i, 12).Value
                GreatestTotalTicker = wks.Cells(i, 9).Value
            
            End If
        
        Next i

        'Set up headers for greatest section
        wks.Cells(1, 16).Value = "Ticker"
        wks.Cells(1, 17).Value = "Value"

        'Input Greatest Increase values
        wks.Cells(2, 15).Value = "Greatest % Increase"
        wks.Cells(2, 16).Value = GreatestIncTicker
        wks.Cells(2, 17).Value = GreatestInc
        wks.Cells(2, 17).Style = "Percent"

        'Input Greatest Decrease values
        wks.Cells(3, 15).Value = "Greatest % Decrease"
        wks.Cells(3, 16).Value = GreatestDecTicker
        wks.Cells(3, 17).Value = GreatestDec
        wks.Cells(3, 17).Style = "Percent"

        'Input Greatest Total Volume values
        wks.Cells(4, 15).Value = "Greatest Total Volume"
        wks.Cells(4, 16).Value = GreatestTotalTicker
        wks.Cells(4, 17).Value = GreatestTotal
        
    Next wks

End Sub