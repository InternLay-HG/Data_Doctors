import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router";
import { Link } from "react-router-dom";
import Form from "../ui/Form";
import FormRow from "../ui/FormRow";
import Button from "../ui/Button";
import Input from "../ui/Input";
import Authentication from "../api/Authentication";
import Toast from "../ui/Toast";
export default function SignUp() {
  const { ToastFunc } = Toast();
  const { LoginCall } = Authentication();
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });
  const [errors, setErrors] = useState({});
  const [submitError, setSubmitError] = useState("");
  useEffect(() => {
    if (localStorage.getItem("authtoken")) {
      navigate("/");
    }
  }, []);
  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.id]: e.target.value });
    setErrors({ ...errors, [e.target.id]: "" });
  };

  const handleSubmit =async (e) => {
    e.preventDefault();
    let newErrors = {};
    // Required field validation
    for (let field in formData) {
      if (formData[field] === undefined) {
        newErrors[field] = "This field is required";
        return;
      }
    }
    if (formData.password && formData.password.length < 8) {
      newErrors.password = "Password must be at least 8 characters long";
    }
    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors);
      return;
    } 
    setErrors({});
    try {
      await LoginCall(formData);
    } catch (err) {
      setSubmitError("Failed to Login. Please try again.");
      ToastFunc("error",err.message);
    }   
  };

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        height: "100vh",
        background:
          "linear-gradient(90deg, rgba(174,190,236,1) 0%, rgba(255,255,255,1) 100%)",
      }}
    >
      <Form
        onSubmit={handleSubmit}
        className="flex flex-col justify-center mx-auto my-14 bg-neutral-900 w-[400px]"
      >
        <h1 className="text-center text-4xl font-semibold tracking-tight my-10">
          Sign in
        </h1>

        <div className="flex items-center mt-10">
          <hr className="flex-grow border-t border-gray-300" />
        </div>

        <FormRow>
          <label htmlFor="email">
            <span className="mr-2 tracking-wide">Email</span>
            <span className="text-pink-500 text-3xl">*</span>
          </label>
          <Input
            type="email"
            id="email"
            value={formData.email}
            onChange={handleChange}
          />
          {errors.email && (
            <p className="text-red-500 text-lg font-light tracking-wider">
              {errors.email}
            </p>
          )}
        </FormRow>

        <FormRow>
          <label htmlFor="password">
            <span className="mr-2 tracking-wide">Password</span>
            <span className="text-pink-500 text-3xl">*</span>
          </label>
          <Input
            type="password"
            id="password"
            value={formData.password}
            onChange={handleChange}
          />
          {errors.password && (
            <p className="text-red-500 text-lg font-light tracking-wider">
              {errors.password}
            </p>
          )}
        </FormRow>

        {submitError && (
          <p className="text-red-500 text-lg font-light tracking-wider">
            {submitError}
          </p>
        )}

        <Link
          to="/forgetpassword"
          className="text-blue-700 underline ml-auto"
          style={{ marginBottom: "2rem" }}
        >
          Forgot password?
        </Link>

        {/* <div className="flex items-center justify-start gap-1 mb-10">
        <input type="checkbox" />
        <span className="font-semibold text-xl tracking-tight">
          Remember me
        </span>
      </div> */}

        <FormRow>
          <Button
            type="reset"
            size="medium"
            className=" hover:bg-blue-100 rounded-full bg-white"
            style={{ color: "rgba(29,78,216)" }}
            onClick={() => {
              navigate("/signup");
            }}
          >
            Create account
          </Button>
          <button
            // size="medium"
            type="submit"
            className="px-10 py-4 font-light text-2xl bg-blue-700 rounded-full text-white hover:bg-blue-800 hover:shadow-lg"
          >
            Sign in
          </button>
        </FormRow>
      </Form>
    </div>
  );
}
