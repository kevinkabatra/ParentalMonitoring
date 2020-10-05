function Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName
{
    [CmdletBinding()]
    param()

    
    $strings = Kabatra.ParentalMonitoring.Helpers.Get-Strings
    if($strings.applicationName -eq "" -or $strings.applicationName -eq $null)
    {
        throw "Unable to find name of Application. Check resource file."
    }

    return $strings.applicationName
}