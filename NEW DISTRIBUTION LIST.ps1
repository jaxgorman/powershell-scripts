Start-Transcript
$groupList = Read-Host 'Enter the name like this without quotes ( All BV Analysts)'
$alias = Read-Host 'Enter the name WITHOUT SPACES like this (AllBVAnalysts)'
$author = Read-Host 'Enter your initials like this (JJG)'
$authoremail = Read-Host 'Enter your e-mail like this (jgorman@stout.com)'
$date = get-date -format MM/dd/yyyy
$grouplist
$alias
$author
$authoremail
Write-Host 'Is this right? If not please ctrl + c to stop!!!'
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://nc1exchange01/PowerShell/ -Authentication Kerberos -Credential $UserCredential
Import-PSSession $Session -DisableNameChecking
New-DistributionGroup -Type Security -Name "$grouplist" -Alias $alias -SamAccountName $alias -Notes "Created by $author on $date" -OrganizationalUnit "OU=Groups and DLs,DC=gosrr,DC=com" -ManagedBy $authoremail
pause
Write-Host "All Done, check SRR/Groups and DLs to make sure it is there"
Stop-Transcript
Get-PSSession | Remove-PSSession