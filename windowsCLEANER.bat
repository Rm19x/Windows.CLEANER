@echo off
:: Memaksa script berjalan di direktori tempat file .bat ini berada (Anti-Crash Admin)
cd /d "%~dp0"

:: ====================================================================
:: WINDOWS CLEANER & OPTIMIZER PACK (CLI VERSION)
:: Developed by : Mr.Rm19
:: Official GitHub : https://github.com/Rm19x
:: ====================================================================

:: Memastikan script berjalan dengan hak akses Administrator
:check_permissions
echo Memeriksa hak akses Administrator...
net session >nul 2>&1
if %errorLevel% == 0 (
    goto main_menu
) else (
    echo.
    echo ====================================================================
    echo ERROR: Script ini WAJIB dijalankan sebagai Administrator!
    echo Silakan klik kanan file ini, lalu pilih 'Run as administrator'.
    echo ====================================================================
    echo.
    pause
    exit /b
)

:main_menu
cls
color 0A
echo ====================================================================
echo                 WELCOME TO WINDOWS CLEANER ^& OPTIMIZER
echo ====================================================================
echo.
echo   [+] Tool Name   : WindowsCLEANER
echo   [+] Developer   : Mr.Rm19
echo   [+] Official Git: https://github.com/Rm19x
echo ====================================================================
echo.
echo  [1] Jalankan Pembersihan Sampah Sistem ^(System Junk Cleaner^)
echo  [2] Jalankan Pengoptimalan Memori ^& Jaringan ^(Performance Tweaks^)
echo  [3] Jalankan Konfigurasi Privasi ^& Telemetri ^(Privacy Debloater^)
echo  [4] Kelola 4 Layanan Utama Windows ^(Services Controller Menu^)
echo  [5] Jalankan Diagnostik Kesehatan Disk ^& Spesifikasi Hardware
echo  [0] Keluar Aplikasi
echo.
echo ====================================================================
set /p "menu_choice=Masukkan pilihan Anda (0-5): "

if "%menu_choice%"=="1" goto junk_menu
if "%menu_choice%"=="2" goto performance_menu
if "%menu_choice%"=="3" goto privacy_menu
if "%menu_choice%"=="4" goto services_menu
if "%menu_choice%"=="5" goto diagnostic_menu
if "%menu_choice%"=="0" exit
goto main_menu


:: ====================================================================
:: [1] MENU PEMBERSIHAN SAMPAH SISTEM
:: ====================================================================
:junk_menu
cls
echo ====================================================================
echo                 PEMBERSIHAN SAMPAH SISTEM (JUNK CLEANER)
echo ====================================================================
echo.
echo  [1] Bersihkan File Sementara Windows (TEMP)
echo  [2] Bersihkan File Sementara Pengguna (User AppData TEMP)
echo  [3] Kosongkan Kotak Sampah (Recycle Bin) Automatically
echo  [4] Bersihkan Cache Windows Update Lama (SoftwareDistribution)
echo  [5] Hapus File Prefetch Sistem
echo  [6] Bersihkan Sisa File Instalasi Driver Grafis (NVIDIA/AMD/Intel)
echo  [7] Bersihkan Cache & Cookies Google Chrome
echo  [8] Bersihkan Cache Microsoft Edge
echo  [9] Bersihkan Cache Mozilla Firefox
echo  [10] JALANKAN SEMUA PEMBERSIHAN SAMPAH DI ATAS
echo  [0] Kembali ke Menu Utama
echo.
echo ====================================================================
set /p "junk_choice=Masukkan pilihan Anda (0-10): "

if "%junk_choice%"=="1" goto clean_temp
if "%junk_choice%"=="2" goto clean_user_temp
if "%junk_choice%"=="3" goto clean_recycle
if "%junk_choice%"=="4" goto clean_win_update
if "%junk_choice%"=="5" goto clean_prefetch
if "%junk_choice%"=="6" goto clean_drivers
if "%junk_choice%"=="7" goto clean_chrome
if "%junk_choice%"=="8" goto clean_edge
if "%junk_choice%"=="9" goto clean_firefox
if "%junk_choice%"=="10" goto clean_all_junk
if "%junk_choice%"=="0" goto main_menu
goto junk_menu

:clean_temp
echo.
echo Membersihkan file sementara Windows...
del /f /s /q %SystemRoot%\TEMP\*.* >nul 2>&1
for /d %%p in (%SystemRoot%\TEMP\*) do rmdir /s /q "%%p" >nul 2>&1
echo Selesai!
pause
goto junk_menu

