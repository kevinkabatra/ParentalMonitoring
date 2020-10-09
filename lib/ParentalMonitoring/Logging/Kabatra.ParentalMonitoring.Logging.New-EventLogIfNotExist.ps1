function Kabatra.ParentalMonitoring.Logging.New-EventLogIfNotExist
{
    [CmdletBinding()]
    param()

    $applicationName = Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName -ErrorAction Stop
    Kabatra.Common.Logging.New-EventLogIfNotExist -ApplicationName $applicationName
}