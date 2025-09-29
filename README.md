

## 1. Download / Clone Project

1. Pastikan sudah terinstall:

   - [Node.js](https://nodejs.org/)
   - [npm](https://www.npmjs.com/)
   - [PostgreSQL](https://www.postgresql.org/download/)

2. Clone project dari GitHub:
   ```bash
   - git clone https://github.com/dipz-jgj/beringharjo_ecommerce_backend.git
   - cd beringharjo_ecommerce_backend
   - jalankan perintah: "npm install"
   ```

---

## 2. Setup Database PostgreSQL

1. Pastikan PostgreSQL sudah terinstall dan berjalan.
2. Login ke PostgreSQL melalui terminal:
   ```bash
   psql -U postgres
   ```
3. Buat database baru dengan perintah:
   ```bash
    CREATE DATABASE blog;
   ```
4. Import file dump-blog-202509291134.sql ke database (file db terlampir di repository):
   ```bash
   psql -U postgres -d blog -f dump-blog-202509291134.sql
   ```

---

## 3. Setup Prisma

1. Install Prisma CLI & Client (Jika belum)

   ```bash
   npm install prisma --save-dev
   npm install @prisma/client
   ```

2. Inisialisasi Prisma

   ```bash
   npx prisma init
   ```

3. Konfigurasi file .env

   ```bash
   DATABASE_URL="postgresql://postgres:your_password@localhost:5432/blog"
   ```

4. Jalankan Migrasi

   ```bash
   npx prisma migrate dev --name init
   ```

5. Generate Prisma Client
   ```bash
   npx prisma generate
   ```

---

## 4. Menjalankan Project di Local

1. Jalankan perintah
   ```bash
   npm run dev
   ```
