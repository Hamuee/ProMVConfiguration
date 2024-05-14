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


Write-Host "Update Node JS"
choco install nodejs >> C:\p4\ProMVConfiguration.git\logs\installNodeJS.txt
