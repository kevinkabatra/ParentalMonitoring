function Kabatra.ParentalMonitoring.Invoke-Monitoring
{
    $configurationFilePath = "C:\Users\kevin\Desktop\ParentalMonitoring\configuration.json"
    $configuration = Get-Content -Path $configurationFilePath | ConvertFrom-Json

    $isBlockedByTime = Kabatra.ParentalMonitoring.Get-IsBlockedByTime -BlockWebsiteTimeStart $configuration.blockWebsiteTimeStart -BlockWebsiteTimeStop $configuration.blockWebsiteTimeStop -ApiKey $configuration.apiKey -ErrorAction Stop
    if($isBlockedByTime)
    {
        Write-Host "Blocking websites as specified in the configuration file."
        Kabatra.Common.HOSTS.Disable-Website -WebsiteToBlock $configuration.blockListWebsites
        Write-Host "Blocking is complete"
    }
    else
    {
        Write-Host "Unblocking websites as specified in the configuration file."
        Kabatra.Common.HOSTS.Enable-Website -WebsiteToEnable $configuration.blockListWebsites
        Write-Host "Unblocking is complete"
    }

    # Flush the DNS to allow any updates to the HOSTS file to take immediate effect
    $flushDnsCommand = "ipconfig /flushdns"
    Invoke-Expression -Command $flushDnsCommand
}