#For Office 2013/2016, force modern auth

$registryPath1 = "HKCU:\Software\Microsoft\Exchange"
$registryPath2 = "HKCU:\Software\Microsoft\Office\15.0\Common\Identity"
$value = "1"
$name1 = "AlwaysUseMSOAuthForAutoDiscover"
$name2 = "EnableADAL"
$name3 = "Version"


IF(!(Test-Path $registryPath1))
    {
    New-Item -Path $registryPath1 -Force | Out-Null
    New-ItemProperty -Path $registryPath1 -Name $name1 -Value $value -PropertyType DWORD -Force | Out-Null
    }

 ELSE 
    {
    New-ItemProperty -Path $registryPath1 -Name $name1 -Value $value -PropertyType DWORD -Force | Out-Null
    }

IF(!(Test-Path $registryPath2))
    {
    New-Item -Path $registryPath2 -Force | Out-Null
    New-ItemProperty -Path $registryPath2 -Name $name2 -Value $value -PropertyType DWORD -Force | Out-Null
    New-ItemProperty -Path $registryPath2 -Name $name3 -Value $value -PropertyType DWORD -Force | Out-Null
    }

 ELSE 
    {
    New-ItemProperty -Path $registryPath2 -Name $name2 -Value $value -PropertyType DWORD -Force | Out-Null
    New-ItemProperty -Path $registryPath2 -Name $name3 -Value $value -PropertyType DWORD -Force | Out-Null
    }
