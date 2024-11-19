import React from "react";

const Dashboard = () => {
  return (
    <>
      <div style={{display:"flex",justifyContent:"center",alignItems:"center",height:"100%",width:"100%",paddingTop:"2rem"}}>
        <div style={{height:"100%",width:"75%",margin:"0rem 0.5rem",display:"flex",flexDirection:"column",gap:"3%"}}>
          <div style={{display:"flex",justifyContent:"space-evenly",alignItems:"center",height:"20%"}}>
            <div style={{background:"gray",color:"white",width:"17rem",height:"10rem"}}>c1</div>
            <div style={{background:"gray",color:"white",width:"17rem",height:"10rem"}}>c2</div>
            <div style={{background:"gray",color:"white",width:"17rem",height:"10rem"}}>c3</div>
            <div style={{background:"gray",color:"white",width:"17rem",height:"10rem"}}>c4</div>
            <div style={{background:"gray",color:"white",width:"17rem",height:"10rem"}}>c5</div>
          </div>
          <div style={{height:"45%",border:"1px solid grey",borderRadius:"1rem"}}>Graphs</div>
          <div style={{height:"27%",border:"1px solid grey",borderRadius:"1rem"}}>Risk Score Card</div>
        </div>
        <div style={{display:"flex",flexDirection:"column",height:"100%",width:"25%",margin:"0rem 0.5rem",gap:"3%"}}>
          <div style={{height:"25%",border:"1px solid grey",borderRadius:"1rem"}}>ProfileCard</div>
          <div style={{height:"72%",border:"1px solid grey",borderRadius:"1rem"}}>Appointments</div>
        </div>
      </div>
    </>
  );
};

export default Dashboard;
