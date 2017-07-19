function Parse-IniFile ($file) {
    $ini = @{}
    switch -regex -file $file {
        #Section.
        "^\[(.+)\]$" {
            $section = $matches[1].Trim()
            $ini[$section] = @{}
            continue
        }
        #Int.
        "^\s*([^#].+?)\s*=\s*(\d+)\s*$" {
            $name, $value = $matches[1..2]
            $ini[$section][$name] = [int]$value
            continue
        }
        #Decimal.
        "^\s*([^#].+?)\s*=\s*(\d+\.\d+)\s*$" {
            $name, $value = $matches[1..2]
            $ini[$section][$name] = [decimal]$value
            continue
        }
        #Everything else.
        "^\s*([^#].+?)\s*=\s*(.*)" {
            $name, $value = $matches[1..2]
            $ini[$section][$name] = $value.Trim()
        }
    }
    $ini
}


$ini = Parse-IniFile($PSScriptRoot + "\config.ini")

[Environment]::SetEnvironmentVariable("g", $env:USERPROFILE + "\Documents\GitHub", [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("r", $env:USERPROFILE + "\Source\Repos", [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("w", $ini["register"]["workDirectory"], [System.EnvironmentVariableTarget]::User)


