# Global Store Network Analysis: Mapping H&M's Market Presence and Strategy

## Ringkasan Proyek

Proyek ini adalah analisis *end-to-end* (ujung ke ujung) terhadap data distribusi toko H&M di seluruh dunia. Tujuannya adalah untuk mengungkap strategi bisnis H&M, mengidentifikasi pasar inti, dan membandingkan kuantitas toko dengan kualitas investasi (klasifikasi toko) dan sebaran geografis (penetrasi kota).

Analisis ini melibatkan pemrosesan data menggunakan Python dan visualisasi interaktif menggunakan Tableau.

## Tools dan Teknologi

| Tahap Analisis | Alat yang Digunakan | Tujuan |
| :--- | :--- | :--- |
| **Data Cleaning & Modeling** | Python (Pandas) | Pembersihan data, penanganan *missing values* (NULL), dan pembentukan fitur `Clean StoreClass`. |
| **Visualisasi & Dashboarding** | Tableau Public/Desktop | Pembuatan visualisasi Dual-Axis, *Stacked Bar Chart*, dan peta distribusi interaktif. |

## Struktur Repositori

| File | Deskripsi |
| :--- | :--- |
| **`hnm_data_cleaning.ipynb`** | *Notebook* Google Colab (Python) yang berisi langkah-langkah *data cleaning*, penanganan nilai kosong ("Not yet confirmed"), dan proses *data modeling* awal. |
| **`hnm_stores_cleaned.csv`** | *Dataset* akhir yang telah dibersihkan dan siap divisualisasikan, digunakan sebagai sumber data untuk Tableau. |
| **`hnm_dashboard_workbook.twbx`** | File *workbook* Tableau yang dapat diunduh untuk melihat detail visualisasi, *worksheet*, dan koneksi data. |
| **`hnm_dashboard_final.png`** | *Screenshot* resolusi tinggi dari *dashboard* final. |

## Hasil dan Temuan Kunci (Key Insights)

Visualisasi akhir berhasil menggabungkan tiga metrik utama dalam satu *chart* yang kuat: **Total Toko**, **Komposisi Klasifikasi Toko**, dan **Penetrasi Kota**.

### 1. Kepadatan dan Komposisi Pasar (TOP 20 Countries)

* **Dominasi Kuantitas vs. Kualitas:** Amerika Serikat dan Tiongkok memimpin jumlah toko terbanyak. Analisis *Stacked Bar* menunjukkan kedua negara ini memiliki proporsi toko **`Flagship`** yang tinggi, menandakan investasi dan prioritas pasar yang superior.
* **Ketergantungan Toko Standar:** Negara-negara Eropa (seperti Jerman, UK) didominasi oleh toko **`Red`** (Standard Class), mengindikasikan strategi pasar yang mapan dan berfokus pada volume.
* **Analisis Kepadatan (*Dual-Axis*):** Perbandingan antara Batang (Total Stores) dan Garis (Count City) menunjukkan bahwa pasar seperti Jerman memiliki kepadatan toko yang tinggi karena jumlah toko yang terkonsentrasi di sejumlah kota besar tertentu.

### 2. Strategi Penanganan Data

* **Penanganan *Missing Values*:** Selama proses *cleaning* di Python, 3 toko dengan *missing values* di kolom `StoreClass` diberi label baru sebagai **"Not yet confirmed"** untuk memastikan transparansi data dan mempertahankan total jumlah toko (4.292) secara akurat.

## Tampilan Dashboard

![Tampilan Dashboard H&M Store Analysis](Dashboard 1 (1).png)

##  Akses File Proyek

* **Kode Pembersihan Data (Python Notebook):** [LIHAT KODE DI BROWSER](ALL_H&M_STORES_WORLDWIDE.ipynb)
* **File Dashboard Tableau:** [UNDUH WORKBOOK (.twbx)](ALL H&M STORES WORLDWIDE.twbx)

***
