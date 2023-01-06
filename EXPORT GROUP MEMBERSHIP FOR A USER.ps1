import-module ActiveDirectory
Write-Host "Welcome, please enter the name of the user. "
$groupList = Read-Host 'Enter the group like this without quotes (jgorman)'
$nameofCSV = Read-Host 'Enter a name of the file you would like to use (DO NOT PUT .CSV IN THE NAME!)'
Write-Host "Please wait this could take a while"
Get-ADPrincipalGroupMembership $groupList | select name
Get-ADPrincipalGroupMembership $groupList | select name | export-csv C:\temp\$nameofcsv.csv -Verbose
invoke-item C:\temp\$nameofcsv.csv
Write-Host "All done, check your file out at C:\temp\$nameofcsv.csv"
pause



