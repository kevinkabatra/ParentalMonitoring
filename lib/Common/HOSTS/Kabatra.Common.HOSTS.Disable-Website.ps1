<#
.SYNOPSIS
    Disables a website by mapping a hostname to route to localhost.
.PARAMETER WebsiteToBlock
    String Array. Website(s) to block.
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
    
    Kabatra.Common.HOSTS.Disable-Website -WebsiteToBlock $configuration.blockListWebsites
#>
function Kabatra.Common.HOSTS.Disable-Website
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory=$true)] [string[]] $WebsiteToBlock
    )

    foreach($website in $WebsiteToBlock)
    {
        Kabatra.Common.HOSTS.Write-HostsFile -Content "127.0.0.1 $website" -ActionType Append
        Kabatra.Common.HOSTS.Write-HostsFile -Content "127.0.0.1 www.$($website)" -ActionType Append
    }
}