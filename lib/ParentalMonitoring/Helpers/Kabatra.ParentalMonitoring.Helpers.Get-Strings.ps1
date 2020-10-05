function Kabatra.ParentalMonitoring.Helpers.Get-StringsPath
{
    [CmdletBinding()]
    param()

    $libPath = Kabatra.ParentalMonitoring.Helpers.Get-LibPath
    $sourcePath = Split-Path -Path $libPath -Parent
    $stringsPath = "$sourcePath/resources/strings_enUS.json"

    return $stringsPath
}

function Kabatra.ParentalMonitoring.Helpers.Get-Strings
{
    [CmdletBinding()]
    param()

    $stringsPath = Kabatra.ParentalMonitoring.Helpers.Get-StringsPath
    $strings = Get-Content -Path $stringsPath | ConvertFrom-Json

    return $strings
}