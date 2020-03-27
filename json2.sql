--simple cross apply example
DECLARE @JSON NVARCHAR(MAX) = N'[
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
]'

SELECT root.[key] AS [Order], root.*
--,TheValues.[key], TheValues.[value]
--, Thevalues2.[key], Thevalues2.[value]
FROM OPENJSON ( @JSON ) AS root
--CROSS APPLY OPENJSON ( root.value) AS TheValues
--CROSS APPLY OPENJSON ( TheValues.value) AS TheValues2
----CROSS APPLY OPENJSON ( TheValues2.value) AS TheValues3
