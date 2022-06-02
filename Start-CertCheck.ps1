param (
        [parameter(mandatory=$true,position=1)]
        $URL
)

$FQDN = "$URL"
$URL = "$URL" + ":"  + "443"
$CertCheck = echo "Q" | openssl s_client -connect $URL 2>/dev/null | openssl x509 -noout -dates
$CertCheck = ($CertCheck | Select-String -Pattern notAfter)
$CertCheck = $CertCheck -replace "notAfter=",""
$CertCheck = $CertCheck.split() | Where {$_}

$Month = $CertCheck[0]
$Day = $CertCheck[1]
$Year = $CertCheck[3]
 

$DaysUntilExpiration = "$Year" + "-" +  "$Day" + "-" + "$Month"
$DaysUntilExpiration = [DateTime]$DaysUntilExpiration
$DaysUntilExpiration = (($DaysUntilExpiration) - (Get-Date)).Days


if ($Month -eq "Jan"){
$Month = "1"
}

if ($Month -eq "Feb"){
$Month = "2"
}

if ($Month -eq "Mar"){
$Month = "3"
}

if ($Month -eq "Apr"){
$Month = "4"
}

if ($Month -eq "May"){
$Month = "5"
}

if ($Month -eq "Jun"){
$Month = "6"
}

if ($Month -eq "Jul"){
$Month = "7"
}

if ($Month -eq "Aug"){
$Month = "8"
}

if ($Month -eq "Sep"){
$Month = "9"
}

if ($Month -eq "Oct"){
$Month = "10"
}

if ($Month -eq "Nov"){
$Month = "11"
}

if ($Month -eq "Dec"){
$Month = "12"
}

$Date = "$Month" + "/" + "$Day" + "/" + "$Year"


$Expiration = [PSCustomObject] @{
    URL = "$FQDN"
    'Expires(Days)' = "$DaysUntilExpiration"
    Date = "$Date"
}
$Expiration
