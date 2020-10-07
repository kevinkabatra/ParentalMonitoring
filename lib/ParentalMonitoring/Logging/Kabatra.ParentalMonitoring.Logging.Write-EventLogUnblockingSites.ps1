function Kabatra.ParentalMonitoring.Logging.Write-EventLogUnblockingSites
{
    [CmdletBinding()]
    param()

    $applicationName = Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName -ErrorAction Stop    
    Kabatra.Common.Logging.Write-EventLog -ApplicationName $applicationName -Message "Unblocking completed. Any websites that were listed in the configuration file have been enabled successfully."
}