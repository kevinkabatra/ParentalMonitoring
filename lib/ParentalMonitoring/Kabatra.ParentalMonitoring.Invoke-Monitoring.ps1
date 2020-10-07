function Kabatra.ParentalMonitoring.Invoke-Monitoring
{
    $configurationFilePath = "C:\Users\kevin\Desktop\ParentalMonitoring\configuration.json"
    $configuration = Get-Content -Path $configurationFilePath | ConvertFrom-Json

    $isBlockedByTime = Kabatra.ParentalMonitoring.Get-IsBlockedByTime -BlockWebsiteTimeStart $configuration.blockWebsiteTimeStart -BlockWebsiteTimeStop $configuration.blockWebsiteTimeStop -ApiKey $configuration.apiKey -ErrorAction Stop
    if($isBlockedByTime)
    {
        Write-Verbose "Blocking websites as specified in the configuration file."
        
        Kabatra.Common.HOSTS.Disable-Website -WebsiteToBlock $configuration.blockListWebsites
        
        Write-Verbose "Blocking is complete"
        Kabatra.ParentalMonitoring.Logging.Write-EventLogBlockingSites
    }
    else
    {
        Write-Verbose "Unblocking websites as specified in the configuration file."
        
        Kabatra.Common.HOSTS.Enable-Website -WebsiteToEnable $configuration.blockListWebsites
        
        Write-Verbose "Unblocking is complete"
        Kabatra.ParentalMonitoring.Logging.Write-EventLogUnblockingSites
    }

    # Flush the DNS to allow any updates to the HOSTS file to take immediate effect
    $flushDnsCommand = "ipconfig /flushdns"
    Invoke-Expression -Command $flushDnsCommand > $null

    Write-Verbose "DNS has been flushed."
    Kabatra.ParentalMonitoring.Logging.Write-EventLogDnsFlushed
}