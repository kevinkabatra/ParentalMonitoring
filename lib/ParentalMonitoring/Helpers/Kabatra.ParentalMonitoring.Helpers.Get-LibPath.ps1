function Kabatra.ParentalMonitoring.Helpers.Get-LibPath
{
    $helperPath = $PSScriptRoot
    $parentalMonitoringDirectory = Split-Path -Path $helperPath -Parent
    $libPath = Split-Path -Path $parentalMonitoringDirectory -Parent

    return $libPath
}