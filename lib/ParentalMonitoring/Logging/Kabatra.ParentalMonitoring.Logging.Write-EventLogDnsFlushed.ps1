function Kabatra.ParentalMonitoring.Logging.Write-EventLogDnsFlushed
{
    [CmdletBinding()]
    param()

    $applicationName = Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName -ErrorAction Stop    
    Kabatra.Common.Logging.Write-EventLog -ApplicationName $applicationName -Message "DNS has been flushed successfully."
}