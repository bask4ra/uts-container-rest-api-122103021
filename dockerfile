# Gunakan image Node.js
FROM node:18-alpine

# Set direktori kerja dalam container
WORKDIR /app

# Copy package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy seluruh source code
COPY . .

# Expose port (pakai port asli dari repo: 3000)
EXPOSE 3000

# Command untuk menjalankan aplikasi
CMD ["npm", "start"]