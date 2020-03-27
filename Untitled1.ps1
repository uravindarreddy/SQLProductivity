$InputFilePath = "D:\Testing\Test.csv"
$extn = [IO.Path]::GetExtension($InputFilePath)
if ($extn -eq ".csv")
{
Write-Host "Valid file extension"
}
else
{
Write-host "Invalid file extension"
}

if (Test-Path -LiteralPath $InputFilePath)
{
Write-host "File Exists"
}
else
{
Write-host "File does not Exist"
}


    if ($extn -eq ".xml" )
    {
    }