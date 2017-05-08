$Hostname = $env:COMPUTERNAME
$CertificateThumbprint = (New-SelfSignedCertificate -DnsName $Hostname -CertStoreLocation Cert:\LocalMachine\My).Thumbprint;
$CommandLine = "winrm create winrm/config/Listener?Address=*+Transport=HTTPS @{Hostname=`"$($Hostname)`";CertificateThumbprint=`"$($CertificateThumbprint)`"}";
CMD.EXE /C $CommandLine