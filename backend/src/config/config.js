require('dotenv').config();

module.exports = {
    port: process.env.PORT || 5000,
    mongodb: {
        uri: process.env.MONGODB_URI || 'mongodb://localhost:27017/webapp',
        options: {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        }
    },
    jwt: {
        secret: process.env.JWT_SECRET || 'your-secret-key',
        expiresIn: '24h'
    },
    cors: {
        origin: process.env.FRONTEND_URL || 'http://localhost:3000',
        credentials: true
    },
    uploads: {
        path: process.env.UPLOAD_PATH || 'uploads',
        maxSize: process.env.MAX_FILE_SIZE || 10 * 1024 * 1024 // 10MB
    }
};