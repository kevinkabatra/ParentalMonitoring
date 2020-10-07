function Kabatra.Private.Import-Module
{
    [CmdletBinding()]
    param()

    $scriptsPath = $PSScriptRoot
    $scheduledTasksPath = Split-Path -Path $scriptsPath -Parent
    $parentalMonitoringPath = Split-Path -Path $scheduledTasksPath -Parent
    $getLibPathScript = "$parentalMonitoringPath\Helpers\Kabatra.ParentalMonitoring.Helpers.Get-LibPath.ps1"
    if(!(Test-Path -Path $getLibPathScript))
    {
        throw 'Cannot find commandlet to locate the lib directory.'
    }
    
    # Dot source the script, so it can be accessed in this session.
    . $getLibPathScript
    
    $libPath = Kabatra.ParentalMonitoring.Helpers.Get-LibPath
    $sourcePath = Split-Path -Path $libPath -Parent
    $moduleManifest = "$sourcePath\Kabatra.ParentalMonitoring.psd1"
    if(!(Test-Path -Path $moduleManifest))
    {        
        throw "Cannot locate module manifest @: $moduleManifest."
    }

    Import-Module -Name $moduleManifest -Force -ErrorAction Stop
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