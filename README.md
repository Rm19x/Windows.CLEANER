# WindowsCLEANER & Optimizer Pack (CLI Version)

![Windows Support](https://img.shields.io/badge/Windows-10)
![Developer](https://img.shields.io/badge/Developer-Mr.Rm19-blue)

**WindowsCLEANER** adalah paket program berbasis CLI (Command Line Interface) yang dirancang khusus untuk membersihkan sampah digital, mengoptimalkan alokasi memori, menjaga privasi data, serta mendiagnosis kesehatan sistem operasi Windows Anda. 

Tool ini tersedia dalam dua versi eksekusi yang sangat ringan dan efisien: **Batch Script (`.bat`)** dan **PowerShell Script (`.ps1`)**.

---

## Fitur Utama

### 1. System Junk Cleaner (Pembersih Sampah)
*   **Pembersihan Temp Global:** Menghapus file sementara pada sistem Windows dan direktori pengguna (`AppData\Local\Temp`).
*   **Otomatisasi Recycle Bin:** Mengosongkan tempat sampah secara permanen via perintah latar belakang.
*   **Windows Update Cache Purge:** Menghentikan sementara layanan pengunduhan untuk menghapus sisa arsip instalasi Windows Update lama yang menimbun penyimpanan.
*   **Driver & Browser Cache Debloat:** Membersihkan sisa *installer* driver grafis usang (NVIDIA/AMD/Intel) serta cache dari tiga browser utama (Chrome, Edge, Firefox).

### 2. Performance Tweaks (Optimasi Kinerja)
*   **Memory Standby Purge:** Mengosongkan alokasi memori standby dan cache RAM yang tidak efisien menggunakan pemanggilan internal sistem.
*   **Ultimate Power Scheme:** Memaksa Windows beralih ke skema daya performa tinggi (*High Performance*).
*   **Network Stack Reset:** Melakukan *Flush DNS* serta mereset tumpukan protokol jaringan (*Winsock & IP Reset*) untuk mengatasi masalah latensi atau koneksi terputus.

### 3. Privacy Debloater (Keamanan & Privasi)
*   **Anti-Telemetry:** Mematikan layanan pelacakan data latar belakang (*DiagTrack* & *dmwappushservice*).
*   **Cortana & Ads Disabler:** Menonaktifkan asisten virtual Cortana serta memblokir iklan bawaan di menu Start dan File Explorer via modifikasi Registry yang aman.
*   **Background Activity Freeze:** Mematikan pelacakan riwayat aktivitas (*Activity History*), layanan lokasi (*Location Services*), serta proses latar belakang *Game Bar*.

### 4. Services Controller (Manajer Layanan)
*   Menyediakan kendali penuh untuk menonaktifkan (*Disable*) maupun mengembalikan (*Restore/Enable*) 4 layanan utama Windows yang sering memakan resource disk/CPU:
    *   Optimize Drives (`defragsvc`)
    *   Windows Update (`wuauserv`)
    *   Windows Search (`WSearch`)
    *   Windows Modules Installer (`TrustedInstaller`)

### 5. Disk Diagnostic & Hardware Audit
*   **CHKDSK Scanner:** Melakukan pemindaian sektor *drive* sistem untuk mendeteksi integritas *file system* (NTFS).
*   **Comprehensive Specs Exporter:** Mengekstrak laporan spesifikasi hardware PC secara mendalam (Informasi OS, CPU, RAM, dan Model Storage) langsung menjadi file teks rapi di direktori kerja.

---

##  Isi Repositori

*   `windowsCLEANER.bat` - Versi Batch Script tradisional, sangat cepat, dan kompetibel di berbagai lingkungan Windows.
*   `windowsCLEANER.ps1` - Versi PowerShell modern dengan penanganan *error* yang lebih kuat, aman, serta manajemen objek sistem yang presisi.

---


##  Cara Penggunaan

### Persyaratan Utama
> ⚠️ **PENTING:** Karena tool ini melakukan modifikasi pada Registry sistem, mematikan layanan, dan membaca sektor disk utama, Anda **WAJIB** menjalankannya dengan hak akses tertinggi (**Administrator**).

### A. Menjalankan Versi Batch (`.bat`)
1. Unduh berkas `windowsCLEANER.bat`.
2. Klik kanan pada file tersebut, lalu pilih **Run as administrator**.
3. Gunakan angka `0` - `5` pada keyboard untuk menavigasi menu utama.

### B. Menjalankan Versi PowerShell (`.ps1`)
1. Unduh berkas `windowsCLEANER.ps1`.
2. Klik kanan pada file tersebut, lalu pilih **Run with PowerShell**.
3. Script ini memiliki fitur *Auto-Elevate*, yang berarti jika Anda lupa membukanya sebagai Admin, script akan otomatis meminta konfirmasi UAC untuk membuka jendela baru dengan hak akses Administrator.

---

##  Catatan Keamanan & Batasan Masalah
*   **Anti-Crash Directory Lock:** Kedua script ini sudah dilengkapi pengunci path (`cd /d "%~dp0"` dan `Set-Location`), mencegah terminal menutup paksa (*crash*) saat Windows mengalihkan direktori kerja default ke `System32`.
*   **Execution Policy:** Jika komputer Anda memblokir eksekusi script PowerShell karena kebijakan keamanan Windows, Anda dapat mengizinkannya secara sementara lewat terminal PowerShell Admin dengan mengetikkan perintah:  
    `Set-ExecutionPolicy Bypass -Scope Process`

---
## view
<img src="https://raw.githubusercontent.com/Rm19x/Windows.CLEANER/refs/heads/main/cleaner.png">

##  Kontributor & Pengembangan

*   **Developer:** [Mr.Rm19](https://github.com/Rm19x)
 *   **facebook me** : https://www.facebook.com/Root19Ramdan/
---

Silakan lakukan *fork* pada repositori ini jika Anda ingin menambahkan modul optimasi baru atau menyesuaikan skenario pembersihan sesuai kebutuhan spesifik Anda. 

---
