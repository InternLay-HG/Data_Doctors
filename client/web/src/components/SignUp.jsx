import React, { useState, useEffect } from "react";
import Form from "../ui/Form";
import FormRow from "../ui/FormRow";
import Button from "../ui/Button";
import Input from "../ui/Input";
import { useNavigate } from "react-router";
import Authentication from "../api/Authentication";
export default function SignUp() {
  const navigate = useNavigate();
  const { RegisterCall } = Authentication();
  const [formData, setFormData] = useState({
    firstName: "",
    lastName: "",
    email: "",
    password: "",
    passwordConfirmation: "",
    phone: "",
    isHeathcareProvider: false,
  });

  const [errors, setErrors] = useState({});
  const [submitError, setSubmitError] = useState("");
  const [countryCode, setCountryCode] = useState("+91");
  useEffect(() => {
    if (localStorage.getItem("authtoken")) {
      navigate("/");
    }
  }, []);
  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.id]: e.target.value });
    setErrors({ ...errors, [e.target.id]: "" });
  };

  const handleCountryCodeChange = (e) => {
    setCountryCode(e.target.value);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    let newErrors = {};
    let hasErrors = false;

    // Required field validation
    for (let field in formData) {
      if (!formData[field]) {
        newErrors[field] = "This field is required";
        hasErrors = true;
      }
    }

    // Additional validations
    if (formData.password && formData.password.length < 8) {
      newErrors.password = "Password must be at least 8 characters long";
      hasErrors = true;
    }
    if (formData.password !== formData.passwordConfirmation) {
      newErrors.passwordConfirmation = "Passwords do not match";
      hasErrors = true;
    }
    if (formData.phone && formData.phone.length !== 10) {
      newErrors.phone = "Phone number must be exactly 10 digits";
      hasErrors = true;
    }
    if (hasErrors) {
      setErrors(newErrors);
      return;
    }
    setErrors({});
    const data = {
      firstName: formData.firstName,
      lastName: formData.lastName,
      mobileNumber: formData.phone,
      email: formData.email,
      password: formData.password,
      isHeathcareProvider: formData.isHeathcareProvider,
    };
    try {
      RegisterCall(data);
    } catch (err) {
      setSubmitError("Failed to register. Please try again.");
      console.error("Registration Error:", err);
    }
  };

  return (
    <>
      <style>
        {`
      .form-group {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    width: 100%;
}

.radio-form {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
}
    .radio_box {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: baseline;
    gap: 1rem;
}
.check-box{
    /* background-color: #0056b3; */
    width:20rem;
    text-align: center;
    font-size: small;
    padding: 10px;
    border:2px solid #0056b3;
    color: #0056b3;
    font-weight: bolder;
    border-radius: 5px; 
}
.check-box:hover{
    background-color: #0c3d71;
    color: white;
}
input[type="radio"]:checked + .check-box {
    background-color: #1173db;
    color: white;
}
      `}
      </style>
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
          className="flex flex-col justify-center mx-auto my-10 bg-neutral-900 w-[500px]"
        >
          <h1 className="text-center text-4xl font-semibold my-4">
            Create account
          </h1>
          <FormRow>
            <div className="form-group radio-form">
              <label>
                Purpose<span className="text-pink-500 text-3xl">*</span>
              </label>

              <div className="radio_box">
                <input
                  type="radio"
                  id="patient"
                  hidden
                  value="false"
                  checked={!formData.isHeathcareProvider}
                  onChange={() =>
                    setFormData({ ...formData, isHeathcareProvider: false })
                  }
                />
                <label htmlFor="patient" className="check-box">
                  Patient
                </label>
                <input
                  type="radio"
                  id="healthcare"
                  hidden
                  value="true"
                  checked={formData.isHeathcareProvider}
                  onChange={() =>
                    setFormData({ ...formData, isHeathcareProvider: true })
                  }
                />
                <label htmlFor="healthcare" className="check-box">
                  Health Care Provider
                </label>
              </div>
            </div>
          </FormRow>
          <FormRow>
            <div>
              <label htmlFor="firstName">
                <span className="mr-2 tracking-wide">First name</span>
                <span className="text-pink-500 text-3xl">*</span>
              </label>
              <Input
                type="text"
                id="firstName"
                value={formData.firstName}
                onChange={handleChange}
                className="w-full"
              />
              {errors.firstName && (
                <p className="text-red-500 text-lg font-light tracking-wider">
                  {errors.firstName}
                </p>
              )}
            </div>
            <div>
              <label htmlFor="lastName">
                <span className="mr-2 tracking-wide">Last name</span>
                <span className="text-pink-500 text-3xl">*</span>
              </label>
              <Input
                type="text"
                id="lastName"
                value={formData.lastName}
                onChange={handleChange}
                className="w-full"
              />
              {errors.lastName && (
                <p className="text-red-500 text-lg font-light tracking-wider">
                  {errors.lastName}
                </p>
              )}
            </div>
          </FormRow>
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

          <FormRow>
            <label htmlFor="passwordConfirmation">
              <span className="mr-2 tracking-wide">Confirm Password</span>
              <span className="text-pink-500 text-3xl">*</span>
            </label>
            <Input
              type="password"
              id="passwordConfirmation"
              value={formData.passwordConfirmation}
              onChange={handleChange}
            />
            {errors.passwordConfirmation && (
              <p className="text-red-500 text-lg font-light tracking-wider">
                {errors.passwordConfirmation}
              </p>
            )}
          </FormRow>

          <FormRow>
            <label htmlFor="phone">
              <span className="mr-2 tracking-wide">Phone</span>
              <span className="text-pink-500 text-3xl">*</span>
            </label>
            <div className="flex">
              <select
                value={countryCode}
                onChange={handleCountryCodeChange}
                className="p-2 mr-2 rounded-lg border border-gray-300"
              >
                <option value="+1">+1 (US)</option>
                <option value="+44">+44 (UK)</option>
                <option value="+91">+91 (IN)</option>
              </select>
              <Input
                type="text"
                id="phone"
                value={formData.phone}
                onChange={handleChange}
                className="w-full"
              />
            </div>
            {errors.phone && (
              <p className="text-red-500 text-lg font-light tracking-wider">
                {errors.phone}
              </p>
            )}
          </FormRow>

          {submitError && (
            <p className="text-red-500 text-lg font-light tracking-wider">
              {submitError}
            </p>
          )}

          <FormRow>
            <button
              className="hover:bg-blue-500/10 px-10 py-4 text-blue-700 rounded-lg"
              onClick={() => navigate("/login")}
              style={{
                border: "1px solid rgba(29,78,216,1)",
                marginTop: "1rem",
              }}
            >
              Sign in
            </button>
            <Button
              size="medium"
              type="submit"
              className="bg-blue-600 text-white hover:shadow-lg hover:bg-blue-800/90 rounded-lg"
              style={{ marginTop: "1rem" }}
            >
              Create account
            </Button>
          </FormRow>
        </Form>
      </div>
    </>
  );
}
