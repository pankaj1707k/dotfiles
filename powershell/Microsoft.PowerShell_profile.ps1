oh-my-posh init pwsh --config "~/Documents/WindowsPowerShell/CustomThemes/onehalf.minimal.omp.json" | Invoke-Expression

function Enable-Proxy {
	$MainString = "{username}:{password}@{ipaddr}:{port}"
	[Environment]::SetEnvironmentVariable("http_proxy", "http://$MainString", "User")
	[Environment]::SetEnvironmentVariable("https_proxy", "https://$MainString", "User")
	[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://$MainString", "User")
	[Environment]::SetEnvironmentVariable("HTTPS_PROXY", "https://$MainString", "User")
	echo "Proxy set"
}

function Disable-Proxy {
	[Environment]::SetEnvironmentVariable("http_proxy", $null, "User")
	[Environment]::SetEnvironmentVariable("https_proxy", $null, "User")
	[Environment]::SetEnvironmentVariable("HTTP_PROXY", $null, "User")
	[Environment]::SetEnvironmentVariable("HTTPS_PROXY", $null, "User")
	echo "Proxy unset"
}