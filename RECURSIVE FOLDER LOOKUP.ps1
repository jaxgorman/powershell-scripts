﻿Write-Host "Welcome, please enter the name of the folder you would like to get the base files from"
$folderList = Read-Host "Enter the folder name like the example, DO NOT USE QUOTES! ( X:\Matters\IP\2241159 American Consolidated Ind., et al. v. Campbell, Blasingim)"
$folderListCorrected = $folderList.Replace("`"","")
Write-Host $folderlistCorrected
$folderListCorrected2 = "`"$folderListCorrected`""
Write-Host $folderListCorrected2
$nameofCSV = Read-Host 'Enter a name of the file you would like to use (DO NOT PUT .CSV IN THE NAME!)'
Write-Host "Please wait this could take a while"
Get-ChildItem -Path $folderList -Recurse | where { ! $_.PSIsContainer } | Select Name,FullName | Export-Csv C:\temp\$nameofcsv.csv -NoTypeInformation
Write-Host "All done, check your file out at C:\temp\$nameofcsv.csv"
invoke-item C:\temp\$nameofcsv.csv
pause