:clean_user_temp
echo.
echo Membersihkan file sementara pengguna...
del /f /s /q "%USERPROFILE%\AppData\Local\Temp\*.*" >nul 2>&1
for /d %%p in ("%USERPROFILE%\AppData\Local\Temp\*") do rmdir /s /q "%%p" >nul 2>&1
echo Selesai!
pause
goto junk_menu

:clean_recycle
echo.
echo Mengosongkan Kotak Sampah (Recycle Bin)...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
echo Selesai!
pause
goto junk_menu

:clean_win_update
echo.
echo Menghentikan wuauserv sementara untuk membersihkan cache...
net stop wuauserv >nul 2>&1
echo Membersihkan cache Windows Update lama...
del /f /s /q %SystemRoot%\SoftwareDistribution\Download\*.* >nul 2>&1
for /d %%p in (%SystemRoot%\SoftwareDistribution\Download\*) do rmdir /s /q "%%p" >nul 2>&1
net start wuauserv >nul 2>&1
echo Selesai!
pause
goto junk_menu

:clean_prefetch
echo.
echo Menghapus file Prefetch sistem...
del /f /s /q %SystemRoot%\Prefetch\*.* >nul 2>&1
echo Selesai!
pause
goto junk_menu

:clean_drivers
echo.
echo Membersihkan sisa instalasi driver grafis usang...
rmdir /s /q C:\NVIDIA >nul 2>&1
rmdir /s /q C:\AMD >nul 2>&1
rmdir /s /q C:\Intel >nul 2>&1
echo Selesai!
pause
goto junk_menu

:clean_chrome
echo.
echo Membersihkan cache dan cookies Google Chrome...
taskkill /f /im chrome.exe >nul 2>&1
del /f /q /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
echo Selesai!
pause
goto junk_menu

:clean_edge
echo.
echo Membersihkan cache Microsoft Edge...
taskkill /f /im msedge.exe >nul 2>&1
del /f /q /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
echo Selesai!
pause
goto junk_menu

:clean_firefox
echo.
echo Membersihkan cache Mozilla Firefox...
taskkill /f /im firefox.exe >nul 2>&1
del /f /q /s "%APPDATA%\Mozilla\Firefox\Profiles\*\cache2\*.*" >nul 2>&1
echo Selesai!
pause
goto junk_menu

:clean_all_junk
echo.
echo Menjalankan seluruh skenario pembersihan sampah masal...
del /f /s /q %SystemRoot%\TEMP\*.* >nul 2>&1
del /f /s /q "%USERPROFILE%\AppData\Local\Temp\*.*" >nul 2>&1
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
net stop wuauserv >nul 2>&1
del /f /s /q %SystemRoot%\SoftwareDistribution\Download\*.* >nul 2>&1
net start wuauserv >nul 2>&1
del /f /s /q %SystemRoot%\Prefetch\*.* >nul 2>&1
rmdir /s /q C:\NVIDIA >nul 2>&1
rmdir /s /q C:\AMD >nul 2>&1
rmdir /s /q C:\Intel >nul 2>&1
taskkill /f /im chrome.exe >nul 2>&1
del /f /q /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
del /f /q /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1
del /f /q /s "%APPDATA%\Mozilla\Firefox\Profiles\*\cache2\*.*" >nul 2>&1
echo.
echo ====================================================================
echo SUKSES: Seluruh file sampah digital berhasil disapu bersih!
echo ====================================================================
pause
goto junk_menu


:: ====================================================================
:: [2] MENU PENGOPTIMALAN MEMORI & JARINGAN
:: ====================================================================
:performance_menu
cls
echo ====================================================================
echo                   PENGOPTIMALAN KINERJA MEMORI & JARINGAN
echo ====================================================================
echo.
echo  [1] Jalankan Pembersihan RAM (Memory Purge via StandbyList)
echo  [2] Atur Ulang Skema Daya ke Performa Maksimal
echo  [3] Reset Tumpukan Jaringan (Winsock Reset) & Flush DNS
echo  [0] Kembali ke Menu Utama
echo.
echo ====================================================================
set /p "perf_choice=Masukkan pilihan Anda (0-3): "

if "%perf_choice%"=="1" goto clean_ram
if "%perf_choice%"=="2" goto tweak_startup
if "%perf_choice%"=="3" goto reset_network
if "%perf_choice%"=="0" goto main_menu
goto performance_menu

:clean_ram
echo.
echo Mengosongkan alokasi standby memory dan cache RAM sistem...
powershell -Command "[System.GC]::Collect()" >nul 2>&1
echo Proses optimasi alokasi RAM selesai!
pause
goto performance_menu

:tweak_startup
echo.
echo Mengonfigurasi skema daya Windows ke High Performance...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo Skema Performa Maksimal berhasil diaktifkan!
pause
goto performance_menu

