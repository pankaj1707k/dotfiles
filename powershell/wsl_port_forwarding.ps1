# Derived from https://github.com/microsoft/WSL/issues/4150#issuecomment-504209723
# Requires firewall rule to allow inbound traffic to specified ports

$remoteaddr = bash.exe -c "ifconfig eth0 | grep 'inet '"
$found = $remoteaddr -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';

if ($found) {
  $remoteaddr = $matches[0];
} else {
  echo "WSL2 ip address cannot be found";
  exit;
}

# Ports to forward separated by commas
$ports = @(3000,8000,8080);

# You can change the addr to your ip config to listen to a specific address
$addr = '0.0.0.0';
$ports_a = $ports -join ",";

for ($i = 0; $i -lt $ports.length; $i++) {
  $port = $ports[$i];
  netsh interface portproxy delete v4tov4 listenport=$port listenaddress=$addr;
  netsh interface portproxy add v4tov4 listenport=$port listenaddress=$addr connectport=$port connectaddress=$remoteaddr;
}