function Kabatra.Common.Logging.New-EventLogIfNotExist
{    
    [CmdletBinding()]
    param
    (
        $ApplicationName
    )

    $doesEventLogExist = Get-EventLog -LogName Application -Source $ApplicationName -ErrorAction SilentlyContinue
    if($doesEventLogExist -eq $null)
    {
        New-EventLog -LogName Application -Source $ApplicationName -ErrorAction Stop
    }
}