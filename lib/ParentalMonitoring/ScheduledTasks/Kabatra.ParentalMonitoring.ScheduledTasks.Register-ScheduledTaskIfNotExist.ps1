function Kabatra.Private.Register-ScheduledTask
{
    [CmdletBinding()]
    param()

    $action = New-ScheduledTaskAction -Execute "C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe" –Argument “-File `"$($PSScriptRoot)\Kabatra.ParentalMonitor.Keep-Alive.ps1`”"
    $trigger = New-ScheduledTaskTrigger -AtStartup
    $user = New-ScheduledTaskPrincipal "SYSTEM"
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DisallowHardTerminate -DontStopIfGoingOnBatteries -Hidden
    $parentalMonitoringKeepAliveTask = New-ScheduledTask -Action $action -Trigger $trigger -Principal $user -Settings $settings
    Register-ScheduledTask -TaskName $applicationName -InputObject $parentalMonitoringKeepAliveTask -ErrorAction Stop
}

<#
.SUMMARY
    This script is designed to register the Keep Alive script as a Scheduled Task.
.NOTES
    Author: Kevin Kabatra
    Date: 10/01 2020
    License: MIT. See https://opensource.org/licenses/MIT.
#>
function Kabatra.ParentalMonitoring.ScheduledTasks.Register-ScheduledTaskIfNotExist
{
    [CmdletBinding()]
    param()

    $applicationName = Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName -ErrorAction Stop

    $doesScheduleTaskExist = Get-ScheduledTask -TaskName $applicationName
    if($doesScheduleTaskExist -eq $null)
    {
        Kabatra.Private.Register-ScheduledTask
        Kabatra.ParentalMonitoring.Logging.Write-EventLogRegisteredScheduledTask
    }
    else
    {
        Kabatra.ParentalMonitoring.Logging.Write-EventLogScheduledTaskExists
    }
}