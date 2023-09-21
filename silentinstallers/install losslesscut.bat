REM @echo off

:: Create a Self-Signed Certificate and get its thumbprint
for /f "usebackq skip=6 tokens=1 delims= " %%a in (`powershell -command "New-SelfSignedCertificate -Type CodeSigningCert -Subject 'CN=AppxTestCert, O=YourOrganization, L=YourCity, S=YourState, C=YourCountry' -KeyUsage DigitalSignature -FriendlyName 'AppxTestCert' -CertStoreLocation 'Cert:\CurrentUser\My' -KeyExportPolicy Exportable"`) do (
 set "Thumbprint=%%a" )

echo Thumbprint is "%Thumbprint%"

:: Export Certificate to CER file using thumbprint
powershell -command "Export-PfxCertificate -cert 'Cert:\CurrentUser\My\%Thumbprint%' -FilePath 'E:\apps\downloads\LosslessCut-win-x64-3.56.0.appxmanifest\YourCert.pfx' -Password (ConvertTo-SecureString -String 'YourPasswordAa1245' -Force -AsPlainText)"

:: Sign the APPX package with a specific Hash Algorithm (like SHA256)
powershell -command "Set-AuthenticodeSignature -FilePath '%~dp0LosslessCut-win-x64-3.56.0.appx' -Certificate (Get-PfxCertificate -FilePath '%~dp0LosslessCut-win-x64-3.56.0.appxmanifest\YourCert.pfx') -HashAlgorithm 'SHA256'"

:: Import the certificate to TrustedPeople
powershell -command "Import-PfxCertificate -FilePath "%~dp0LosslessCut-win-x64-3.56.0.appxmanifest\YourCert.pfx" -CertStoreLocation 'Cert:\CurrentUser\My' -Password (ConvertTo-SecureString -String 'YourPassword' -Force -AsPlainText)"

:: Install the APPX package
powershell -command "Add-AppxPackage -Path '%~dp0LosslessCut-win-x64-3.56.0.appx'"

:: Pause the script
pause
