if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) {
    Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs
    exit
}

function WingetInstall ([string]$id) {
    echo "Installing $id."
    winget install -e --id $id --accept-package-agreements --accept-source-agreements
    if ($LastExitCode) {
        echo "$id installed successfully."
    } else {
        echo "Failed installing $id."
    }
}
Set-ExecutionPolicy RemoteSigned
WingetInstall("7zip.7zip")
WingetInstall("Anaconda.Anaconda3")
WingetInstall("BraveSoftware.BraveBrowser")
#WingetInstall("Google.Chrome")
WingetInstall("Git.Git")
#WingetInstall("Kitware.CMake")
#WingetInstall("Logitech.LGH")
WingetInstall("Microsoft.PowerShell")
WingetInstall("Microsoft.VisualStudioCode")
#WingetInstall("Microsoft.VisualStudio.2019.Community")
WingetInstall("Neovim.Neovim")
#WingetInstall("")
