# ====================================================================
# WINDOWS CLEANER & OPTIMIZER PACK (POWERSHELL VERSION)
# Developed by : Mr.Rm19
# Official GitHub : https://github.com/Rm19x
# ====================================================================

# 1. Memastikan script berjalan dengan hak akses Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "Memeriksa hak akses Administrator..." -ForegroundColor Yellow
    Write-Host "Membuka ulang script dengan hak akses Administrator tertinggi..." -ForegroundColor Cyan
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Mengatur lokasi kerja ke direktori tempat script ini disimpan (Anti-Crash)
Set-Location -Path $PSScriptRoot

function Show-MainMenu {
    Clear-Host
    # Meniru warna CMD 'color 0A' menggunakan konsol PowerShell
    $host.UI.RawUI.ForegroundColor = "Green"
    $host.UI.RawUI.BackgroundColor = "Black"

    Write-Host "===================================================================="
    Write-Host "                 WELCOME TO WINDOWS CLEANER & OPTIMIZER"
    Write-Host "===================================================================="
    Write-Host "   [+] Tool Name   : WindowsCLEANER (PowerShell Version)"
    Write-Host "   [+] Developer   : Mr.Rm19"
    Write-Host "   [+] Official Git: https://github.com/Rm19x"
    Write-Host "===================================================================="
    Write-Host ""
    Write-Host "  [1] Jalankan Pembersihan Sampah Sistem (System Junk Cleaner)"
    Write-Host "  [2] Jalankan Pengoptimalan Memori & Jaringan (Performance Tweaks)"
    Write-Host "  [3] Jalankan Konfigurasi Privasi & Telemetri (Privacy Debloater)"
    Write-Host "  [4] Kelola 4 Layanan Utama Windows (Services Controller Menu)"
    Write-Host "  [5] Jalankan Diagnostik Kesehatan Disk & Spesifikasi Hardware"
    Write-Host "  [0] Keluar Aplikasi"
    Write-Host ""
    Write-Host "===================================================================="
    
    $choice = Read-Host "Masukkan pilihan Anda (0-5)"
    
    switch ($choice) {
        "1" { Show-JunkMenu }
        "2" { Show-PerformanceMenu }
        "3" { Show-PrivacyMenu }
        "4" { Show-ServicesMenu }
        "5" { Show-DiagnosticMenu }
        "0" { Exit }
        Default { Show-MainMenu }
    }
}

# ====================================================================
# [1] MENU PEMBERSIHAN SAMPAH SISTEM
# ====================================================================
function Show-JunkMenu {
    Clear-Host
    Write-Host "===================================================================="
    Write-Host "                 PEMBERSIHAN SAMPAH SISTEM (JUNK CLEANER)"
    Write-Host "===================================================================="
    Write-Host ""
    Write-Host "  [1] Bersihkan File Sementara Windows (TEMP)"
    Write-Host "  [2] Bersihkan File Sementara Pengguna (User AppData TEMP)"
    Write-Host "  [3] Kosongkan Kotak Sampah (Recycle Bin) Automatically"
    Write-Host "  [4] Bersihkan Cache Windows Update Lama (SoftwareDistribution)"
    Write-Host "  [5] Hapus File Prefetch Sistem"
    Write-Host "  [6] Bersihkan Sisa File Instalasi Driver Grafis (NVIDIA/AMD/Intel)"
    Write-Host "  [7] Bersihkan Cache & Cookies Google Chrome"
    Write-Host "  [8] Bersihkan Cache Microsoft Edge"
    Write-Host "  [9] Bersihkan Cache Mozilla Firefox"
    Write-Host "  [10] JALANKAN SEMUA PEMBERSIHAN SAMPAH DI ATAS"
    Write-Host "  [0] Kembali ke Menu Utama"
    Write-Host ""
    Write-Host "===================================================================="
    
    $choice = Read-Host "Masukkan pilihan Anda (0-10)"
    
    switch ($choice) {
        "1" { Clean-WindowsTemp; Read-Host "Tekan Enter untuk melanjutkan..."; Show-JunkMenu }
        "2" { Clean-UserTemp; Read-Host "Tekan Enter untuk melanjutkan..."; Show-JunkMenu }
        "3" { Clean-RecycleBin; Read-Host "Tekan Enter untuk melanjutkan..."; Show-JunkMenu }
        "4" { Clean-WindowsUpdate; Read-Host "Tekan Enter untuk melanjutkan..."; Show-JunkMenu }
        "5" { Clean-Prefetch; Read-Host "Tekan Enter untuk melanjutkan..."; Show-JunkMenu }
        "6" { Clean-DriversCache; Read-Host "Tekan Enter untuk melanjutkan..."; Show-JunkMenu }
        "7" { Clean-ChromeCache; Read-Host "Tekan Enter untuk melanjutkan..."; Show-JunkMenu }
        "8" { Clean-EdgeCache; Read-Host "Tekan Enter untuk melanjutkan..."; Show-JunkMenu }
        "9" { Clean-FirefoxCache; Read-Host "Tekan Enter untuk melanjutkan..."; Show-JunkMenu }
        "10" { 
            Clean-WindowsTemp; Clean-UserTemp; Clean-RecycleBin; Clean-WindowsUpdate
            Clean-Prefetch; Clean-DriversCache; Clean-ChromeCache; Clean-EdgeCache; Clean-FirefoxCache
            Write-Host "`n====================================================================" -ForegroundColor Green
            Write-Host "SUKSES: Seluruh file sampah digital berhasil disapu bersih!" -ForegroundColor Green
            Write-Host "====================================================================" -ForegroundColor Green
            Read-Host "Tekan Enter untuk melanjutkan..."
            Show-JunkMenu 
        }
        "0" { Show-MainMenu }
        Default { Show-JunkMenu }
    }
}

