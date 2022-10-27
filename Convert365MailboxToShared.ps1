#Converts an Office 365 Mailbox from a standard one to a shared one and removes the licenses.

Connect-ExchangeOnline

$usermailbox = read-Host 'User mailbox to convert to shared mailbox'
$supervisor = read-Host 'User who is going to be having access to shared mailbox'

Set-Mailbox $usermailbox -Type shared


#Sleep a little for Microsoft
start-sleep -s 90


##Adjust these licenses according to the license that you have, but these two
##are the most common ones.


Add-MailboxPermission -Identity $usermailbox -User $supervisor -AccessRights FullAccess
connect-msolservice 
$MsolUser = Get-MsolUser -UserPrincipalName $usermailbox
$AssignedLicenses = $MsolUser.licenses.AccountSkuId
foreach($License in $AssignedLicenses) {
    Set-MsolUserLicense -UserPrincipalName $usermailbox -RemoveLicenses $License
}
