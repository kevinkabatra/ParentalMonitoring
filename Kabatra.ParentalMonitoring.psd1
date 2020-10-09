# Module manifest for module 'Kabatra.ParentalMonitoring'
# Generated by: Kevin Kabatra
# Generated on: 9/27/2020

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '1.1'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'b3d82dcc-0b78-44e1-8069-6e34af3c25d2'

# Author of this module
Author = 'Kevin Kabatra'

# Company or vendor of this module
#CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2020 Kevin Kabatra. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Provides ability to enable or disable specified applications and websites on a set schedule.'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @(
    "./lib/Common/Date/Kabatra.Common.Date.Get-DateTime.ps1",
    "./lib/Common/Date/Kabatra.Common.Date.Get-Time.ps1",
    
    "./lib/Common/HOSTS/Kabatra.Common.HOSTS.Disable-Website.ps1",
    "./lib/Common/HOSTS/Kabatra.Common.HOSTS.Enable-Website.ps1",
    "./lib/Common/HOSTS/Kabatra.Common.HOSTS.Write-HostsFile.ps1",
    
    "./lib/Common/Logging/Kabatra.Common.Logging.New-EventLogIfNotExist.ps1",
    "./lib/Common/Logging/Kabatra.Common.Logging.Write-EventLog.ps1",
    
    "./lib/ParentalMonitoring/Helpers/Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName.ps1",
    "./lib/ParentalMonitoring/Helpers/Kabatra.ParentalMonitoring.Helpers.Get-LibPath.ps1",
    "./lib/ParentalMonitoring/Helpers/Kabatra.ParentalMonitoring.Helpers.Get-Strings.ps1",

    "./lib/ParentalMonitoring/Installers/Kabatra.ParentalMonitoring.Installers.Install-ParentalMonitoring.ps1",

    "./lib/ParentalMonitoring/Logging/Kabatra.ParentalMonitoring.Logging.New-EventLogIfNotExist.ps1",
    "./lib/ParentalMonitoring/Logging/Kabatra.ParentalMonitoring.Logging.Write-EventLogApplicationStartMessage.ps1",
    "./lib/ParentalMonitoring/Logging/Kabatra.ParentalMonitoring.Logging.Write-EventLogBlockingSites.ps1",
    "./lib/ParentalMonitoring/Logging/Kabatra.ParentalMonitoring.Logging.Write-EventLogDnsFlushed.ps1",
    "./lib/ParentalMonitoring/Logging/Kabatra.ParentalMonitoring.Logging.Write-EventLogInstallationComplete.ps1",
    "./lib/ParentalMonitoring/Logging/Kabatra.ParentalMonitoring.Logging.Write-EventLogRegisteredScheduledTask.ps1",    
    "./lib/ParentalMonitoring/Logging/Kabatra.ParentalMonitoring.Logging.Write-EventLogScheduledTaskExists.ps1",
    "./lib/ParentalMonitoring/Logging/Kabatra.ParentalMonitoring.Logging.Write-EventLogStartScheduledTask.ps1",
    "./lib/ParentalMonitoring/Logging/Kabatra.ParentalMonitoring.Logging.Write-EventLogUnblockingSites.ps1",

    "./lib/ParentalMonitoring/ScheduledTasks/Kabatra.ParentalMonitoring.ScheduledTasks.Register-ScheduledTaskIfNotExist.ps1",

    "./lib/ParentalMonitoring/Kabatra.ParentalMonitoring.Get-IsBlockedByTime.ps1",
    "./lib/ParentalMonitoring/Kabatra.ParentalMonitoring.Invoke-Monitoring.ps1"
)

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
    "Kabatra.Common.Date.Get-DateTime",
    "Kabatra.Common.Date.Get-Time",

    "Kabatra.Common.HOSTS.Disable-Website",
    "Kabatra.Common.HOSTS.Enable-Website",
    "Kabatra.Common.HOSTS.Write-HostsFile",

    "Kabatra.Common.Logging.NewEventIfNotExist",
    "Kabatra.Common.Logging.Write-EventLog",

    "Kabatra.ParentalMonitoring.Helpers.Get-ApplicationName",
    "Kabatra.ParentalMonitoring.Helpers.Get-LibPath",
    "Kabatra.ParentalMonitoring.Helpers.Get-Strings",

    "Kabatra.ParentalMonitoring.Installers.Install-ParentalMonitoring",

    "Kabatra.ParentalMonitoring.Logging.New-EventLogIfNotExist",
    "Kabatra.ParentalMonitoring.Logging.Write-EventLogApplicationStartMessage",
    "Kabatra.ParentalMonitoring.Logging.Write-EventLogBlockingSites",
    "Kabatra.ParentalMonitoring.Logging.Write-EventLogDnsFlushed",
    "Kabatra.ParentalMonitoring.Logging.Write-EventLogInstallationComplete",
    "Kabatra.ParentalMonitoring.Logging.Write-EventLogRegisteredScheduledTask",
    "Kabatra.ParentalMonitoring.Logging.Write-EventLogScheduledTaskExists",
    "Kabatra.ParentalMonitoring.Logging.Write-EventLogStartScheduledTask",
    "Kabatra.ParentalMonitoring.Logging.Write-EventLogUnblockingSites",
    
    "Kabatra.ParentalMonitoring.ScheduledTasks.Register-ScheduledTaskIfNotExist",

    "Kabatra.ParentalMonitoring.Get-IsBlockedByTime",
    "Kabatra.ParentalMonitoring.Invoke-Monitoring"
)

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}