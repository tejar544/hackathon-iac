#cloud-config
chocolatey:
  install_packages:
    - powershell

write_files:
  - path: C:\Temp\install-webserver.ps1
    content: |
      # Install IIS Web Server
      Install-WindowsFeature -Name Web-Server -IncludeManagementTools

      # Uncomment below if you want .NET Framework 4 enabled
      # Enable-WindowsOptionalFeature -Online -FeatureName "NetFx4"

runcmd:
  - powershell.exe -ExecutionPolicy Bypass -File C:\Temp\install-webserver.ps1
