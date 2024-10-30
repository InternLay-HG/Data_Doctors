import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import { GoogleOAuthProvider } from '@react-oauth/google'

createRoot(document.getElementById('root')).render(
  <GoogleOAuthProvider clientId='740393123926-uc824bobu4fbnpc3ae6p6i4t388j5p1m.apps.googleusercontent.com'>
    <App />
  </GoogleOAuthProvider>,
)
