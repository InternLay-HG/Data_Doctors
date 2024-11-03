// AppointmentDetails.js
import React from "react";
import App from "../assets/App.jpg";

export default function AppointmentDetails({ appointment }) {
  if (!appointment) return <p>No appointment details available.</p>; // Optional: Fallback message if `appointment` is undefined

  return (
    <div>
      <h2 className="text-2xl font-bold">Appointment Details</h2>
      <p className="text-gray-800">Name: {appointment.name}</p>
      <p className="text-gray-800">Specialization: {appointment.specialization}</p>
      <p className="text-gray-800">Price: ${appointment.price} per session</p>
      {/* Add other fields you want to display */}
    </div>
  );
}
