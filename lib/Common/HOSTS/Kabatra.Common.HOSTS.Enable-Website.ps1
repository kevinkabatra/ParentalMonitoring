<#
.SYNOPSIS
    Enables a website by removing mapping for a hostname from HOSTS file.
.DESCRIPTION
    This is to be used in combination with Disable-Website, which creates an entry
    in the HOSTS file to disable a website via routing the hostname to localhost.
.PARAMETER WebsiteToEnable
    String Array. Website(s) to enable.
.INPUTS
    This commandlet does not support piping.
.OUTPUTS
    None.
.NOTES
    Author: Kevin Kabatra
    Date: 09/27 2020
    License: MIT. See https://opensource.org/licenses/MIT.
.EXAMPLES
    $configurationFilePath = "C:\Users\kevin\Desktop\ParentalMonitoring\configuration.json"
    $configuration = Get-Content -Path $configurationFilePath | ConvertFrom-Json
    
    Kabatra.Common.HOSTS.Enable-Website -WebsiteToEnable $configuration.blockListWebsites
#>
function Kabatra.Common.HOSTS.Enable-Website
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory=$true)] [string[]] $WebsiteToEnable
    )

    foreach($website in $WebsiteToEnable)
    {
        Kabatra.Common.HOSTS.Write-HostsFile -Content "127.0.0.1 $website" -ActionType Remove
        Kabatra.Common.HOSTS.Write-HostsFile -Content "127.0.0.1 www.$($website)" -ActionType Remove
    }
}