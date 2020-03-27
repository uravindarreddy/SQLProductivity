$json = @"
[
{
	"loadbalancer": {
		            "Name-of-LB": "fgkjsdfkjg",
		            "rules": [
            {
				"Name of rule": "Rule1",
				"Config": "Port80"
                "Testing":
                {
                    "Key": "Teseing"
                    "Value": "123"
                }
			},
            {
				"Name of rule": "Rule1",
				"Config": "Port80"
			},
			{
				"Name of rule": "Rule2",
				"Config": "Port443"
			},
            {
				"Name of rule": "Rule3",
				"Config": "Port803"
			},
			{
				"Name of rule": "Rule4",
				"Config": "Port4434"
			},
			{
				"Name of rule": "Rule5",
				"Config": "Port4435"
			}
		]
	}
}
]
"@ | ConvertFrom-Json

Write-Host "All Rules"
$json.loadbalancer.rules | Out-Host

$json.loadbalancer.rules.Testing | Out-Host

Write-Host "First Rule"
$json.loadbalancer.rules[0] | Out-Host

Write-Host "Last Rule"
$json.loadbalancer.rules[-1] | Out-Host

Write-Host "Range of Rules"
$json.loadbalancer.rules[1..3] | Out-Host

Write-Host "Select Rule by Name"
$json.loadbalancer.rules[1..3] | Where-Object {$_.'Name of rule' -eq 'Rule3'} | Out-Host
