Write-Host "Changing machine name"

Start-Process -FilePath 'C:\Program Files\AspenTech\InfoPlus.21\db21\code\IP21Rename.exe' -ArgumentList "-nq" -WorkingDirectory 'C:\Program Files\AspenTech\InfoPlus.21\db21\code\' -Wait >> C:\p4\ProMVConfiguration.git\logs\logRenameMachine.txt


Write-Host "info plus starting"
& "C:\Program Files\AspenTech\InfoPlus.21\db21\code\tsk_client.exe" /start_infoplus21 >> C:\p4\ProMVConfiguration.git\logs\logStartInfoPlus.txt


#Write-Host "Virtual Plant starting"

#C:\ProgramData\Aspentech\AspenVirtualPlant\runscript.vbs >> C:\p4\ProMVConfiguration.git\logs\logVirtualPlant.txt



Write-Host "StartVP"

C:\ProgramData\Aspentech\AspenVirtualPlant\startVP.bat >> C:\p4\ProMVConfiguration.git\logs\logStartVp.txt


Write-Host "ISS restart"

iisreset >> C:\p4\ProMVConfiguration.git\logs\logIssReset.txt

iisreset >> C:\p4\ProMVConfiguration.git\logs\logIssReset.txt


Write-Host "Chocolatey"
# Check if Chocolatey is installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Output "Chocolatey is not installed. Proceeding with installation..."

    # Set the execution policy to allow running scripts
    Set-ExecutionPolicy Bypass -Scope Process -Force;

    # Install Chocolatey
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

    Write-Output "Chocolatey has been installed successfully."
} else {
    Write-Output "Chocolatey is already installed."
}

# Check the version of Chocolatey
choco --version






Write-Host "Update Node JS"
choco install nodejs --version=18.18.2 --force -y >> C:\p4\ProMVConfiguration.git\logs\installNodeJS.txt
