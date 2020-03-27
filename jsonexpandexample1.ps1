$json = @"
{ "Members" : [
    { "Id" : 1,
        "Details" : [ { "FirstName" : "Adam" }, { "LastName" : "Ant" } ] },
    { "Id" : 2,
        "Details" : [ { "FirstName" : "Ben" }, { "LastName" : "Boggs" } ] },
    { "Id" : 3,
        "Details" : [ { "FirstName" : "Carl"} , { "LastName" : "Cox" } ] }
]
}
"@ | ConvertFrom-Json | Select-Object -Expand Members 
#| Select-Object -Expand Members 
$json | Get-Member

#$json | Select ID,@{Name="FirstName";E={$_.Details | Select -Expand FirstName}},@{Name="LastName";E={$_.Details | Select -Expand LastName}}