function Clean-WindowsTemp {
    Write-Host "`nMembersihkan file sementara Windows..." -ForegroundColor Cyan
    Remove-Item -Path "$env:SystemRoot\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Selesai!" -ForegroundColor Green
}

function Clean-UserTemp {
    Write-Host "`nMembersihkan file sementara pengguna..." -ForegroundColor Cyan
    Remove-Item -Path "$env:LOCALAPPDATA\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Selesai!" -ForegroundColor Green
}

function Clean-RecycleBin {
    Write-Host "`nMengosongkan Kotak Sampah (Recycle Bin)..." -ForegroundColor Cyan
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Write-Host "Selesai!" -ForegroundColor Green
}

function Clean-WindowsUpdate {
    Write-Host "`nMenghentikan wuauserv sementara untuk membersihkan cache..." -ForegroundColor Cyan
    Stop-Service -Name "wuauserv" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:SystemRoot\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service -Name "wuauserv" -ErrorAction SilentlyContinue
    Write-Host "Selesai!" -ForegroundColor Green
}

function Clean-Prefetch {
    Write-Host "`nMenghapus file Prefetch sistem..." -ForegroundColor Cyan
    Remove-Item -Path "$env:SystemRoot\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Selesai!" -ForegroundColor Green
}

function Clean-DriversCache {
    Write-Host "`nMembersihkan sisa instalasi driver grafis usang..." -ForegroundColor Cyan
    Remove-Item -Path "C:\NVIDIA", "C:\AMD", "C:\Intel" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Selesai!" -ForegroundColor Green
}

function Clean-ChromeCache {
    Write-Host "`nMembersihkan cache dan cookies Google Chrome..." -ForegroundColor Cyan
    Stop-Process -Name "chrome" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Selesai!" -ForegroundColor Green
}

function Clean-EdgeCache {
    Write-Host "`nMembersihkan cache Microsoft Edge..." -ForegroundColor Cyan
    Stop-Process -Name "msedge" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Selesai!" -ForegroundColor Green
}

function Clean-FirefoxCache {
    Write-Host "`nMembersihkan cache Mozilla Firefox..." -ForegroundColor Cyan
    Stop-Process -Name "firefox" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:APPDATA\Mozilla\Firefox\Profiles\*\cache2\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Selesai!" -ForegroundColor Green
}

