<#
.SUMMARY
    This script is designed to register the Keep Alive script as a Scheduled Task.
.NOTES
    Author: Kevin Kabatra
    Date: 10/01 2020
    License: MIT. See https://opensource.org/licenses/MIT.
#>
$parentalMonitoringDirectory = $PSScriptRoot

$action = New-ScheduledTaskAction -Execute "$parentalMonitoringDirectory\Kabatra.ParentalMonitor.Keep-Alive.ps1"
$trigger = New-ScheduledTaskTrigger -AtStartup
$user = New-ScheduledTaskPrincipal "SYSTEM"
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DisallowHardTerminate -DontStopIfGoingOnBatteries -Hidden
$parentalMonitoringKeepAliveTask = New-ScheduledTask -Description "Parental Monitoring by Kevin Kabatra" -Action $action -Trigger $trigger -Principal $user -Settings $settings
Register-ScheduledTask -TaskName "Parental Monitoring by Kevin Kabatra" -InputObject $parentalMonitoringKeepAliveTask