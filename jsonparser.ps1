#region Start of function to convert json to hashtable
function ConvertTo-Hashtable {
    [CmdletBinding()]
    [OutputType('hashtable')]
    param (
        [Parameter(ValueFromPipeline)]
        $InputObject
    )

    process {
        ## Return null if the input is null. This can happen when calling the function
        ## recursively and a property is null
        if ($null -eq $InputObject) {
            return $null
        }

        ## Check if the input is an array or collection. If so, we also need to convert
        ## those types into hash tables as well. This function will convert all child
        ## objects into hash tables (if applicable)
        if ($InputObject -is [System.Collections.IEnumerable] -and $InputObject -isnot [string]) {
            $collection = @(
                foreach ($object in $InputObject) {
                    ConvertTo-Hashtable -InputObject $object
                }
            )

            ## Return the array but don't enumerate it because the object may be pretty complex
            Write-Output -NoEnumerate $collection
        } elseif ($InputObject -is [psobject]) { ## If the object has properties that need enumeration
            ## Convert it to its own hash table and return it
            $hash = @{}
            foreach ($property in $InputObject.PSObject.Properties) {
                $hash[$property.Name] = ConvertTo-Hashtable -InputObject $property.Value
            }
            $hash
        } else {
            ## If the object isn't an array, collection, or other object, it's already a hash table
            ## So just return it.
            $InputObject
        }
    }
}
#endregion end of function
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


Write-Host "Identifier"
$j.partOf.identifier | Out-Host

Write-Host "AccountNumber"
$j.task.focus.identifier.value | Out-Host

Write-Host "RequestNumber"
$j.task.focus.supplement.value | Out-Host


Write-Host "         partOf"
$j.partOf | Out-Host

Write-Host "Task"
$j.task | Out-Host

Write-Host "New method"
$j.partOf | select reference, type,  @{"s" = $_.identifier.key ; "t" = $_.identifier.value}