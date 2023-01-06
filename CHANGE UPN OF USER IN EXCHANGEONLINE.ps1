Connect-MsolService
Connect-ExchangeOnline -echavez
$oldupn = read-host "enter their CURRENT UPN WITH @STOUT.COM (enter something like this jgorman@stout)"
$newupn = read-host "enter their NEW UPN WITH @STOUT.COM (enter something like this jgorman2@stout.com)"
Try {
    Get-User -Identity $oldupn
}
catch{
    Write-Host "User doesn't exist bucko!"
    Pause
    break
}
set-msoluserprincipalname -userprincipalname "$oldupn" -NewUserPrincipalName "$newupn"
if($?)
{
    Write-Output "$oldupn is now $newupn"
}
else
{
    Write-Output "$oldupn is NOT $newupn. PLEASE DOUBLE CHECK"
}
write-host "All done! Bye!"