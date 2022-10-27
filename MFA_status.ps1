#Extract the status of MFA off all users with a licence.

connect-msolservice

get-msoluser | Where-object {$_.Islicensed -eq $true} | Select-Object DisplayName,UserPrincipalName,@{N="MFA Ready"; E={ if( $_.StrongAuthenticationMethods -ne $null){"Yes"} else { "No"}}},@{N="MFA Admin Enforced"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){ $_.StrongAuthenticationRequirements.State} else { "Disabled"}}} | export-CSV C:\temp\MFAStatus.csv -NoTypeInformation
