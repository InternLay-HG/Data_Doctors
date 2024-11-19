import React, { useState,useEffect } from "react";
import { KeyboardBackspace as BackIcon } from "@mui/icons-material";
import { useNavigate } from "react-router";
import Authentication from "../api/Authentication";
import Toast from "../ui/Toast";
const OTPverifyPage = () => {
  const navigate = useNavigate();
  const { ToastFunc } = Toast();
  const {verifyOtpCall} = Authentication();
  const [email, setEmail] = useState("");
  const [Otp, setOtp] = useState("");
  const [errors, setErrors] = useState({});
  useEffect(() => {
    if (localStorage.getItem("authtoken")) {
      navigate("/");
    }
  }, []);
  const handleSubmitOTP = async (e) => {
    e.preventDefault();
    let validationErrors = {};

    if (!email || !/\S+@\S+\.\S+/.test(email)) {
      validationErrors.email = "Please enter a valid email address.";
    }
    if (!Otp || !/^\d{6}$/.test(Otp)) {
      validationErrors.otp = "Please enter a valid 6-digit OTP.";
    }

    if (Object.keys(validationErrors).length > 0) {
      setErrors(validationErrors);
      return;
    } 
      setErrors({});
      const data={
        email:email,
        otp:Otp
      }
      try{
        await verifyOtpCall(data)
      }
      catch(err){
        console.error("OTP verification error:", err);
        ToastFunc("error",err.message);
      }
  };
  const handleBack = () => {
    navigate("/signup");
  };

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        gap: "6rem",
        flexWrap: "wrap",
        height: "100vh",
        overflowY: "auto",
        overflowX: "hidden",
        padding: "5rem 0rem",
        background:
          "linear-gradient(90deg, rgba(174,190,236,1) 0%, rgba(255,255,255,1) 100%)",
        backgroundRepeat: "no-repeat",
        backgroundSize: "cover",
        fontFamily: "Space Mono",
        position: "relative",
      }}
    >
      <div
        style={{
          position: "absolute",
          top: "5rem",
          left: "5rem",
          background: "rgba(255,255,255,0.5)",
          borderRadius: "40%",
          cursor: "pointer",
          padding: "0.5rem",
        }}
        onClick={handleBack}
        aria-label="Go Back"
      >
        <BackIcon style={{ width: "5rem", height: "5rem" }} />
      </div>
      <div
        style={{
          width: "40rem",
          height: "50rem",
          border: "1px solid grey",
          background: "rgba(255,255,255,0.7)",
          borderRadius: "1rem",
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "start",
        }}
      >
        <form
          onSubmit={handleSubmitOTP}
          style={{ width: "100%", padding: "3rem" }}
        >
          <div style={{ fontWeight: "bolder", fontSize: "2.6rem" }}>
            VERIFY OTP
          </div>
          <div
            style={{
              color: "grey",
              fontSize: "2rem",
              marginBottom: "4rem",
            }}
          >
            OTP will be sent to your provided email address in the signup form.
          </div>
          <div
            style={{
              display: "flex",
              justifyContent: "center",
              flexDirection: "column",
              marginBottom: "3rem",
            }}
          >
            <label
              htmlFor="email"
              style={{
                fontSize: "2rem",
                fontWeight: "bolder",
                marginBlock: "0.5rem",
              }}
            >
              Email
            </label>
            <input
              type="email"
              name="email"
              id="email"
              placeholder="Enter your email"
              style={{
                width: "27rem",
                height: "5rem",
                border: "1px solid grey",
                borderRadius: "1rem",
                outline: "0",
                padding: "0.5rem 1rem",
                fontFamily: "Space Mono",
              }}
              value={email}
              onChange={(e) => {
                setEmail(e.target.value);
                setErrors((prevErrors) => ({ ...prevErrors, email: "" }));
              }}
              required
            />
            {errors.email && (
              <span style={{ color: "red", marginTop: "1rem" }}>
                {errors.email}
              </span>
            )}
          </div>

          <div
            style={{
              display: "flex",
              justifyContent: "start",
              alignItems: "center",
              gap: "3rem",
            }}
          >
            <label
              htmlFor="OTP"
              style={{ fontWeight: "bolder", fontSize: "2rem" }}
            >
              OTP <span style={{ marginLeft: "1rem" }}>:</span>
            </label>
            <input
              type="tel"
              name="OTP"
              id="OTP"
              placeholder="Enter OTP"
              style={{
                width: "17rem",
                height: "5rem",
                border: "1px solid grey",
                borderRadius: "1rem",
                outline: "0",
                fontSize: "2rem",
                padding: "0.5rem 1rem",
                letterSpacing: "0.5rem",
              }}
              value={Otp}
              onChange={(e) => {
                setOtp(e.target.value);
                setErrors((prevErrors) => ({ ...prevErrors, otp: "" }));
              }}
              required
            />
          </div>
          {errors.otp && (
            <span style={{ color: "red", marginTop: "1rem" }}>
              {errors.otp}
            </span>
          )}
          <button
            type="submit"
            disabled={!email || !Otp}
            style={{
              border: "1px solid rgba(29,78,216)",
              width: "20rem",
              height: "4rem",
              borderRadius: "1rem",
              background: "rgba(29,78,216)",
              color: "white",
              marginTop: "5rem",
              fontWeight: "bolder",
              cursor: !email || !Otp ? "not-allowed" : "pointer",
              opacity: !email || !Otp ? 0.5 : 1,
            }}
          >
            Verify OTP
          </button>
        </form>
      </div>
    </div>
  );
};

export default OTPverifyPage;
