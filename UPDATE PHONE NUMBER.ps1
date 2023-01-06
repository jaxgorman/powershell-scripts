Connect-MsolService
$name = Read-Host "Please Enter the name of the person you would like to update (like jgorman)"
$number = Read-Host "Please enter the phone number (like +1.867.867.5309)"
$nameemail = "$name@stout.com"
$nameemail
Try {
    Get-ADuser -Identity $name
}
catch{
    Write-Host "Person doesn't exist bucko!"
    Pause
    break
}
Write-Host "Now Updating"
Set-MsolUser -UserPrincipalName $nameemail -MobilePhone $number
Get-MsolUser -UserPrincipalName $nameemail | select userprincipalname, MobilePhone
Write-Host "All Done"
pause