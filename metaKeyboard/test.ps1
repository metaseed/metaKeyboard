$vsEnvVars = (dir Env:).Name -match "VS[0-9]{1,3}COMNTOOLS"
$latestVs = $vsEnvVars | Sort-Object | Select -Last 1
$vsPath = Get-Content Env:\$latestVs


