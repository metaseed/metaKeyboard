[Environment]::SetEnvironmentVariable("g", $env:USERPROFILE + "\Documents\GitHub", [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("r", $env:USERPROFILE + "\Source\Repos", [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("w", $env:USERPROFILE + "M:\Workspace", [System.EnvironmentVariableTarget]::User)