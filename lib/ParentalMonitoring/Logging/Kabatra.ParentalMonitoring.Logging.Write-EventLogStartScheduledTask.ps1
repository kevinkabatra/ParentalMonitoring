function Kabatra.ParentalMonitoring.Logging.Write-EventLogStartScheduledTask
{
    [CmdletBinding()]
    param()

    $applicationName = Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName -ErrorAction Stop    
    Kabatra.Common.Logging.Write-EventLog -ApplicationName $applicationName -Message "Scheduled task has been started."
}