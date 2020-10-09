<#
.SYNOPSIS
    Gets the current Date Time.
.DESCRIPTION
    Leveraging API from TimeZoneDB to ensure that the time the monitoring software 
    is following is accurate. It is far too easy for an end user to adjust the time 
    of their machine in an attempt to circumnavigate any time-based monitoring system.

    Response from Time Zone DB:
        1. AM Date Time: 2020-09-27 07:38:02
        2. PM Date Time: 2020-09-27 12:47:10
.PARAMETER ApiKey
    String. API key provided by Time Zone DB.
.INPUTS
    This commandlet does not support piping.
.OUTPUTS
    String. Date time formatted as a string.
.LINK
    https://timezonedb.com/
.NOTES
    Author: Kevin Kabatra
    Date: 09/27 2020
    License: MIT. See https://opensource.org/licenses/MIT.
.EXAMPLE
    Kabatra.Common.Date.Get-DateTime -ApiKey "SecretKey"
#>
function Kabatra.Common.Date.Get-DateTime
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory=$true)] [string] $ApiKey
    )

    $getTimeUrl = "http://api.timezonedb.com/v2.1/get-time-zone"
    $timeZoneName = "America/New_York"
    $returnFormat = "json"

    <#
        The method of lookup. Supported options:
            zone - Lookup local time by using a time zone name.
            position - Lookup local time by using latitude & longitude of a city.
            PREMIUM city - Lookup time zone by searching city name.
            PREMIUM ip - Lookup time zone based on visitor IP address.
    #>
    enum LookupMethods
    {
        zone
        position
    }
    $lookupMethod = [LookupMethods]::zone

    $getTimeRequest = "$($getTimeUrl)?key=$($ApiKey)&format=$($returnFormat)&by=$($lookupMethod)&zone=$timeZoneName"
    $getTimeResponse = Invoke-WebRequest $getTimeRequest -UseBasicParsing
    if($getTimeResponse.StatusCode -ne "200")
    {
        throw "Unable to get time."    
    }

    $timeObject = ConvertFrom-Json -InputObject $getTimeResponse.Content
    $dateTime = $timeObject.formatted

    return $dateTime
}