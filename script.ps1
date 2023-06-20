Write-Output "Starting Installation"
$sysmonUrl = "https://download.sysinternals.com/files/Sysmon.zip"
$sysmonTempPath = "$env:TEMP\Sysmon"
$sysmonInstallPath = "C:\Sysmon"
$ConfigUrl = "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml"

New-Item -ItemType Directory -Path $sysmonTempPath -Force | Out-Null

Write-Output "Downloading sysmon"
Invoke-WebRequest -Uri $sysmonUrl -OutFile "$sysmonTempPath\Sysmon.zip"

Expand-Archive -Path "$sysmonTempPath\Sysmon.zip" -DestinationPath $sysmonTempPath

New-Item -ItemType Directory -Path $sysmonInstallPath -Force | Out-Null

Write-Output "Creating sysmon folder in c:\"

Copy-Item -Path "$sysmonTempPath\Sysmon64.exe" -Destination $sysmonInstallPath -Force

Write-Output "Downloading sysmon config file"
Invoke-WebRequest -Uri $ConfigUrl -OutFile "$sysmonInstallPath\sysmonconfig.xml"

Write-Output "Installaing sysmon"

Start-Process -FilePath "$sysmonInstallPath\Sysmon64.exe" -ArgumentList "/accepteula -i $sysmonInstallPath\sysmonconfig.xml" -Wait

Remove-Item -Path $sysmonTempPath -Force -Recurse

Write-Output " Installation Completed"
