#Automapping disabled
$shared = Read-Host "Enter shared mailbox"
$user = Read-Host "Enter user mailbox"
Add-MailboxPermission -Identity $shared -User $user -AccessRights FullAccess -AutoMapping:$false
