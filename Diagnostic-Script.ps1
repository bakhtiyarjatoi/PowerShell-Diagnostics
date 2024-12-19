# Get the directory where the script is being executed
$OutputDirectory = $PSScriptRoot

# Create the output directory if it doesn't exist (not necessary here, as it will always be the script's directory)
if (-not (Test-Path -Path $OutputDirectory)) {
    New-Item -ItemType Directory -Path $OutputDirectory
}

# Define the file paths for CSVs
$SystemInfoFile = "$OutputDirectory\SystemInfo.csv"
$NetworkConfigFile = "$OutputDirectory\NetworkConfig.csv"
$DNSConfigFile = "$OutputDirectory\DNSConfig.csv"
$RunningProcessesFile = "$OutputDirectory\RunningProcesses.csv"
$RunningServicesFile = "$OutputDirectory\RunningServices.csv"
$EventLogsFile = "$OutputDirectory\EventLogs.csv"
$DiskUsageFile = "$OutputDirectory\DiskUsage.csv"
$InstalledAppsFile = "$OutputDirectory\InstalledApps.csv"
$HotfixesFile = "$OutputDirectory\Hotfixes.csv"
$SystemUptimeFile = "$OutputDirectory\SystemUptime.csv"
$UserAccountsFile = "$OutputDirectory\UserAccounts.csv"

# System Information
Get-ComputerInfo | Select-Object CsName, OsName, OsArchitecture, WindowsVersion, WindowsBuildLabEx, CsProcessors, CsTotalPhysicalMemory |
    Export-Csv -Path $SystemInfoFile -NoTypeInformation

# Network Configuration
Get-NetIPAddress | Select-Object InterfaceAlias, IPAddress, PrefixLength, AddressFamily |
    Export-Csv -Path $NetworkConfigFile -NoTypeInformation

# DNS Configuration
Get-DnsClient | Select-Object InterfaceAlias, ServerAddresses |
    Export-Csv -Path $DNSConfigFile -NoTypeInformation

# Running Processes
Get-Process | Select-Object Name, Id, CPU, StartTime | Sort-Object -Property CPU -Descending |
    Export-Csv -Path $RunningProcessesFile -NoTypeInformation

# Running Services
Get-Service | Where-Object { $_.Status -eq "Running" } |
    Export-Csv -Path $RunningServicesFile -NoTypeInformation

# Event Logs (System Errors in the last 24 hours)
Get-WinEvent -FilterHashtable @{LogName="System"; StartTime=(Get-Date).AddDays(-1)} |
    Select-Object TimeCreated, Id, LevelDisplayName, Message |
    Export-Csv -Path $EventLogsFile -NoTypeInformation

# Disk Usage
Get-PSDrive -PSProvider FileSystem |
    Select-Object Name, @{Label="Used(GB)";Expression={[math]::round($_.Used / 1GB, 2)}},
                  @{Label="Free(GB)";Expression={[math]::round($_.Free / 1GB, 2)}},
                  @{Label="Total(GB)";Expression={[math]::round($_.Used / 1GB + $_.Free / 1GB, 2)}} |
    Export-Csv -Path $DiskUsageFile -NoTypeInformation

# Installed Applications
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |
    Sort-Object -Property DisplayName |
    Export-Csv -Path $InstalledAppsFile -NoTypeInformation

# Installed Hotfixes
Get-HotFix |
    Export-Csv -Path $HotfixesFile -NoTypeInformation

# System Uptime
((Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime) |
    Export-Csv -Path $SystemUptimeFile -NoTypeInformation

# User Accounts
Get-LocalUser |
    Export-Csv -Path $UserAccountsFile -NoTypeInformation

# Registry Operations (e.g., Startup Programs)
$StartupProgramsFile = "$OutputDirectory\StartupPrograms.csv"
Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" |
    Select-Object PSChildName, Value |
    Export-Csv -Path $StartupProgramsFile -NoTypeInformation

# Scheduled Tasks
$ScheduledTasksFile = "$OutputDirectory\ScheduledTasks.csv"
Get-ScheduledTask | Select-Object TaskName, TaskPath, State, Actions |
    Export-Csv -Path $ScheduledTasksFile -NoTypeInformation


# Notify user of report location
"Diagnostics report saved to: $OutputDirectory" | Write-Output

"Script made with ❤️ by Bakhtiyar Ahmad" | Write-Output
