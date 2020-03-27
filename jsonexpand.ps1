$j = @"
[
   {
	"partOf": {
            "type": "Process",
            "reference": "SourceHOV",
            "identifier": {
                "key": "RequestType",
                "value": "CSUCF"
            }
        },
        "task": [
            {
                "focus": {
                    "type": "Account",
                    "identifier": {
                        "type": "AccountNumber",
                        "value": "7518864429"
                    },

"supplement": {
                        "key": "RequestNumber",
                        "value": "1202201"
                    }
                }
            },
		{
                "focus": {
                    "type": "Account",
                    "identifier": {
                        "type": "AccountNumber",
                        "value": "7518864445"
                    },
                    "supplement": {
                        "key": "RequestNumber",
                        "value": "1202202"
                    }
                }
            }
		]
	},
	{
	"partOf": {
            "type": "Process",
            "reference": "SourceHOV",
            "identifier": {
                "key": "RequestType",
                "value": "CHRTY"
            }
        },
        "task": [
            {
                "focus": {
                    "type": "Account",
                    "identifier": {
                        "type": "AccountNumber",
                        "value": "7518864446"
                    },
                    "supplement": {
                        "key": "RequestNumber",
                        "value": "1202209"
                    }
                }
            },
	     {
                "focus": {
                    "type": "Account",
                    "identifier": {
                        "type": "AccountNumber",
                        "value": "7518864486"
                    },
                    "supplement": {
						"key": "RequestNumber",
                        "value": "1202211"
                    }
                }
            }
	]
   }
]

"@ | ConvertFrom-Json 

###$j 
$worklistItems = @();
$d = @();
$e = @();
foreach ($col in $j){
    $worklistItems += New-Object PSObject ( $col | select  partOf, task)
    foreach ($m in $worklistItems.partOf){
        $d += New-Object PSObject ($m | Select @{label = 'partOf';expression = {$worklistItems.partOf}}, reference, type, identifier)
        foreach ($n in $d.identifier) {
           $e += New-Object PSObject ($n | Select @{label = 'identifier'; expression = {$d.indentifier}}, key, value) 

        }
    }
}
<#
ForEach ($Squad In $JSON) {
    $Squads += New-Object PSObject ($Squad | Select squadName, homeTown, formed, secretBase, active)
    ForEach ($member In $Squad.members) {
        $SquadMembers += New-Object PSObject ($member | Select @{label = "squadName" ;expression = {$Squad.squadName}}, name, age, secretIdentity)
        ForEach ($power In $member.powers) {
            $SquadMemberPowers += New-Object PSObject ($member | Select @{label = "name" ;expression = {$member.name}}, @{label = "powers" ;expression = {$power}})
        }
    }
}
#>
Write-Host "worklist item array"
$worklistItems | Get-Member
Write-Host "waht is this"
$d
$e
$j | Select-Object -Expand partOf | Select-Object -Expand identifier

$j | Select-Object -Expand task | Select-Object -Expand focus | Write-host


