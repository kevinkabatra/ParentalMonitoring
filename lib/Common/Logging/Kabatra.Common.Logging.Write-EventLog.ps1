function Kabatra.Common.Logging.Write-EventLog
{
    [CmdletBinding()]
    param
    (
        $ApplicationName,
        $Message
    )

    Write-EventLog -LogName Application -Source $ApplicationName -EventId 0 -EntryType Information -Message $Message -ErrorAction Stop
}