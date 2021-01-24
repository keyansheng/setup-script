function Install-Scoop {
    Invoke-WebRequest -UseBasicParsing get.scoop.sh | Invoke-Expression
}

function Install-ScoopApps {
    scoop install aria2
    scoop install 7zip
    scoop install git
    scoop install gsudo
}

function Add-ScoopBuckets {
    scoop bucket add extras
    scoop bucket add nerd-fonts
    scoop bucket add nonportable
}

function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol =
    [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-WebRequest -UseBasicParsing chocolatey.org/install.ps1 |
    Invoke-Expression
}

function Set-ChocolateySettings {
    choco feature enable -n allowglobalconfirmation
    choco feature enable -n removePackageInformationOnUninstall
}

function Install-ScoopAndChocolatey {
    try { scoop } catch { Install-Scoop }
    Install-ScoopApps
    Add-ScoopBuckets
    sudo powershell -Command {
        try { choco } catch { Install-Chocolatey }
        Set-ChocolateySettings
    }
}
