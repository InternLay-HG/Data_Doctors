import React from 'react'
import { Link } from 'react-router-dom'
const PageNotFound = () => {
  return (
    <div style={{backgroundColor:"#191f22",
      height:"100vh",
      width:"100vw",
      display:"flex",
      flexDirection:"column",
      justifyContent:"center",
      alignItems:"center",
    }}>
        <div style={{color:"white",fontSize:"13rem",}}>404</div>
        <div style={{color:"#808080",fontSize:"2rem"}}>Page Not Found</div>
        <div style={{color:"#808080",fontSize:"2rem",paddingTop:"1rem"}}><Link to='/' style={{textDecoration:"none",
          color:"#5D3FD3"
        }}>Back to Homepage?</Link></div>
    </div>
  )
}

export default PageNotFound
