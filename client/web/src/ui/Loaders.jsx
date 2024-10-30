import React from "react";

const Loader1 = () => {
  return (
    <>
      <style>
        {`
          @keyframes strobe {
            0% { background-color: rgba(0, 0, 0, 0.1); }
            50% { background-color: rgba(0, 0, 0, 0.3); }
            100% { background-color: rgba(0, 0, 0, 0.1); }
          }

          .strobe-animation {
            animation: strobe 1.5s ease-in-out infinite;
          }
        `}
      </style>
      <div style={{ height: "100vh", width: "100vw", overflow: "hidden" }}>
        <div
          className="strobe-animation"
          style={{
            height: "3rem",
            margin: "1rem",
            borderRadius: "1rem",
          }}
        ></div>
        <div
          style={{
            display: "grid",
            gridTemplateColumns: "1fr 3fr",
            gap: "1rem",
            height: "calc(100vh - 5rem)",
            padding: "1rem",
          }}
        >
          <div
            className="strobe-animation"
            style={{
              height: "100%",
              borderRadius: "1rem",
            }}
          ></div>
          <div
            className="strobe-animation"
            style={{
              height: "100%",
              borderRadius: "1rem",
            }}
          ></div>
        </div>
      </div>
    </>
  );
};
const Loader2 = () => {
  const loaderStyle = {
    display: "inline-block",
    width: "70px",
    height: "70px",
    border: "4px solid #007bff", // Light blue color
    borderRadius: "50%",
    borderTopColor: "transparent",
    animation: "spin 1s linear infinite",
  };

  return (
    <>
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
      >
        <div style={loaderStyle}></div>
      </div>
      <style>
        {`
          @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
          }
        `}
      </style>
    </>
  );
};

export { Loader1, Loader2 };
