function Kabatra.ParentalMonitoring.Logging.Write-EventLogScheduledTaskExists
{
    [CmdletBinding()]
    param()

    $applicationName = Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName -ErrorAction Stop    
    Kabatra.Common.Logging.Write-EventLog -ApplicationName $applicationName -Message "Scheduled task already existed, nothing to do."
}