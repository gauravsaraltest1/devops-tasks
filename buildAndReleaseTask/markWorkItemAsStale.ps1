
$areaPath = Get-VstsInput -Name AreaPath -Require


# variable reading above this line


$extensions = az extension list -o json | ConvertFrom-Json

$devopsFound = $False
foreach($extension in $extensions)
{
    if($extension.name -eq 'azure-devops'){
        $devopsFound = $True
    }
}

if ($devopsFound -eq $False){
    az extension add -n azure-devops
}

$ProjectName = $System.TeamProject

Write-Host $ProjectName
Write-Host $areaPath