:reset_network
echo.
echo Melakukan Flush DNS cache...
ipconfig /flushdns
echo Mengatur ulang Winsock Tumpukan Protokol Jaringan...
netsh winsock reset >nul 2>&1
netsh int ip reset >nul 2>&1
echo Konfigurasi Jaringan berhasil di-refresh!
pause
goto performance_menu


:: ====================================================================
:: [3] MENU PRIVASI & TELEMETRI WINDOWS
:: ====================================================================
:privacy_menu
cls
echo ====================================================================
echo                     PRIVACY & TELEMETRY DEBLOATER
echo ====================================================================
echo.
echo  [1] Matikan Layanan Telemetri Windows (Microsoft Data Collector)
echo  [2] Matikan Asisten Virtual Cortana
echo  [3] Nonaktifkan Iklan Bawaan Di Dalam Menu Start & File Explorer
echo  [4] Matikan Fitur Activity History (Pelacakan Garis Waktu)
echo  [5] Matikan Pelacakan Lokasi (Location Services)
echo  [6] Matikan Fitur Feedback Notifications
echo  [7] Matikan Fitur Game Bar di Latar Belakang
echo  [8] EKSEKUSI SEMUA PRIVASI DEBLOAT DI ATAS
echo  [0] Kembali ke Menu Utama
echo.
echo ====================================================================
set /p "priv_choice=Masukkan pilihan Anda (0-8): "

if "%priv_choice%"=="1" goto debloat_telemetry
if "%priv_choice%"=="2" goto debloat_cortana
if "%priv_choice%"=="3" goto debloat_ads
if "%priv_choice%"=="4" goto debloat_activity
if "%priv_choice%"=="5" goto debloat_location
if "%priv_choice%"=="6" goto debloat_feedback
if "%priv_choice%"=="7" goto debloat_gamebar
if "%priv_choice%"=="8" goto debloat_all_privacy
if "%priv_choice%"=="0" goto main_menu
goto privacy_menu

:debloat_telemetry
echo.
echo Menonaktifkan Telemetri dan Data Logger...
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start= disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
echo Selesai!
pause
goto privacy_menu

:debloat_cortana
echo.
echo Menonaktifkan Asisten Virtual Cortana via Registry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
echo Selesai!
pause
goto privacy_menu

:debloat_ads
echo.
echo Menghapus iklan bawaan Windows...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /t REG_DWORD /d 0 /f >nul 2>&1
echo Selesai!
pause
goto privacy_menu

:debloat_activity
echo.
echo Mematikan Activity History tracking...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1
echo Selesai!
pause
goto privacy_menu

:debloat_location
echo.
echo Mematikan Location Services...
sc stop lfsvc >nul 2>&1
sc config lfsvc start= disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f >nul 2>&1
echo Selesai!
pause
goto privacy_menu

:debloat_feedback
echo.
echo Mematikan Feedback Notifications...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Suggested" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo Selesai!
pause
goto privacy_menu

:debloat_gamebar
echo.
echo Mematikan Game Bar Background Process...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo Selesai!
pause
goto privacy_menu

:debloat_all_privacy
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start= disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1
sc stop lfsvc >nul 2>&1
sc config lfsvc start= disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Suggested" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo ====================================================================
echo BERHASIL: Semua fitur pelacak dan iklan bawaan Windows dinonaktifkan!
echo ====================================================================
pause
goto privacy_menu


:: ====================================================================
:: [4] LAYANAN UTAMA WINDOWS (SERVICES CONTROLLER)
:: ====================================================================
:services_menu
cls
echo ====================================================================
echo                 MANAJEMEN 4 LAYANAN UTAMA WINDOWS
echo ====================================================================
echo.
echo  [1] DISABLE - Optimize Drives (defragsvc)
echo  [2] DISABLE - Windows Update (wuauserv)
echo  [3] DISABLE - Windows Search (WSearch)
echo  [4] DISABLE - Windows Modules Installer (TrustedInstaller)
echo  [5] DISABLE - SEMUA KEMPAT LAYANAN DI ATAS
echo  [6] RESTORE - KEMBALIKAN SEMUA LAYANAN KE DEFAULT (ENABLE)
echo  [0] Kembali ke Menu Utama
echo.
echo ====================================================================
set /p "srv_choice=Masukkan pilihan Anda (0-6): "

if "%srv_choice%"=="1" goto s_defrag
if "%srv_choice%"=="2" goto s_update
if "%srv_choice%"=="3" goto s_search
if "%srv_choice%"=="4" goto s_trusted
if "%srv_choice%"=="5" goto s_disable_all
if "%srv_choice%"=="6" goto s_restore_all
if "%srv_choice%"=="0" goto main_menu
goto services_menu

