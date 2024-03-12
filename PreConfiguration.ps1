function Copy-WithCreateDirectory {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )

    # Check if the destination directory exists, if not, create it.
    if (-not (Test-Path -Path $destinationPath -PathType Container)) {
        New-Item -Path $destinationPath -ItemType Directory -Force
    }

    # Get the base name of the source directory
    $sourceBaseName = (Get-Item $sourcePath).BaseName

    # Copy files using Copy-Item to the destination without creating a subfolder
    Copy-Item -Path $sourcePath\* -Destination $destinationPath -Recurse -Force
}

Copy-WithCreateDirectory -sourcePath "\\hqazrndfs01.corp.aspentech.com\upload$\aspenONEV14.0\ProMV\RC" -destinationPath "C:\p4\Media\"


Start-Process -FilePath 'C:\Program Files\AspenTech\InfoPlus.21\db21\code\IP21Rename.exe' -ArgumentList "-nq" -WorkingDirectory 'C:\Program Files\AspenTech\InfoPlus.21\db21\code\' -Wait

& "C:\Program Files\AspenTech\InfoPlus.21\db21\code\tsk_client.exe" /start_infoplus21

C:\ProgramData\Aspentech\AspenVirtualPlant\runscript.vbs

iisreset

iisreset

C:\ProgramData\Aspentech\AspenVirtualPlant\startVP.bat