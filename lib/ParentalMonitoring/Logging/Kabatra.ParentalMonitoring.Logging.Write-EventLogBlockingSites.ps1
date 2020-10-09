function Kabatra.ParentalMonitoring.Logging.Write-EventLogBlockingSites
{
    [CmdletBinding()]
    param()

    $applicationName = Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName -ErrorAction Stop    
    Kabatra.Common.Logging.Write-EventLog -ApplicationName $applicationName -Message "Blocking completed. Any websites that were listed in the configuration file have been disabled successfully."
}