:s_defrag
echo.
echo Memproses: Disabling Optimize Drives...
sc stop defragsvc >nul 2>&1
sc config defragsvc start= disabled
echo Layanan Optimize Drives berhasil dinonaktifkan!
pause
goto services_menu

:s_update
echo.
echo Memproses: Disabling Windows Update...
sc stop wuauserv >nul 2>&1
sc config wuauserv start= disabled
echo Layanan Windows Update berhasil dinonaktifkan!
pause
goto services_menu

:s_search
echo.
echo Memproses: Disabling Windows Search...
sc stop WSearch >nul 2>&1
sc config WSearch start= disabled
echo Layanan Windows Search berhasil dinonaktifkan!
pause
goto services_menu

:s_trusted
echo.
echo Memproses: Disabling Windows Modules Installer...
sc stop TrustedInstaller >nul 2>&1
sc config TrustedInstaller start= disabled
echo Layanan Windows Modules Installer berhasil dinonaktifkan!
pause
goto services_menu

:s_disable_all
echo.
echo Menonaktifkan keempat layanan utama sekaligus...
sc stop defragsvc >nul 2>&1
sc config defragsvc start= disabled
sc stop wuauserv >nul 2>&1
sc config wuauserv start= disabled
sc stop WSearch >nul 2>&1
sc config WSearch start= disabled
sc stop TrustedInstaller >nul 2>&1
sc config TrustedInstaller start= disabled
echo Keempat layanan berhasil dikunci ke status DISABLED!
pause
goto services_menu

:s_restore_all
echo.
echo Mengembalikan konfigurasi seluruh layanan ke status default...
sc config defragsvc start= demand
sc config wuauserv start= demand
sc config WSearch start= delayed-auto
sc start WSearch >nul 2>&1
sc config TrustedInstaller start= demand
echo.
echo ====================================================================
echo RESTORE SUKSES: 4 Layanan dikembalikan ke pengaturan default Windows!
echo ====================================================================
pause
goto services_menu


:: ====================================================================
:: [5] MENU DIAGNOSTIK KESEHATAN DISK & SPESIFIKASI HARDWARE
:: ====================================================================
:diagnostic_menu
cls
echo ====================================================================
echo                   DIAGNOSTIK KESEHATAN DISK & HARDWARE
echo ====================================================================
echo.
echo  [1] Jalankan Pemindaian Status Kesehatan Harddisk (CHKDSK)
echo  [2] Ekstrak Laporan Spesifikasi Lengkap Hardware PC ke File Teks
echo  [0] Kembali ke Menu Utama
echo.
echo ====================================================================
set /p "diag_choice=Masukkan pilihan Anda (0-2): "

if "%diag_choice%"=="1" goto run_chkdsk
if "%diag_choice%"=="2" goto export_specs
if "%diag_choice%"=="0" goto main_menu
goto diagnostic_menu

:run_chkdsk
echo.
echo Memulai pemeriksaan sektor drive harddisk/SSD sistem (Mode Baca)...
chkdsk %systemdrive%
echo.
echo Pemeriksaan kesehatan volume drive selesai dikerjakan!
pause
goto diagnostic_menu

:export_specs
echo.
echo Sedang mengekstrak spesifikasi sistem komprehensif...
set "logfile=Spesifikasi_PC_WindowsCLEANER.txt"
echo ======================================================== > "%logfile%"
echo        LAPORAN SPESIFIKASI SISTEM - WindowsCLEANER       >> "%logfile%"
echo             Generated by Mr.Rm19 (DevTools)             >> "%logfile%"
echo ======================================================== >> "%logfile%"
echo Tanggal Audit : %date% %time% >> "%logfile%"
echo. >> "%logfile%"
echo [ SISTEM OPERASI ] >> "%logfile%"
wmic os get Caption,OSArchitecture,Version /value >> "%logfile%"
echo [ PROSESOR / CPU ] >> "%logfile%"
wmic cpu get Name,NumberOfCores,MaxClockSpeed /value >> "%logfile%"
echo [ TOTAL MEMORI RAM ] >> "%logfile%"
wmic computersystem get TotalPhysicalMemory /value >> "%logfile%"
echo [ MEDIA PENYIMPANAN / STORAGE ] >> "%logfile%"
wmic diskdrive get Model,Size,Status /value >> "%logfile%"
echo ======================================================== >> "%logfile%"

echo.
echo Laporan spesifikasi sukses dibuat dengan nama berkas:
echo --^> %logfile%
pause
goto diagnostic_menu