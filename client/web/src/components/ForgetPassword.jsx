import React, { useState, useEffect } from "react";
import { KeyboardBackspace as BackIcon } from "@mui/icons-material";
import { useNavigate } from "react-router";
import Authentication from "../api/Authentication";
import Toast from "../ui/Toast";
const ForgetPassword = () => {
  const navigate = useNavigate();
  const { ToastFunc } = Toast();
  const { ForgetPasswordCall } = Authentication();
  const [Email, setEmail] = useState("");
  const [NewPassword, setNewPassword] = useState("");
  const [Otp, setOtp] = useState("");
  const [errors, setErrors] = useState({});
  useEffect(() => {
    if (localStorage.getItem("authtoken")) {
      navigate("/");
    }
  }, []);
  const handleSendOTP = async (e) => {
    e.preventDefault();
    if (!Email || !/\S+@\S+\.\S+/.test(Email)) {
      setErrors((prevErrors) => ({
        ...prevErrors,
        email: "Please enter a valid email address.",
      }));
      return;
    } else {
      setErrors((prevErrors) => ({
        ...prevErrors,
        email: null,
      }));
      const data = {
        stage: "verifyownership",
        email: Email,
      };
      try {
        await ForgetPasswordCall(data);
      } catch (err) {
        console.error("OTP verification error:", err);
        ToastFunc("error", err.message);
      }
    }
  };

  const handleResetPassword = async (e) => {
    e.preventDefault();

    let validationErrors = {};
    if (!Otp || !/^\d{6}$/.test(Otp)) {
      validationErrors.otp = "Please enter a valid 6-digit OTP.";
    }

    if (!NewPassword || NewPassword.length < 8) {
      validationErrors.password =
        "Password must be at least 8 characters long.";
    }

    if (Object.keys(validationErrors).length > 0) {
      setErrors(validationErrors);
      return;
    }
    setErrors({});

    const data = {
      stage: "password-reset",
      email: Email,
      otp: Otp,
      newpassword: NewPassword,
    };
    try {
      await ForgetPasswordCall(data);
    } catch (err) {
      console.error("Password reset error:", err);
      ToastFunc("error", err.message);
    }
  };
  const handleBack = () => {
    navigate("/login");
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
        }}
        onClick={handleBack}
      >
        <BackIcon
          style={{ width: "5rem", height: "5rem", padding: "0.5rem 1rem" }}
        />
      </div>
      {/* Send OTP Section */}
      <div
        style={{
          width: "40rem",
          height: "45rem",
          background: "rgba(255,255,255,0.7)",
          borderRadius: "2.5rem",
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "start",
        }}
      >
        <div
          style={{
            marginLeft: "4rem",
            marginRight: "4rem",
            marginTop: "1rem",
            marginBottom: "4rem",
          }}
        >
          <h1
            style={{
              fontSize: "3rem",
              fontWeight: "bold",
            }}
          >
            Forget Password
          </h1>
          <span
            style={{
              color: "grey",
              fontSize: "1.5rem",
              marginBottom: "1rem",
              fontWeight: "lighter",
            }}
          >
            Reset your password by sending an OTP to your registered email
            address.
          </span>
        </div>
        <form
          onSubmit={handleSendOTP}
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "start",
            justifyContent: "center",
            marginLeft: "4rem",
            marginRight: "4rem",
          }}
        >
          <label
            htmlFor="email"
            style={{
              fontSize: "1.6rem",
              fontWeight: "bold",
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
              width: "140%",
              height: "5rem",
              border: "1px solid grey",
              borderRadius: "0.5rem",
              outline: "0",
              padding: "0.5rem 1rem",
            }}
            value={Email}
            onChange={(e) => {
              setEmail(e.target.value);
              setErrors({});
            }}
            required
          />
          {errors.email && (
            <span style={{ color: "red", marginTop: "1rem" }}>
              {errors.email}
            </span>
          )}
          <button
            type="submit"
            style={{
              border: "1px solid black",
              width: "140%",
              height: "5rem",
              borderRadius: "4rem",
              color: "white",
              background: "rgba(29,78,216)",
              marginTop: "5rem",
              fontWeight: "lighter",
              cursor: "pointer",
            }}
            onMouseOver={(e) => {
              e.target.style.background = "white";
              e.target.style.color = "rgba(29,78,216)";
              e.target.style.border = "1px solid rgba(29,78,216)";
            }}
            onMouseOut={(e) => {
              e.target.style.background = "rgba(29,78,216)";
              e.target.style.color = "white";
              e.target.style.border = "1px solid black";
            }}
          >
            Send OTP
          </button>
        </form>
      </div>

      {/* Reset Password Section */}
      <div
        style={{
          width: "40rem",
          height: "45rem",
          background: "rgba(255,255,255,0.7)",
          borderRadius: "2.5rem",
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "start",
        }}
      >
        <form
          onSubmit={handleResetPassword}
          style={{ width: "100%", padding: "5rem" }}
        >
          <div
            style={{
              color: "grey",
              fontSize: "1.5rem",
              marginBottom: "2rem",
              fontWeight: "lighter",
            }}
          >
            OTP will be send to your provided email address
          </div>
          <div
            style={{
              display: "flex",
              flexDirection: "column",
              justifyContent: "center",
              alignItems: "start",
              marginBottom: "1rem",
            }}
          >
            <label
              htmlFor="OTP"
              style={{ fontWeight: "bold", fontSize: "1.6rem" }}
            >
              One Time Password
            </label>
            <input
              type="tel"
              name="OTP"
              id="OTP"
              placeholder="Enter your OTP"
              style={{
                width: "30rem",
                height: "5rem",
                border: "1px solid grey",
                borderRadius: "0.5rem",
                outline: "0",
                fontSize: "1.6rem",
                padding: "0.5rem 1rem",
                letterSpacing: "0.1rem",
              }}
              value={Otp}
              onChange={(e) => {
                setOtp(e.target.value);
                setErrors({});
              }}
              required
            />
          </div>
          {errors.otp && (
            <span style={{ color: "red", marginTop: "1rem" }}>
              {errors.otp}
            </span>
          )}

          <div
            style={{
              display: "flex",
              justifyContent: "space-evenly",
              alignItems: "start",
              flexDirection: "column",
              marginTop: "3rem",
            }}
          >
            <label
              htmlFor="newPassword"
              style={{
                fontWeight: "bolder",
                fontSize: "1.6rem",
              }}
            >
              New Password
            </label>
            <input
              type="password"
              name="newPassword"
              id="newPassword"
              placeholder="Enter New Password"
              style={{
                width: "30rem",
                height: "5rem",
                border: "1px solid grey",
                borderRadius: "0.5rem",
                outline: "0",
                padding: "0.5rem 1rem",
              }}
              value={NewPassword}
              onChange={(e) => {
                setNewPassword(e.target.value);
                setErrors({});
              }}
              required
            />
            {errors.password && (
              <div
                style={{
                  color: "red",
                  fontSize: "1.2rem",
                  fontWeight: "300",
                  textAlign: "center",
                  marginTop: "2rem",
                }}
              >
                {errors.password}
              </div>
            )}
          </div>
          <button
            type="submit"
            style={{
              border: "1px solid rgba(29,78,216)",
              height: "5rem",
              borderRadius: "2.5rem",
              background: "rgba(29,78,216)",
              color: "white",
              marginTop: "4rem",
              fontWeight: "lighter",
              width: "100%",
              cursor: "pointer",
            }}
          >
            Reset Password
          </button>
        </form>
      </div>
    </div>
  );
};

export default ForgetPassword;
