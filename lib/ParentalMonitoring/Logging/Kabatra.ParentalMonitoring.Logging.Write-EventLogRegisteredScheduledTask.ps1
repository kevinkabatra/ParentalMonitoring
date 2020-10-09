function Kabatra.ParentalMonitoring.Logging.Write-EventLogRegisteredScheduledTask
{
    [CmdletBinding()]
    param()

    $applicationName = Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName -ErrorAction Stop    
    Kabatra.Common.Logging.Write-EventLog -ApplicationName $applicationName -Message "Registered new Windows Scheduled Task."
}