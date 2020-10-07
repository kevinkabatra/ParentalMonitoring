function Kabatra.Private.Import-Module
{
    [CmdletBinding()]
    param()

    $installersPath = $PSScriptRoot
    $parentalMonitoringPath = Split-Path -Path $installersPath -Parent
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

function Kabatra.ParentalMonitoring.Installers.Install-ParentalMonitoring
{
    [CmdletBinding()]
    param()

    Kabatra.Private.Import-Module -ErrorAction Stop

    Kabatra.ParentalMonitoring.ScheduledTasks.Register-ScheduledTaskIfNotExist
    Kabatra.ParentalMonitoring.Logging.New-EventLogIfNotExist

    $libPath = Kabatra.ParentalMonitoring.Helpers.Get-LibPath
    $keepAlivePath = "$($libPath)\ParentalMonitoring\ScheduledTasks\Scripts\Kabatra.ParentalMonitoring.ScheduledTasks.Keep-Alive.ps1"
    if(!(Test-Path -Path $keepAlivePath))
    {
        throw "Cannot find keep alive."
    }

    Invoke-Expression -Command "$keepAlivePath"
}