import { useNavigate } from "react-router-dom";
import Toast from "../ui/Toast";
const server_url = 'https://data-doctors-puce.vercel.app';

const useAuthentication = () => {
  const navigate = useNavigate()
  const { ToastFunc } = Toast();
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
        ToastFunc("info",res.message);
        navigate("/verifyotp");
      } else {
        ToastFunc("error",res.message);
      }
    } catch (error) {
      // console.error("Registration error:", error);
      ToastFunc("error",error.message);
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
        ToastFunc("success",res.message);
        navigate("/");
      } else {
        ToastFunc("error",res.message);
      }
    } catch (error) {
      console.error("OTP verification error:", error);
      ToastFunc("error",error.message);
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
        ToastFunc("success",res.message);
        localStorage.setItem("authtoken", res.token);
        navigate("/");
      } else {
        ToastFunc("error",res.message);
      }
    } catch (error) {
      console.error("Login error:", error);
      ToastFunc("error",error.message);
    }
  };

  const ForgetPasswordCall = async (data) => {
    try {
      const response = await fetch(`${server_url}/resetpassword`, {
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
        ToastFunc("success",res.message);
        navigate("/login");
      }else if(res.rescode === 1013){
        ToastFunc("info",res.message);
      } else {
        ToastFunc("error",res.message);
      }
    } catch (error) {
      console.error("Password reset error:", error);
      ToastFunc("error",error.message);
    }
  };

  return { RegisterCall, verifyOtpCall, LoginCall, ForgetPasswordCall };
};

export default useAuthentication;
