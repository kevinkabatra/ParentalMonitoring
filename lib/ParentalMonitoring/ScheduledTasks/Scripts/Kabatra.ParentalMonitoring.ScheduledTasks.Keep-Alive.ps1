function Kabatra.Private.Import-Module
{
    [CmdletBinding()]
    param()

    $libPath = Kabatra.ParentalMonitoring.Helpers.Get-LibPath
    $sourcePath = Split-Path -Path $libPath -Parent

    Import-Module -Name $sourceDirectory\Kabatra.ParentalMonitoring.psd1 -Verbose -Force
}


<#
.SUMMARY
    This script is designed to run the Parental Monitoring application.
.DESCRIPTION
    This script is designed to check the configuration for Parental Monitoring
    every 60 seconds. This will enable the system to automatically disable or enable
    applications and websites that have been specified in the configuration.
.NOTES
    Author: Kevin Kabatra
    Date: 10/01 2020
    License: MIT. See https://opensource.org/licenses/MIT.
#>
Kabatra.Private.Import-Module

Kabatra.ParentalMonitoring.Logging.Write-EventLogApplicationStartMessage

while($true)
{
    Kabatra.ParentalMonitoring.Invoke-Monitoring
    
    Start-Sleep -Seconds 60
}