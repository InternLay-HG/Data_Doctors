import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import { Fragment } from 'react'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css';

createRoot(document.getElementById('root')).render(
  <Fragment>
    <App />
    <ToastContainer/>
  </Fragment>
  ,
)
