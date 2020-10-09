enum ActionType
{
    Append
    Remove
}

$hostsFilePath = "C:\Windows\System32\drivers\etc\hosts"

function Kabatra.Common.HOSTS.Get-HostsFileContent
{
    [CmdletBinding()]
    param()
    
    if(!(Test-Path $hostsFilePath))
    {
        throw "Could not locate HOSTS file, something went wrong."
    }

    return (Get-Content -Path $hostsFilePath)
}

function Kabatra.Common.HOSTS.Append-HostsFileContent
{
    [CmdletBinding()]
    param
    (        
        [parameter(Mandatory=$true)] $HostsFileContent,
        [parameter(Mandatory=$true)] [string] $ContentToAppend
    )

    if($HostsFileContent -notcontains $ContentToAppend)
    {
        $ContentToAppend | Out-File -FilePath $hostsFilePath -Append -Force
    }
}

function Kabatra.Common.HOSTS.Remove-HostsFileContent
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory=$true)] [System.Array] $HostsFileContent,
        [parameter(Mandatory=$true)] [string] $ContentToRemove
    )

    if($HostsFileContent -contains $ContentToRemove)
    {
        # Clear the HOSTS file
        "" | Out-File -FilePath $hostsFilePath -Force

        $filteredContent = [System.Collections.ArrayList]@()
        foreach($line in $HostsFileContent)
        {
            if($line -contains $ContentToRemove)
            {
                continue
            }

            $filteredContent.Add($line) > $null;
        }

        $filteredContent | Out-File -FilePath $hostsFilePath -Force -ErrorAction Continue -ErrorVariable setOriginalContentOnError        
        if($setOriginalContentOnError)
        {
            $HostsFileContent | Out-File -FilePath $hostsFilePath -Force
            throw "There was an error, reverting any changes to HOSTS file."
        }
    }
}

<#
.SYNOPSIS
    Appends content to or removes content from the HOSTS file.
.PARAMETER Content
    String. Content to append to or remove from HOSTS file. This content will only
    append if not already present.
.PARAMETER ActionType
    String. Which action are we taking? Validate options are:
        1. Append
        2. Remove
.INPUTS
    This commandlet does not support piping.
.OUTPUTS
    None.
.LINK
    Using an Enum in PowerShell as a parameter: https://geekeefy.wordpress.com/2016/06/23/2-today-i-learned-using-enum-as-parameter-validation/
.NOTES
    Author: Kevin Kabatra
    Date: 09/27 2020
    License: MIT. See https://opensource.org/licenses/MIT.
.EXAMPLES
    Kabatra.Common.HOSTS.Write-HostsFile -Content "Hello World" -ActionType Append
.EXAMPLES
    Kabatra.Common.HOSTS.Write-HostsFile -Content "Hello World" -ActionType Remove
#>
function Kabatra.Common.HOSTS.Write-HostsFile
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory=$true)] [string] $Content,
        [parameter(Mandatory=$true)] [ActionType] [string] $ActionType
    )

    $hostsFileContent = Kabatra.Common.HOSTS.Get-HostsFileContent
    if($hostsFileContent -eq $null)
    {
        $hostsFileContent = ""    
    }

    if($ActionType -eq [ActionType]::Append)
    {
        Kabatra.Common.HOSTS.Append-HostsFileContent -HostsFileContent $hostsFileContent -ContentToAppend $Content
    }
    elseif($ActionType -eq [ActionType]::Remove)
    {
        Kabatra.Common.HOSTS.Remove-HostsFileContent -HostsFileContent $hostsFileContent -ContentToRemove $Content
    }
    else
    {
        throw "Operation not supported."
    }
}