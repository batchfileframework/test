@echo off
setlocal enabledelayedexpansion

set "FolderList=FolderList.txt"
set "FileList=FileList.txt"

del %FolderList%
del %FileList%

(
echo C:\Windows\System32\winevt\Logs
echo C:\Windows\System32\LogFiles\WMI
echo C:\Windows\System32\WDI\LogFiles
echo C:\ProgramData\USOShared
echo C:\Users\user\AppData\Local\Microsoft\Windows\WebCache
echo "C:\ProgramData\Microsoft\Windows Defender\Scans"
echo C:\Windows\Fonts
echo C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache
echo C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\WebCache
) > %FolderList%

(
echo C:\Users\user\AppData\Local\Mozilla\Firefox\Profiles\hdquxr7b.default-release\cache2\entries
echo C:\Users\user\AppData\Local\Mozilla\Firefox\Profiles\hdquxr7b.default-release\startupCache\scriptCache.bin
echo C:\Users\user\AppData\Local\Mozilla\Firefox\Profiles\hdquxr7b.default-release\startupCache\scriptCache-current.bin
echo C:\Users\user\AppData\Local\Mozilla\Firefox\Profiles\hdquxr7b.default-release\startupCache\startupCache.8.little
echo C:\Users\user\AppData\Local\Mozilla\Firefox\Profiles\hdquxr7b.default-release\startupCache\scriptCache-child.bin
echo C:\Users\user\AppData\Local\Mozilla\Firefox\Profiles\hdquxr7b.default-release\startupCache\scriptCache-child-current.bin
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn8CEF.tmp
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn8CEE.tmp
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn8CDC.tmp
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\icn8CF0.tmp
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\thumbcache_96.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\thumbcache_48.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\thumbcache_32.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\thumbcache_256.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\thumbcache_16.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\iconcache_48.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\iconcache_32.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\iconcache_256.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\iconcache_16.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Caches\{0248D98E-B905-4D30-88C9-B63C603DA134}.3.ver0x0000000000000001.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Caches\{AFBF9F1A-8EE8-4C77-AF34-C647E37CA0D9}.1.ver0x0000000000000002.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Caches\{AFBF9F1A-8EE8-4C77-AF34-C647E37CA0D9}.1.ver0x0000000000000001.db
echo C:\Users\user\AppData\Local\Microsoft\Windows\Caches\{3DA71D5A-20CC-432F-A115-DFE92379E91F}.3.ver0x000000000000001f.db
echo C:\Windows\WinSxS\amd64_microsoft-windows-font-staticcache_31bf3856ad364e35_10.0.19041.1741_none_586c9892ee6197c7
echo "C:\Program Files (x86)\Mozilla Maintenance Service\logs\maintenanceservice.log"
echo "C:\ProgramData\Microsoft\Windows Defender\Support\MPLog-20230318-231338.log"
echo "C:\ProgramData\Microsoft\Windows Security Health\Logs\SHS-03182023-231944-7-7f-19041.1.amd64fre.vb_release.191206-1406.etl"
echo "C:\ProgramData\Microsoft\Windows Security Health\Logs\SHS-03182023-234855-7-7f-19041.1.amd64fre.vb_release.191206-1406.etl"
echo "C:\ProgramData\Microsoft\Windows Security Health\Logs\SHS-03192023-015037-7-7f-19041.1.amd64fre.vb_release.191206-1406.etl"
echo "C:\System Volume Information\tracking.log"
echo "C:\Users\user\AppData\Local\Microsoft\Internet Explorer\CacheStorage\edb.log"
echo "C:\Users\user\AppData\Local\Microsoft\Internet Explorer\CacheStorage\edbtmp.log"
echo C:\$Extend\$RmMetadata\$TxfLog
echo C:\$Extend\$RmMetadata\$TxfLog\$TxfLogContainer00000000000000000001
echo C:\$Extend\$RmMetadata\$TxfLog\$TxfLogContainer00000000000000000002
echo C:\$LogFile
echo C:\DumpStack.log.tmp
echo C:\Intel\Logs\IntelChipset.log
echo C:\ProgramData\Microsoft\DiagnosticLogCSP\Collectors\DiagnosticLogCSP_Collector_DeviceProvisioning_2023_3_18_23_16_20.etl
echo C:\ProgramData\Microsoft\DiagnosticLogCSP\Collectors\DiagnosticLogCSP_Collector_DeviceProvisioning_2023_3_18_23_17_9.etl
echo C:\ProgramData\Microsoft\DiagnosticLogCSP\Collectors\DiagnosticLogCSP_Collector_DeviceProvisioning_2023_3_19_0_20_32.etl
echo C:\ProgramData\Microsoft\DiagnosticLogCSP\Collectors\DiagnosticLogCSP_Collector_DeviceProvisioning_2023_3_19_2_0_41.etl
echo C:\ProgramData\Microsoft\Network\Downloader\edb.log
echo C:\ProgramData\Microsoft\Network\Downloader\edbtmp.log
echo C:\ProgramData\Microsoft\Search\Data\Applications\Windows\GatherLogs\SystemIndex\SystemIndex.1.Crwl
echo C:\ProgramData\Microsoft\Search\Data\Applications\Windows\GatherLogs\SystemIndex\SystemIndex.1.gthr
echo C:\ProgramData\Microsoft\SmsRouter\MessageStore\edb.log
echo C:\ProgramData\Microsoft\SmsRouter\MessageStore\edb00002.log
echo C:\ProgramData\Microsoft\SmsRouter\MessageStore\edb00003.log
echo C:\ProgramData\Microsoft\SmsRouter\MessageStore\edbtmp.log
echo C:\ProgramData\Microsoft\Windows Defender\Support\MPLog-20230318-231338.log
echo C:\ProgramData\Microsoft\Windows Security Health\Logs\SHS-03182023-231944-7-7f-19041.1.amd64fre.vb_release.191206-1406.etl
echo C:\ProgramData\Microsoft\Windows Security Health\Logs\SHS-03182023-234855-7-7f-19041.1.amd64fre.vb_release.191206-1406.etl
echo C:\ProgramData\Microsoft\Windows Security Health\Logs\SHS-03192023-015037-7-7f-19041.1.amd64fre.vb_release.191206-1406.etl
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\1527c705-839a-4832-9118-54d4Bd6a0c89_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\E2A4F912-2574-4A75-9BB0-0D023378592B_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\F46D4000-FD22-4DB4-AC8E-4E1DDDE828FE_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.549981C3F5F10_1.1911.21713.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.AAD.BrokerPlugin_1000.19041.1023.0_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.AccountsControl_10.0.19041.1023_neutral__cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Advertising.Xaml_10.1808.3.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.AsyncTextService_10.0.19041.1023_neutral__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.BingWeather_4.25.20211.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.BioEnrollment_10.0.19041.1023_neutral__cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.CredDialogHost_10.0.19041.1023_neutral__cw5n1h2txyewy\ActivationStore.dat
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.DesktopAppInstaller_1.0.30251.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.ECApp_10.0.19041.1023_neutral__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.GetHelp_10.1706.13331.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Getstarted_8.2.22942.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.LockApp_10.0.19041.1023_neutral__cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Microsoft3DViewer_6.1908.2042.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.MicrosoftOfficeHub_18.1903.1152.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.MicrosoftSolitaireCollection_4.4.8204.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.MicrosoftStickyNotes_3.6.73.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.MixedReality.Portal_2000.19081.1301.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.People_10.1902.633.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.ScreenSketch_10.1907.2471.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Services.Store.Engagement_10.0.18101.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Services.Store.Engagement_10.0.18101.0_x86__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.StorePurchaseApp_11811.1001.18.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.UI.Xaml.2.0_2.1810.18004.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Wallet_2.4.18324.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.WebMediaExtensions_1.0.20875.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Win32WebViewHost_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.Apprep.ChxApp_1000.19041.1023.0_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.AssignedAccessLockApp_1000.19041.1023.0_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.CallingShellApp_1000.19041.1023.0_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.CapturePicker_10.0.19041.1023_neutral__cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.CloudExperienceHost_10.0.19041.1266_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.ContentDeliveryManager_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.NarratorQuickStart_10.0.19041.1023_neutral_neutral_8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.ParentalControls_1000.19041.1023.0_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.PeopleExperienceHost_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.PinningConfirmationDialog_1000.19041.1023.0_neutral__cw5n1h2txyewy\ActivationStore.dat
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.PinningConfirmationDialog_1000.19041.1023.0_neutral__cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.Search_1.14.7.19041_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.SecHealthUI_10.0.19041.1865_neutral__cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.SecureAssessmentBrowser_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.StartMenuExperienceHost_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.XGpuEjectDialog_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Windows.XGpuEjectDialog_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.WindowsAlarms_10.1906.2182.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.WindowsCalculator_10.1906.55.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.WindowsCamera_2018.826.98.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.WindowsFeedbackHub_1.1907.3152.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.WindowsMaps_5.1906.1972.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.WindowsSoundRecorder_10.1906.1972.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.Xbox.TCUI_1.23.28002.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.XboxApp_48.49.31001.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.XboxGameCallableUI_1000.19041.1023.0_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.XboxGameOverlay_1.46.11001.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.XboxGamingOverlay_2.34.28001.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.XboxIdentityProvider_12.50.6001.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.YourPhone_0.19051.7.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.ZuneMusic_10.19071.19011.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Microsoft.ZuneVideo_10.19071.19011.0_x64__8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\MicrosoftWindows.UndockedDevKit_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\NcsiUwpApp_1000.19041.1023.0_neutral_neutral_8wekyb3d8bbwe\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Windows.CBSPreview_10.0.19041.1023_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Windows.PrintDialog_6.2.1.0_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\Windows.PrintDialog_6.2.1.0_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\c5e2524a-ea46-4f67-841f-6a9465d9d515_10.0.19041.1949_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\AppRepository\Packages\windows.immersivecontrolpanel_10.0.2.1000_neutral_neutral_cw5n1h2txyewy\ActivationStore.dat.LOG1
echo C:\ProgramData\Microsoft\Windows\wfp\wfpdiag.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.171aa5ac-662b-47f6-8de1-fae027c3090c.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.1fa9eb44-9efc-4760-9889-83d8e72abd8e.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.30f060b2-12d8-4e44-8212-716591a543cf.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.352e9a74-efde-41a0-ad5b-ed0830bd072b.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.398c2964-1dd1-446b-8600-1868530afc7d.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.3eb657bf-6319-4a92-ae97-861b59d8a683.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.4d1e934c-1bf5-4384-aae8-37e4250ec48b.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.5963e137-bc7b-436b-aeb2-e8c6ca8f65ce.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.77430474-07e1-4800-b419-67a7443edd2b.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.7c002585-f23c-4063-8a28-a1fedbe7c806.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.860df01b-41b2-487e-b60d-d64724d39963.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.910577a3-72d1-4f44-8073-ed2c8d6730d5.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.94c8c6c9-71f7-4824-8373-7b3d6ed9a516.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.9783870c-242f-4579-90c9-39d7d39a7726.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.9abafc0d-3ded-4f92-9119-e16810239199.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.d070a9fa-d02d-4c90-8bed-403520fce069.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.d2001b33-4421-4d81-85eb-92264658e769.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.e10acaf2-85cd-4664-8fd0-78bd9a5ffd87.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.efdfbe82-a4d0-425a-a958-443b94b47cc7.1.etl
echo C:\ProgramData\USOShared\Logs\System\MoUsoCoreWorker.f42195ef-ae27-4c8b-8f67-74c54b38bf16.1.etl
echo C:\ProgramData\USOShared\Logs\System\UpdateSessionOrchestration.0caedd58-dbbe-4802-8276-074c464d355f.1.etl
echo C:\Users\Default\NTUSER.DAT.LOG1
echo C:\Users\Default\NTUSER.DAT.LOG2
echo C:\Users\user\AppData\Local\Microsoft\OneDrive\setup\logs\Install-PerUser_2023-03-19_042001_31c-143c.log
echo C:\Users\user\AppData\Local\Microsoft\OneDrive\setup\logs\Install_2023-03-19_041945_1810-15ec.log
echo C:\Users\user\AppData\Local\Microsoft\OneDrive\setup\logs\Uninstall-PerMachine_2023-03-19_042356_196c-f08.log
echo C:\Users\user\AppData\Local\Microsoft\OneDrive\setup\logs\Uninstall-PerUser_2023-03-19_042356_150-1778.log
echo C:\Users\user\AppData\Local\Microsoft\OneDrive\setup\logs\Uninstall_2023-03-19_042339_1a80-448.log
echo C:\Users\user\AppData\Local\Microsoft\OneDrive\setup\logs\Update_2023-03-19_042343_10c0-1064.log
echo C:\Users\user\AppData\Local\Microsoft\OneDrive\setup\logs\machineTelemetryCache.otc.session
echo C:\Users\user\AppData\Local\Microsoft\OneDrive\setup\logs\parentTelemetryCache.otc.session
echo C:\Users\user\AppData\Local\Microsoft\OneDrive\setup\logs\userTelemetryCache.otc.session
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\ExplorerStartupLog.etl
echo C:\Users\user\AppData\Local\Microsoft\Windows\Explorer\ExplorerStartupLog_RunOnce.etl
echo C:\Users\user\AppData\Local\Microsoft\Windows\UsrClass.dat.LOG1
echo C:\Users\user\AppData\Local\Microsoft\Windows\UsrClass.dat.LOG2
echo C:\Users\user\AppData\Local\Microsoft\Windows\WebCache\V01.log
echo C:\Users\user\AppData\Local\Microsoft\Windows\WebCache\V0100008.log
echo C:\Users\user\AppData\Local\Microsoft\Windows\WebCache\V01tmp.log
echo C:\Users\user\AppData\Local\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy\Settings\settings.dat.LOG1
echo C:\Users\user\AppData\Local\Packages\Microsoft.CredDialogHost_cw5n1h2txyewy\Settings\settings.dat
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\Settings\settings.dat.LOG1
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.PinningConfirmationDialog_cw5n1h2txyewy\Settings\settings.dat
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\AC\GEH\POF.dat.LOG1
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\AC\GEH\POF.dat.LOG2
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\AppData\Indexed DB\edb.log
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\AppData\Indexed DB\edb00001.log
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\AppData\Indexed DB\edbtmp.log
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\LocalState\AppIconCache\150\Microsoft_Windows_Shell_RunDialog
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\Settings\settings.dat.LOG1
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\Settings\settings.dat.LOG2
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.ShellExperienceHost_cw5n1h2txyewy\Settings\settings.dat.LOG1
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.ShellExperienceHost_cw5n1h2txyewy\Settings\settings.dat.LOG2
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\Settings\settings.dat.LOG1
echo C:\Users\user\AppData\Local\Packages\Microsoft.Windows.XGpuEjectDialog_cw5n1h2txyewy\Settings\settings.dat
echo C:\Users\user\AppData\Local\Packages\Microsoft.WindowsCalculator_8wekyb3d8bbwe\Settings\settings.dat.LOG1
echo C:\Users\user\AppData\Local\Packages\Microsoft.WindowsStore_8wekyb3d8bbwe\Settings\settings.dat.LOG1
echo C:\Users\user\AppData\Local\Packages\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\Settings\settings.dat.LOG1
echo C:\Users\user\AppData\Local\Packages\Windows.PrintDialog_cw5n1h2txyewy\Settings\settings.dat
echo C:\Users\user\ntuser.dat.LOG1
echo C:\Users\user\ntuser.dat.LOG2
echo C:\Windows\INF\setupapi.dev.log
echo C:\Windows\INF\setupapi.offline.20191207_091437.log
echo C:\Windows\INF\setupapi.setup.log
echo C:\Windows\Logs\CBS\CBS.log
echo C:\Windows\Logs\DISM\dism.log
echo C:\Windows\Logs\NetSetup\service.0.etl
echo C:\Windows\Logs\StorGroupPolicy.log
echo C:\Windows\Logs\WindowsUpdate\WindowsUpdate.20230318.233227.027.1.etl
echo C:\Windows\Panther\DDACLSys.log
echo C:\Windows\Panther\UnattendGC\setupact.log
echo C:\Windows\Panther\cbs.log
echo C:\Windows\Panther\cbs_unattend.log
echo C:\Windows\Panther\setup.etl
echo C:\Windows\Panther\setupact.log
echo C:\Windows\ServiceProfiles\LocalService\NTUSER.DAT.LOG1
echo C:\Windows\ServiceProfiles\LocalService\NTUSER.DAT.LOG2
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\domgmt.20230319_031435_064.etl
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\domgmt.20230319_041827_946.etl
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\domgmt.20230319_085801_020.etl
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\dosvc.20230319_041720_241.etl
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\dosvc.20230319_045035_288.etl
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\dosvc.20230319_065217_249.etl
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\dosvc.20230320_050848_392.etl
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\State\dosvcState.dat.LOG1
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\State\dosvcState.dat.LOG2
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\State\migration.dat.LOG1
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\State\migration.dat.LOG2
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\MpCmdRun.log
echo C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\MpSigStub.log
echo C:\Windows\ServiceProfiles\NetworkService\NTUSER.DAT.LOG1
echo C:\Windows\ServiceProfiles\NetworkService\NTUSER.DAT.LOG2
echo C:\Windows\SoftwareDistribution\DataStore\Logs
echo C:\Windows\SoftwareDistribution\DataStore\Logs\edb.log
echo C:\Windows\SoftwareDistribution\DataStore\Logs\edbres00001.jrs
echo C:\Windows\SoftwareDistribution\DataStore\Logs\edbres00002.jrs
echo C:\Windows\SoftwareDistribution\DataStore\Logs\edbtmp.log
echo C:\Windows\System32\LogFiles\Scm\SCM.EVM
echo C:\Windows\System32\LogFiles\Scm\SCM.EVM.1
echo C:\Windows\System32\LogFiles\Scm\SCM.EVM.2
echo C:\Windows\System32\LogFiles\WMI\LwtNetLog.etl
echo C:\Windows\System32\MsDtc\MSDTC.LOG
echo C:\Windows\System32\SMI\Store\Machine\SCHEMA.DAT.LOG1
echo C:\Windows\System32\SleepStudy\ScreenOn\ScreenOnPowerStudyTraceSession-2023-03-18-23-13-40.etl
echo C:\Windows\System32\SleepStudy\ScreenOn\ScreenOnPowerStudyTraceSession-2023-03-18-23-17-12.etl
echo C:\Windows\System32\SleepStudy\ScreenOn\ScreenOnPowerStudyTraceSession-2023-03-18-23-48-38.etl
echo C:\Windows\System32\SleepStudy\ScreenOn\ScreenOnPowerStudyTraceSession-2023-03-19-01-50-17.etl
echo C:\Windows\System32\SleepStudy\ScreenOn\ScreenOnPowerStudyTraceSession-2023-03-19-06-47-51.etl
echo C:\Windows\System32\SleepStudy\UserNotPresentSession.etl
echo C:\Windows\System32\SleepStudy\user-not-present-trace-2023-03-19-01-18-42.etl
echo C:\Windows\System32\SleepStudy\user-not-present-trace-2023-03-19-03-17-48.etl
echo C:\Windows\System32\SleepStudy\user-not-present-trace-2023-03-19-04-28-19.etl
echo C:\Windows\System32\SleepStudy\user-not-present-trace-2023-03-19-15-56-27.etl
echo C:\Windows\System32\SleepStudy\user-not-present-trace-2023-03-19-16-48-38.etl
echo C:\Windows\System32\SleepStudy\user-not-present-trace-2023-03-19-20-43-44.etl
echo C:\Windows\System32\SleepStudy\user-not-present-trace-2023-03-20-00-55-23.etl
echo C:\Windows\System32\WDI\LogFiles\WdiContextLog.etl.001
echo C:\Windows\System32\WDI\{86432a0b-3c7d-4ddf-a89c-172faa90485d}\{0469a2b4-e489-4fc0-a315-33ce38519421}\snapshot.etl
echo C:\Windows\System32\WDI\{86432a0b-3c7d-4ddf-a89c-172faa90485d}\{d5d625ec-2724-433f-bc86-8a3f15fc1797}\snapshot.etl
echo C:\Windows\System32\WDI\{86432a0b-3c7d-4ddf-a89c-172faa90485d}\{dda18107-9b2a-4cc6-aa96-ef662f7937c0}\snapshot.etl
echo C:\Windows\System32\catroot2\edb.log
echo C:\Windows\System32\catroot2\edb00001.log
echo C:\Windows\System32\catroot2\edb00002.log
echo C:\Windows\System32\catroot2\edb00003.log
echo C:\Windows\System32\catroot2\edb00004.log
echo C:\Windows\System32\catroot2\edb00005.log
echo C:\Windows\System32\catroot2\edb00006.log
echo C:\Windows\System32\catroot2\edb00007.log
echo C:\Windows\System32\catroot2\edb00008.log
echo C:\Windows\System32\catroot2\edb00009.log
echo C:\Windows\System32\catroot2\edb0000A.log
echo C:\Windows\System32\catroot2\edb0000B.log
echo C:\Windows\System32\catroot2\edb0000C.log
echo C:\Windows\System32\catroot2\edb0000D.log
echo C:\Windows\System32\catroot2\edb0000E.log
echo C:\Windows\System32\catroot2\edb0000F.log
echo C:\Windows\System32\catroot2\edbtmp.log
echo C:\Windows\System32\config\BBI.LOG1
echo C:\Windows\System32\config\BBI.LOG2
echo C:\Windows\System32\config\BCD-Template.LOG
echo C:\Windows\System32\config\COMPONENTS.LOG1
echo C:\Windows\System32\config\COMPONENTS.LOG2
echo C:\Windows\System32\config\DEFAULT.LOG1
echo C:\Windows\System32\config\DEFAULT.LOG2
echo C:\Windows\System32\config\DRIVERS.LOG1
echo C:\Windows\System32\config\DRIVERS.LOG2
echo C:\Windows\System32\config\ELAM.LOG1
echo C:\Windows\System32\config\SAM.LOG1
echo C:\Windows\System32\config\SAM.LOG2
echo C:\Windows\System32\config\SECURITY.LOG1
echo C:\Windows\System32\config\SECURITY.LOG2
echo C:\Windows\System32\config\SOFTWARE.LOG1
echo C:\Windows\System32\config\SOFTWARE.LOG2
echo C:\Windows\System32\config\SYSTEM.LOG1
echo C:\Windows\System32\config\SYSTEM.LOG2
echo C:\Windows\System32\config\systemprofile\AppData\Local\DataSharing\Storage\DSS.log
echo C:\Windows\System32\config\systemprofile\AppData\Local\DataSharing\Storage\DSS00001.log
echo C:\Windows\System32\config\systemprofile\AppData\Local\DataSharing\Storage\DSStmp.log
echo C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\WebCache\V01.log
echo C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\WebCache\V01tmp.log
echo C:\Windows\System32\sru\SRU.log
echo C:\Windows\System32\sru\SRU0004D.log
echo C:\Windows\System32\sru\SRU0004E.log
echo C:\Windows\System32\sru\SRU0004F.log
echo C:\Windows\System32\sru\SRUtmp.log
echo C:\Windows\Temp\MpCmdRun.log
echo C:\Windows\Temp\amc16BF.tmp.LOG1
echo C:\Windows\Temp\amc16BF.tmp.LOG2
echo C:\Windows\Temp\amc16EE.tmp.LOG1
echo C:\Windows\Temp\amc16EE.tmp.LOG2
echo C:\Windows\Temp\amc170D.tmp.LOG1
echo C:\Windows\Temp\amc170D.tmp.LOG2
echo C:\Windows\Temp\amc4D4.tmp.LOG1
echo C:\Windows\Temp\amc4D4.tmp.LOG2
echo C:\Windows\Temp\amc4E4.tmp.LOG1
echo C:\Windows\Temp\amc4E4.tmp.LOG2
echo C:\Windows\Temp\amc532.tmp.LOG1
echo C:\Windows\Temp\amc532.tmp.LOG2
echo C:\Windows\Temp\amc63D.tmp.LOG1
echo C:\Windows\Temp\amc63D.tmp.LOG2
echo C:\Windows\Temp\amc65C.tmp.LOG1
echo C:\Windows\Temp\amc65C.tmp.LOG2
echo C:\Windows\Temp\amc69A.tmp.LOG1
echo C:\Windows\Temp\amc69A.tmp.LOG2
echo C:\Windows\appcompat\Programs\Amcache.hve.LOG1
echo C:\Windows\appcompat\Programs\Amcache.hve.LOG2
echo C:\Windows\security\database\edb.log
echo C:\Windows\security\database\edbtmp.log
echo C:\Windows\security\logs\SceSetupLog.etl
) > %FileList%

:OwnAndDeleteFolder
for /F "usebackq tokens=*" %%F in (%FolderList%) do (
    if exist %%F (
        echo Taking ownership of: %%F
        takeown /d y /skipsl /r /f %%F
        echo Granting permissions to: %%F
        icacls %%F /grant %username%:m /t
        echo Deleting Folder: %%F
        rd /s /q %%F
    ) else (
        echo Folder does not exist: %%F
    )
)

:OwnAndDeleteFiles
for /F "usebackq tokens=*" %%F in (%FileList%) do (
    if exist %%F (
        echo Taking ownership of: %%F
        takeown /skipsl /f %%F
        echo Granting permissions to: %%F
        icacls %%F /grant %username%:m /t
        echo Deleting File: %%F
        del /f /q %%F
    ) else (
        echo File does not exist: %%F
    )
)

del %FolderList%
del %FileList%

endlocal

:EndOfFile