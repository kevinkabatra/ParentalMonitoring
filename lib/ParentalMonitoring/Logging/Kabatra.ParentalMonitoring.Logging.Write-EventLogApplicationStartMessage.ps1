function Kabatra.ParentalMonitoring.Logging.Write-EventLogApplicationStartMessage
{
    [CmdletBinding()]
    param()

    $applicationName = Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName -ErrorAction Stop    
    Kabatra.Common.Logging.Write-EventLog -ApplicationName $applicationName -Message "$applicationName has started successfully."
}