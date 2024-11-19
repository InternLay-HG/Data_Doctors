import { useNavigate } from "react-router-dom";

const server_url = import.meta.env.VITE_SERVER_PORT;
const useAuthentication = () => {
  const navigate = useNavigate();

  const RegisterCall = async (data) => {
    try {
      const response = await fetch(`${server_url}/register`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      });

      if (!response.ok) {
        throw new Error("Failed to register. Please try again.");
      }

      const res = await response.json();
      if (res.status === "success") {
        alert("Registration successful. Please verify your email.");
        navigate("/verifyotp");
      } else {
        alert(res.message || "Registration failed.");
      }
    } catch (error) {
      console.error("Registration error:", error);
      alert(error.message);
    }
  };

  const verifyOtpCall = async (data) => {
    try {
      const response = await fetch(`${server_url}/verifyotp`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      });

      if (!response.ok) {
        throw new Error("Failed to verify OTP. Please try again.");
      }

      const res = await response.json();
      if (res.status === "success") {
        localStorage.setItem("authtoken", res.token);
        alert("OTP verification successful");
        navigate("/");
      } else {
        alert(res.message || "OTP verification failed.");
      }
    } catch (error) {
      console.error("OTP verification error:", error);
      alert(error.message);
    }
  };

  const LoginCall = async (data) => {
    try {
      const response = await fetch(`${server_url}/login`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      });

      if (!response.ok) {
        throw new Error("Failed to login. Please try again.");
      }

      const res = await response.json();
      if (res.status === "success") {
        alert("Login successful");
        localStorage.setItem("authtoken", res.token);
        navigate("/");
      } else {
        alert(res.message || "Login failed.");
      }
    } catch (error) {
      console.error("Login error:", error);
      alert(error.message);
    }
  };

  const ForgetPasswordCall = async (data) => {
    try {
      const response = await fetch(`${server_url}/forget-password`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      });

      if (!response.ok) {
        throw new Error("Failed to process password reset. Please try again.");
      }

      const res = await response.json();
      if (res.rescode === 1013) {
        alert("Password reset successful. Please log in.");
        navigate("/login");
      } else {
        alert(res.message || "Password reset failed.");
      }
    } catch (error) {
      console.error("Password reset error:", error);
      alert(error.message);
    }
  };

  return { RegisterCall, verifyOtpCall, LoginCall, ForgetPasswordCall };
};

export default useAuthentication;
