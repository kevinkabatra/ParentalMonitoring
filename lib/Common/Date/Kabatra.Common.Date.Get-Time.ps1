<#
.SYNOPSIS
    Gets the current time.
.DESCRIPTION
    Leveraging API from TimeZoneDB to ensure that the time the monitoring software 
    is following is accurate. It is far too easy for an end user to adjust the time 
    of their machine in an attempt to circumnavigate any time-based monitoring system.

    Response from Time Zone DB:
        1. AM Date Time: 2020-09-27 07:38:02
.PARAMETER ApiKey
    String. API key provided by Time Zone DB.
.INPUTS
    This commandlet does not support piping.
.OUTPUTS
    String. Time formatted as a string.
.LINK
    https://timezonedb.com/
.NOTES
    Author: Kevin Kabatra
    Date: 09/27 2020
    License: MIT. See https://opensource.org/licenses/MIT.
.EXAMPLE
    Kabatra.Common.Date.Get-DateTime -ApiKey "SecretKey"
#>
function Kabatra.Common.Date.Get-Time
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory=$true)] [string] $ApiKey
    )

    $now = Kabatra.Common.Date.Get-DateTime -ApiKey $ApiKey
    $time = Get-Date -Date $now -DisplayHint Time

    return $time
}