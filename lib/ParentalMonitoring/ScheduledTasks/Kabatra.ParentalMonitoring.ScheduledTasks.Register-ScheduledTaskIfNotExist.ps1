function Kabatra.Private.Register-ScheduledTask
{
    [CmdletBinding()]
    param()

    $keepAliveDirectory = "$($PSScriptRoot)\Scripts"
    # Need to concatenate the string this way to avoid PowerShell from adding a hidden character instead of `" at the very end of the string.
    # See: https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/41580937-new-scheduledtaskaction-adds-wrong-characters-to-a
    $powerShellArguments = "-ExecutionPolicy Bypass -File `"$($keepAliveDirectory)\Kabatra.ParentalMonitoring.ScheduledTasks.Keep-Alive.ps1" + '"'
    $action = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" –Argument $powerShellArguments
    
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $user = New-ScheduledTaskPrincipal "SYSTEM"
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DisallowHardTerminate -DontStopIfGoingOnBatteries -Hidden
    $parentalMonitoringKeepAliveTask = New-ScheduledTask -Action $action -Trigger $trigger -Principal $user -Settings $settings
    
    $newScheduledTask = Register-ScheduledTask -TaskName $applicationName -InputObject $parentalMonitoringKeepAliveTask -ErrorAction Stop
    return $newScheduledTask

}

function Kabatra.Private.Start-ScheduledTask
{
    [CmdletBinding()]
    param
    (
        $ScheduledTask
    )

    Start-ScheduledTask -InputObject $ScheduledTask
    Kabatra.ParentalMonitoring.Logging.Write-EventLogStartScheduledTask
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

    $parentalMonitoringTask = Get-ScheduledTask -TaskName $applicationName
    if($parentalMonitoringTask -eq $null)
    {
        $parentalMonitoringTask = Kabatra.Private.Register-ScheduledTask
        Kabatra.ParentalMonitoring.Logging.Write-EventLogRegisteredScheduledTask
    }
    else
    {
        Kabatra.ParentalMonitoring.Logging.Write-EventLogScheduledTaskExists
    }

    Kabatra.Private.Start-ScheduledTask -ScheduledTask $parentalMonitoringTask
}