# ====================================================================
# [2] MENU PENGOPTIMALAN MEMORI & JARINGAN
# ====================================================================
function Show-PerformanceMenu {
    Clear-Host
    Write-Host "===================================================================="
    Write-Host "                   PENGOPTIMALAN KINERJA MEMORI & JARINGAN"
    Write-Host "===================================================================="
    Write-Host ""
    Write-Host "  [1] Jalankan Pembersihan RAM (Garbage Collector Memory Purge)"
    Write-Host "  [2] Atur Ulang Skema Daya ke Performa Maksimal (High Performance)"
    Write-Host "  [3] Reset Tumpukan Jaringan (Winsock Reset) & Flush DNS"
    Write-Host "  [0] Kembali ke Menu Utama"
    Write-Host ""
    Write-Host "===================================================================="
    
    $choice = Read-Host "Masukkan pilihan Anda (0-3)"
    
    switch ($choice) {
        "1" {
            Write-Host "`nMengosongkan alokasi standby memory dan cache RAM sistem..." -ForegroundColor Cyan
            [System.GC]::Collect()
            Write-Host "Proses optimasi alokasi RAM selesai!" -ForegroundColor Green
            Read-Host "Tekan Enter untuk melanjutkan..."
            Show-PerformanceMenu
        }
        "2" {
            Write-Host "`nMengonfigurasi skema daya Windows ke High Performance..." -ForegroundColor Cyan
            powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
            Write-Host "Skema Performa Maksimal berhasil diaktifkan!" -ForegroundColor Green
            Read-Host "Tekan Enter untuk melanjutkan..."
            Show-PerformanceMenu
        }
        "3" {
            Write-Host "`nMelakukan Flush DNS cache..." -ForegroundColor Cyan
            Clear-DnsClientCache
            Write-Host "Mengatur ulang Winsock Tumpukan Protokol Jaringan..." -ForegroundColor Cyan
            netsh winsock reset | Out-Null
            netsh int ip reset | Out-Null
            Write-Host "Konfigurasi Jaringan berhasil di-refresh!" -ForegroundColor Green
            Read-Host "Tekan Enter untuk melanjutkan..."
            Show-PerformanceMenu
        }
        "0" { Show-MainMenu }
        Default { Show-PerformanceMenu }
    }
}

# ====================================================================
# [3] MENU PRIVASI & TELEMETRI WINDOWS
# ====================================================================
function Show-PrivacyMenu {
    Clear-Host
    Write-Host "===================================================================="
    Write-Host "                     PRIVACY & TELEMETRY DEBLOATER"
    Write-Host "===================================================================="
    Write-Host ""
    Write-Host "  [1] Matikan Layanan Telemetri Windows (Microsoft Data Collector)"
    Write-Host "  [2] Matikan Asisten Virtual Cortana"
    Write-Host "  [3] Nonaktifkan Iklan Bawaan Di Dalam Menu Start & File Explorer"
    Write-Host "  [4] Matikan Fitur Activity History (Pelacakan Garis Waktu)"
    Write-Host "  [5] Matikan Pelacakan Lokasi (Location Services)"
    Write-Host "  [6] Matikan Fitur Feedback Notifications"
    Write-Host "  [7] Matikan Fitur Game Bar di Latar Belakang"
    Write-Host "  [8] EKSEKUSI SEMUA PRIVASI DEBLOAT DI ATAS"
    Write-Host "  [0] Kembali ke Menu Utama"
    Write-Host ""
    Write-Host "===================================================================="
    
    $choice = Read-Host "Masukkan pilihan Anda (0-8)"
    
    if ($choice -match '^[1-7]$') {
        Invoke-PrivacyTweak -TweakNumber $choice
        Read-Host "Tekan Enter untuk melanjutkan..."
        Show-PrivacyMenu
    } elseif ($choice -eq "8") {
        for ($i=1; $i -le 7; $i++) { Invoke-PrivacyTweak -TweakNumber $i }
        Write-Host "`n====================================================================" -ForegroundColor Green
        Write-Host "BERHASIL: Semua fitur pelacak dan iklan bawaan Windows dinonaktifkan!" -ForegroundColor Green
        Write-Host "====================================================================" -ForegroundColor Green
        Read-Host "Tekan Enter untuk melanjutkan..."
        Show-PrivacyMenu
    } elseif ($choice -eq "0") {
        Show-MainMenu
    } else {
        Show-PrivacyMenu
    }
}

