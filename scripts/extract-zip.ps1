$cd = (split-path $MyInvocation.MyCommand.Path -parent)
$zipPath = $args[0]
$zipDest = $args[1]
Write-Host " * Extracting files into $zipDest..." -foregroundcolor "green"
$shell = New-Object -com Shell.Application
$zipFile = $shell.NameSpace($zipPath)
foreach($item in $zipFile.items())
{
	$shell.Namespace($zipDest).copyhere($item)
}