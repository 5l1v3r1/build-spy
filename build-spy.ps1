# Build-Spy - Version 0.1 - James Smith (@osiris2600)
# Build-Spy is a quick and dirty Powershell script to aid in information gathering when performing on-host build reviews as part of a penetration testing engagement.
# When on an engagement that has build-reviews in scope a lot of manual checks are normally performed such as does the machine have the on-host firewall enabled, 
# is UAC enabled etc. This can sometimes be a time consuming task. So I decided to create this script which will dump the information into a text file for easy viewing.

Clear-Host
$getDate = Get-Date

# Elevate Script via UAC Prompt, credit to Sycnex for the method.
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
    Start-Sleep 1
    Write-Host "                                               3"
    Start-Sleep 1
    Write-Host "                                               2"
    Start-Sleep 1
    Write-Host "                                               1"
    Start-Sleep 1
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
    Exit
}


"---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report
"Build-Spy V0.1 - Quick and Dirty Build Review Script By James Smith (@osiris2600)" | Tee-Object -FilePath .\Build-Spy.Report -Append
"Script started at $getDate" | Tee-Object -FilePath .\Build-Spy.Report -Append
"" | Tee-Object -FilePath .\Build-Spy.Report -Append  
"" | Tee-Object -FilePath .\Build-Spy.Report -Append 
"" | Tee-Object -FilePath .\Build-Spy.Report -Append 
"General System Information" | Tee-Object -FilePath .\Build-Spy.Report -Append
"---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append 
Get-ComputerInfo -property 'CsName','CsDomain','WindowsProductName','WindowsEditionId','WindowsCurrentVersion','WindowsVersion','WindowsRegisteredOrganization','CsDNSHostName','CSDdomain','CSDomainRole','CsAdminPasswordStatus','CsManufacturer','CsModel','CsPrimaryOwnerName','OsEncryptionLevel','LogonServer' | Format-List | Out-File .\Build-Spy.Report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "BIOS Information" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Get-ComputerInfo -property BiosManufacturer, BiosBIOSVersion, BiosDescription, BiosReleaseDate, BiosSeralNumber, BiosSMBIOSBIOSVersion, BiosSMBIOSMajorVersion, BiosSMBIOSMinorVersion | Format-List | Out-File .\Build-Spy.Report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
"---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
"BitLocker Status" | Tee-Object -FilePath .\Build-Spy.Report -Append
"---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Get-BitLockerVolume | Format-List -Property Computername, MountPoint, EncryptionMEthod, AutolockEnabled, VolumeStatus, EncryptionPercentage | Out-File .\Build-Spy.Report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "Local Administrators" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Get-LocalGroupMember -Group "Administrators" | Out-File .\Build-Spy.report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "Firewall Status" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Get-NetFirewallProfile -All | Format-List -Property Name, Enabled, LogFileName | Out-File .\Build-Spy.Report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "HotFix Status" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Get-HotFix | Format-Table -Property Description, HotFixID, InstalledOn | Out-File .\Build-Spy.Report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "Audit Policy Configuration" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
auditpol.exe /get /category:* | findstr /r /v "^$" | Out-File .\Build-Spy.report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "UAC Status" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
$uacquery = REG QUERY HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v EnableLUA
if ($uacquery -match "0x1")
{
    Write-Output "`r`n***UAC is Enabled***`r`n" | Out-File .\Build-Spy.Report -Append
}
else {
    Write-Output "`r`n***UAC is Disabled***`r`n" | Out-File .\Build-Spy.Report -Append
}
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "Plaintext Passwords in Registry" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
reg query HKLM /f password /t REG_SZ /s | findstr /r /v "^$" | Out-File .\Build-Spy.report -Append
reg query HKCU /f password /t REG_SZ /s | findstr /r /v "^$" | Out-File .\Build-Spy.report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "Installed Software" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
wmic product get name,version | findstr /r /v "^$" | Out-File .\Build-Spy.Report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "Firewall Rules" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Get-NetFirewallRule | Format-List -Property Name, DisplayName, Description, DisplayGroup, Enabled, Profile, Action | Out-File .\Build-Spy.Report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Host "Script completed at $getdate, Please see your Build-Spy Report"
notepad.exe .\Build-Spy.Report
Write-Host ""
