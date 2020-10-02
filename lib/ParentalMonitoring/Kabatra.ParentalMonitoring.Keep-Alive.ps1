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
while($true)
{
    $parentalMonitoringDirectory = $PSScriptRoot
    $libDirectory = Split-Path -Path $parentalMonitoringDirectory -Parent
    $sourceDirectory = Split-Path -Path $libDirectory -Parent

    Import-Module -Name $sourceDirectory\Kabatra.ParentalMonitoring.psd1 -Verbose -Force
    Kabatra.ParentalMonitoring.Invoke-Monitoring
    
    Start-Sleep -Seconds 60
}