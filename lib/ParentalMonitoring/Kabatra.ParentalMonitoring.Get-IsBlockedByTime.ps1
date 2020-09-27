<#
.SYNOPSIS
    Determines if Parental Monitoring should block the desired Applications, Websites, etc.
.PARAMETER ApiKey
    String. API key provided by Time Zone DB.
.PARAMETER BlockWebsiteTimeStart
    String. Start time when Parental Monitoring should enforce blocking.
.PARAMETER BlockWebsiteTimeStop
    String. Stop time when Parental Monitoring should enforce blocking.
.INPUTS
    This commandlet does not support piping.
.OUTPUTS
    Boolean. Should Parental Monitoring enforce blocking.
.NOTES
    Author: Kevin Kabatra
    Date: 09/27 2020
    License: MIT. See https://opensource.org/licenses/MIT.
.EXAMPLE
    $configurationFilePath = "C:\Users\kevin\Desktop\ParentalMonitoring\configuration.json"
    $configuration = Get-Content -Path $configurationFilePath | ConvertFrom-Json

    Kabatra.ParentalMonitoring.Get-IsBlockedByTime -BlockWebsiteTimeStart $configuration.blockWebsiteTimeStart -BlockWebsiteTimeStop $configuration.blockWebsiteTimeStop -ApiKey $configuration.apiKey
#>
function Kabatra.ParentalMonitoring.Get-IsBlockedByTime
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory=$true)] [string] $BlockWebsiteTimeStart,
        [parameter(Mandatory=$true)] [string] $BlockWebsiteTimeStop,
        [parameter(Mandatory=$true)] [string] $ApiKey
    )

    $time = Kabatra.Common.Date.Get-Time -ApiKey $ApiKey
    Write-Host $time
    if($time -ge $BlockWebsiteTimeStart)
    {
        Write-Host "after start time"
    }

    if($time -le $BlockWebsiteTimeStop)
    {
        Write-Host "before stop time"
    }

    if($time -ge $BlockWebsiteTimeStart -and $time -le $BlockWebsiteTimeStop)
    {
        return $true
    }

    return $false
}