import express from 'express'
import mongoose from 'mongoose'
import dotenv from 'dotenv'

dotenv.config()

const PORT = process.env.PORT ? Number(process.env.PORT) : 8000
const MONGO_URI = process.env.MONGO_URI || 'mongodb://localhost:27017/octofit'

const app = express()
app.use(express.json())

app.get('/api/health', (req, res) => {
  res.json({ message: 'OK', port: PORT })
})

// simple example route
app.get('/api/users', async (req, res) => {
  try {
    const { default: User } = await import('./models/User')
    const users = await User.find().limit(10)
    res.json(users)
  } catch (err) {
    res.status(500).json({ error: 'failed to fetch users' })
  }
})

mongoose.connect(MONGO_URI)
  .then(()=>{
    console.log('Connected to MongoDB:', MONGO_URI)
    app.listen(PORT, ()=> console.log(`Backend running on http://localhost:${PORT}`))
  })
  .catch(err => {
    console.error('Mongo connection error', err)
    process.exit(1)
  })
