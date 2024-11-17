import React, { useState } from "react";
import Form from "../ui/Form";
import FormRow from "../ui/FormRow";
import Button from "../ui/Button";
import Input from "../ui/Input";
import { GoogleLogin } from "@react-oauth/google";

export default function SignUp() {
  const [formData, setFormData] = useState({
    firstName: "",
    lastName: "",
    email: "",
    password: "",
    passwordConfirmation: "",
    phone: "",
  });

  const [errors, setErrors] = useState({});
  const [submitError, setSubmitError] = useState("");
  const [countryCode, setCountryCode] = useState("+91");

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.id]: e.target.value });
    setErrors({ ...errors, [e.target.id]: "" });
  };

  const handleCountryCodeChange = (e) => {
    setCountryCode(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    let newErrors = {};

    // Required field validation
    for (let field in formData) {
      if (!formData[field]) {
        newErrors[field] = "This field is required";
        setErrors(newErrors);
        return;
      }
    }

    // Password length validation
    if (formData.password && formData.password.length < 8) {
      newErrors.password = "Password must be at least 8 characters long";
    }

    // Confirm password match validation
    if (formData.password !== formData.passwordConfirmation) {
      newErrors.passwordConfirmation = "Passwords do not match";
    }

    // Phone length validation (excluding country code)
    if (formData.phone && formData.phone.length !== 10) {
      newErrors.phone = "Phone number must be exactly 10 digits";
    }

    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors);
      return;
    }

    setErrors({});
    console.log("Form submitted", {
      ...formData,
      phone: `${countryCode} ${formData.phone}`,
    });
  };

  const handleGoogleLoginSuccess = (credentialResponse) => {
    // Handle the credential response here
    console.log(credentialResponse);
  };

  return (
    <Form
      onSubmit={handleSubmit}
      className="flex flex-col justify-center mx-auto my-10 bg-neutral-900 w-[500px] py-4"
    >
      <h1 className="text-center text-4xl font-semibold my-4">
        Create account
      </h1>

      {/* <div className="my-6 text-center">
        <GoogleLogin
          onSuccess={handleGoogleLoginSuccess}
          onError={() => console.log("Login failed")}
        />
      </div> */}

      {/* <div className="flex items-center my-4">
        <hr className="flex-grow border-t border-gray-300" />
        <span className="mx-4 text-2xl font-light">or</span>
        <hr className="flex-grow border-t border-gray-300" />
      </div> */}

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
        >
          Sign in
        </button>
        <Button
          size="medium"
          type="submit"
          className="bg-blue-600 text-white hover:shadow-lg hover:bg-blue-800/90 rounded-lg"
        >
          Create account
        </Button>
      </FormRow>
    </Form>
  );
}