Write-Host "Welcome, please enter the name of the group you would like to get the base groups from"
$groupList = Read-Host 'Enter the group like this without quotes ( srr network access)'
$groupListformatted = "$groupList"
Try {
    Get-ADGroup -Identity $groupListformatted
}
catch{
    Write-Host "Group doesn't exist bucko! The Group Name is probably wrong in AD! Please check!"
    Pause
    break
}
$nameofCSV = Read-Host 'Enter a name of the file you would like to use (DO NOT PUT .CSV IN THE NAME!)'
Write-Host "Please wait this could take a while"
Get-ADGroupMember -identity $groupListformatted -recursive | % {get-aduser $_ -properties emailaddress, Title, extensionattribute4 } | Select Name, SamAccountName, emailaddress, Title, extensionattribute4 | export-csv C:\temp\$nameofcsv.csv -Verbose
invoke-item C:\temp\$nameofcsv.csv
Write-Host "All done, check your file out at C:\temp\$nameofcsv.csv"
pause