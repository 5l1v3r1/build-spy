Clear-Host
"---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report
"Build-Spy V0.1 - Quick and Dirty Build Review Script By James Smith (@osiris2600)" | Tee-Object -FilePath .\Build-Spy.Report -Append
"" | Tee-Object -FilePath .\Build-Spy.Report -Append  
"" | Tee-Object -FilePath .\Build-Spy.Report -Append 
"" | Tee-Object -FilePath .\Build-Spy.Report -Append 
"General System Information" | Tee-Object -FilePath .\Build-Spy.Report -Append
"---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append 
Get-ComputerInfo -property 'CsName','CsDomain','WindowsProductName','WindowsEditionId','WindowsCurrentVersion','WindowsVersion','WindowsRegisteredOrganization','CsDNSHostName','CSDdomain','CSDomainRole','CsAdminPasswordStatus','CsManufacturer','CsModel','CsPrimaryOwnerName','OsEncryptionLevel','LogonServer' | Format-List | Out-File .\Build-Spy.Report -Append
Write-Output "" 
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
auditpol.exe /get /category:* | Out-File .\Build-Spy.report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Output ""
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "Plaintext Passwords in Registry" | Tee-Object -FilePath .\Build-Spy.Report -Append
Write-Output "---------------------------------------------------------------------------------" | Tee-Object -FilePath .\Build-Spy.Report -Append
reg query HKLM /f password /t REG_SZ /s | Out-File .\Build-Spy.report -Append
reg query HKCU /f password /t REG_SZ /s | Out-File .\Build-Spy.report -Append
Write-Host "*DONE*" -ForegroundColor Black -BackgroundColor Green
Write-Host ""
Write-Host "Script completed, please see your Build-Spy Report"
notepad.exe .\Build-Spy.Report
Write-Host ""