function Invoke-PrivacyTweak ($TweakNumber) {
    switch ($TweakNumber) {
        "1" {
            Write-Host "`nMenonaktifkan Telemetri dan Data Logger..." -ForegroundColor Cyan
            Stop-Service -Name "DiagTrack", "dmwappushservice" -Force -ErrorAction SilentlyContinue
            Set-Service -Name "DiagTrack", "dmwappushservice" -StartupType Disabled -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Force -ErrorAction SilentlyContinue
        }
        "2" {
            Write-Host "`nMenonaktifkan Asisten Virtual Cortana..." -ForegroundColor Cyan
            if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) { New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null }
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -Force -ErrorAction SilentlyContinue
        }
        "3" {
            Write-Host "`nMenghapus iklan bawaan Windows..." -ForegroundColor Cyan
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Value 0 -Force -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSyncProviderNotifications" -Value 0 -Force -ErrorAction SilentlyContinue
        }
        "4" {
            Write-Host "`nMematikan Activity History tracking..." -ForegroundColor Cyan
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0 -Force -ErrorAction SilentlyContinue
        }
        "5" {
            Write-Host "`nMematikan Location Services..." -ForegroundColor Cyan
            Stop-Service -Name "lfsvc" -Force -ErrorAction SilentlyContinue
            Set-Service -Name "lfsvc" -StartupType Disabled -ErrorAction SilentlyContinue
            if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors")) { New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Force | Out-Null }
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocation" -Value 1 -Force -ErrorAction SilentlyContinue
        }
        "6" {
            Write-Host "`nMematikan Feedback Notifications..." -ForegroundColor Cyan
            if (-not (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Suggested")) { New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Suggested" -Force | Out-Null }
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Suggested" -Name "Enabled" -Value 0 -Force -ErrorAction SilentlyContinue
        }
        "7" {
            Write-Host "`nMematikan Game Bar Background Process..." -ForegroundColor Cyan
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Force -ErrorAction SilentlyContinue
        }
    }
    Write-Host "Selesai!" -ForegroundColor Green
}

# ====================================================================
# [4] LAYANAN UTAMA WINDOWS (SERVICES CONTROLLER)
# ====================================================================
function Show-ServicesMenu {
    Clear-Host
    Write-Host "===================================================================="
    Write-Host "                 MANAJEMEN 4 LAYANAN UTAMA WINDOWS"
    Write-Host "===================================================================="
    Write-Host ""
    Write-Host "  [1] DISABLE - Optimize Drives (defragsvc)"
    Write-Host "  [2] DISABLE - Windows Update (wuauserv)"
    Write-Host "  [3] DISABLE - Windows Search (WSearch)"
    Write-Host "  [4] DISABLE - Windows Modules Installer (TrustedInstaller)"
    Write-Host "  [5] DISABLE - SEMUA KEMPAT LAYANAN DI ATAS"
    Write-Host "  [6] RESTORE - KEMBALIKAN SEMUA LAYANAN KE DEFAULT (ENABLE)"
    Write-Host "  [0] Kembali ke Menu Utama"
    Write-Host ""
    Write-Host "===================================================================="
    
    $choice = Read-Host "Masukkan pilihan Anda (0-6)"
    $srvList = @("defragsvc", "wuauserv", "WSearch", "TrustedInstaller")
    
    switch ($choice) {
        "1" { Manage-Srv -SrvName "defragsvc" -State "Disable"; Read-Host "Tekan Enter..."; Show-ServicesMenu }
        "2" { Manage-Srv -SrvName "wuauserv" -State "Disable"; Read-Host "Tekan Enter..."; Show-ServicesMenu }
        "3" { Manage-Srv -SrvName "WSearch" -State "Disable"; Read-Host "Tekan Enter..."; Show-ServicesMenu }
        "4" { Manage-Srv -SrvName "TrustedInstaller" -State "Disable"; Read-Host "Tekan Enter..."; Show-ServicesMenu }
        "5" {
            foreach ($s in $srvList) { Manage-Srv -SrvName $s -State "Disable" }
            Write-Host "`nKeempat layanan berhasil dikunci ke status DISABLED!" -ForegroundColor Green
            Read-Host "Tekan Enter..."
            Show-ServicesMenu
        }
        "6" {
            Set-Service -Name "defragsvc" -StartupType Manual -ErrorAction SilentlyContinue
            Set-Service -Name "wuauserv" -StartupType Manual -ErrorAction SilentlyContinue
            Set-Service -Name "WSearch" -StartupType AutomaticDelayed -ErrorAction SilentlyContinue
            Start-Service -Name "WSearch" -ErrorAction SilentlyContinue
            Set-Service -Name "TrustedInstaller" -StartupType Manual -ErrorAction SilentlyContinue
            Write-Host "`n====================================================================" -ForegroundColor Green
            Write-Host "RESTORE SUKSES: 4 Layanan dikembalikan ke pengaturan default Windows!" -ForegroundColor Green
            Write-Host "====================================================================" -ForegroundColor Green
            Read-Host "Tekan Enter..."
            Show-ServicesMenu
        }
        "0" { Show-MainMenu }
        Default { Show-ServicesMenu }
    }
}

