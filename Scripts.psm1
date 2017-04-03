function Start-Backend {
     Start-Process -WorkingDirectory .\back\ "stack" "exec back-exe"
}

function Start-Frontend {
     Start-Process -WorkingDirectory .\front\ "ng" "serve"
}

function Store-CWD {
    $loc = Get-Location;
    Set-Variable -Name cwd -Value $loc -Scope Global;
}

function Restore-CWD {
    Set-Location $cwd
}


Set-Alias rc Restore-CWD;
Set-Alias sfe Start-Frontend;
Set-Alias sbe Start-Backend;
Export-ModuleMember -Function * -Alias * -Variable *;