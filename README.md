# Proyek UTS: REST API (Node.js & Docker)

Repository ini berisi sebuah REST API sederhana yang dibangun menggunakan Node.js, Express, dan dirancang untuk dijalankan di dalam *container* (Docker).

## Prasyarat

Pastikan Anda memiliki perangkat lunak berikut yang terinstal di sistem Anda:
* [Node.js](https://nodejs.org/)
* [npm](https://www.npmjs.com/)
* [Git](https://git-scm.com/)
* [Docker](https://www.docker.com/products/docker-desktop/)

## Instalasi

1.  Clone repository ini ke mesin lokal Anda:
    ```bash
    git clone [https://github.com/bask4ra/uts-container-rest-api-122103021.git](https://github.com/bask4ra/uts-container-rest-api-122103021.git)
    ```

2.  Masuk ke direktori proyek:
    ```bash
    cd uts-container-rest-api-122103021
    ```

## Menjalankan Aplikasi

Ada dua cara untuk menjalankan aplikasi ini: secara lokal di mesin Anda (untuk development) atau di dalam Docker container (direkomendasikan, sesuai desain proyek).

---

### Cara 1: Menjalankan di Lokal (Tanpa Docker)

Cara ini cocok untuk *development* dan *debugging* cepat.

1.  Install semua dependensi (package) yang dibutuhkan:
    ```bash
    npm install
    ```

2.  Jalankan server aplikasi:
    ```bash
    npm start
    ```
    *(Jika ada skrip `dev` di `package.json` Anda, Anda mungkin lebih suka menggunakan `npm run dev` untuk auto-reload).*

3.  Server sekarang akan berjalan. Secara default, server Express biasanya berjalan di `http://localhost:3000` (atau port lain yang Anda tentukan di file `.env` atau kode Anda).

---

### Cara 2: Menjalankan dengan Docker (Direkomendasikan)

Cara ini mengsimulasikan lingkungan produksi dan menggunakan `Dockerfile` yang ada di proyek.

1.  Pastikan layanan Docker Desktop sudah berjalan di sistem Anda.

2.  **Build** Docker image dari `Dockerfile` yang ada di root proyek. Beri nama image, misalnya `uts-api`:
    ```bash
    docker build -t uts-api .
    ```
    *(Tanda titik `.` di akhir berarti "build dari direktori ini").*

3.  Setelah image berhasil di-build, **jalankan** sebuah container dari image tersebut:
    ```bash
    docker run -p 8080:3000 -d --name api-container uts-api
    ```

4.  Aplikasi Anda sekarang berjalan di dalam container dan dapat diakses di `http://localhost:8080` dari browser Anda.

**Penjelasan Perintah `docker run`:**
* `-p 8080:3000`: Memetakan (mapping) port `8080` di komputer Anda (host) ke port `3000` di dalam container (tempat aplikasi Node.js berjalan). Anda bisa mengaksesnya lewat `localhost:8080`.
* `-d`: Menjalankan container dalam mode *detached* (di latar belakang).
* `--name api-container`: Memberi nama yang mudah diingat pada container Anda.
* `uts-api`: Nama image yang ingin Anda jalankan (yang kita buat di langkah 2).

### Perintah Docker yang Berguna

* **Melihat container yang sedang berjalan:**
    ```bash
    docker ps
    ```
* **Menghentikan container:**
    ```bash
    docker stop api-container
    ```
* **Melihat log dari container:**
    ```bash
    docker logs -f api-container
    ```

## API Endpoints (Contoh)

> **Catatan:** Ganti bagian ini dengan daftar endpoint API Anda yang sebenarnya.

* `GET /` - Halaman selamat datang.
* `GET /api/users` - Mendapatkan semua pengguna.
* `POST /api/users` - Membuat pengguna baru.
* `GET /api/users/:id` - Mendapatkan pengguna berdasarkan ID.
* `PUT /api/users/:id` - Memperbarui pengguna berdasarkan ID.
* `DELETE /api/users/:id` - Menghapus pengguna berdasarkan ID.

## Teknologi yang Digunakan

* **Node.js**: Lingkungan eksekusi JavaScript.
* **Express**: Framework web untuk Node.js.
* **Docker**: Platform untuk containerisasi aplikasi.