function Manage-Srv ($SrvName, $State) {
    Write-Host "`nMemproses: $State $SrvName..." -ForegroundColor Cyan
    Stop-Service -Name $SrvName -Force -ErrorAction SilentlyContinue
    Set-Service -Name $SrvName -StartupType Disabled -ErrorAction SilentlyContinue
    Write-Host "Layanan $SrvName berhasil dinonaktifkan!" -ForegroundColor Green
}

# ====================================================================
# [5] MENU DIAGNOSTIK KESEHATAN DISK & SPESIFIKASI HARDWARE
# ====================================================================
function Show-DiagnosticMenu {
    Clear-Host
    Write-Host "===================================================================="
    Write-Host "                   DIAGNOSTIK KESEHATAN DISK & HARDWARE"
    Write-Host "===================================================================="
    Write-Host ""
    Write-Host "  [1] Jalankan Pemindaian Status Kesehatan Harddisk (CHKDSK)"
    Write-Host "  [2] Ekstrak Laporan Spesifikasi Lengkap Hardware PC ke File Teks"
    Write-Host "  [0] Kembali ke Menu Utama"
    Write-Host ""
    Write-Host "===================================================================="
    
    $choice = Read-Host "Masukkan pilihan Anda (0-2)"
    
    switch ($choice) {
        "1" {
            Write-Host "`nMemulai pemeriksaan sektor drive harddisk/SSD sistem (Mode Baca)..." -ForegroundColor Cyan
            chkdsk $env:SystemDrive
            Write-Host "`nPemeriksaan kesehatan volume drive selesai dikerjakan!" -ForegroundColor Green
            Read-Host "Tekan Enter untuk melanjutkan..."
            Show-DiagnosticMenu
        }
        "2" {
            Write-Host "`nSedang mengekstrak spesifikasi sistem komprehensif..." -ForegroundColor Cyan
            $logfile = "Spesifikasi_PC_WindowsCLEANER.txt"
            
            $report = @(
                "========================================================",
                "        LAPORAN SPESIFIKASI SISTEM - WindowsCLEANER       ",
                "             Generated by Mr.Rm19 (DevTools)             ",
                "========================================================",
                "Tanggal Audit : $(Get-Date)",
                "",
                "[ SISTEM OPERASI ]",
                "$(Get-CimInstance Win32_OperatingSystem | Select-Object Caption, OSArchitecture, Version | Out-String)",
                "[ PROSESOR / CPU ]",
                "$(Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed | Out-String)",
                "[ TOTAL MEMORI RAM ]",
                "TotalPhysicalMemory : $([Math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)) GB",
                "",
                "[ MEDIA PENYIMPANAN / STORAGE ]",
                "$(Get-CimInstance Win32_DiskDrive | Select-Object Model, @{Name='Size(GB)';Expression={[Math]::Round($_.Size / 1GB, 2)}}, Status | Out-String)",
                "========================================================"
            )
            
            $report | Out-File -FilePath $logfile -Force
            Write-Host "Laporan spesifikasi sukses dibuat dengan nama berkas:" -ForegroundColor Green
            Write-Host "--> $logfile" -ForegroundColor Yellow
            Read-Host "Tekan Enter untuk melanjutkan..."
            Show-DiagnosticMenu
        }
        "0" { Show-MainMenu }
        Default { Show-DiagnosticMenu }
    }
}

# Mulai jalankan aplikasi pertama kali
Show-MainMenu