$target = services
$user = sophie

Add-MailboxFolderPermission $target -User $user -AccessRights Reviewer

ForEach($folder in (Get-MailboxFolderStatistics -Identity $target) )
{
$fname = "$target:" + $folder.FolderPath.Replace("/","\");
Add-MailboxFolderPermission $fname -User $user -AccessRights Reviewer
}
