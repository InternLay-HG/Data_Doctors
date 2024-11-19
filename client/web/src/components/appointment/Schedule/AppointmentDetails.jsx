import React, { useState } from "react";
import User from "../../../assets/User.jpg";
import { Mic } from "lucide-react";

export default function AppointmentDetails({ appointment }) {
  const [diseaseDetails, setDiseaseDetails] = useState("");

  // Function to handle voice input
  const handleVoiceInput = () => {
    if (!("webkitSpeechRecognition" in window)) {
      alert("Voice recognition is not supported in this browser.");
      return;
    }

    const recognition = new window.webkitSpeechRecognition();
    recognition.lang = "en-US";
    recognition.continuous = false;
    recognition.interimResults = false;

    recognition.onresult = (event) => {
      const transcript = event.results[0][0].transcript;
      setDiseaseDetails((prev) => prev + " " + transcript);
    };

    recognition.onerror = (event) => {
      console.error("Voice recognition error", event.error);
    };

    recognition.start();
  };

  return (
    <div className="w-full ml-2 mr-4 max-sm:ml-0 max-sm:mr-0 flex flex-col">
      <div className="flex items-center justify-between mt-6">
        <img
          src={User}
          alt="Profile"
          className="w-60 h-60 mb-2 rounded-full object-cover"
        />
        <div>
          <h2 className="text-4xl max-sm:text- font-semibold">{appointment.name}</h2>
          <h3 className="text-2xl max-sm:text-xl font-thin text-end max-sm:text-start">
            {appointment.specialization}
          </h3>
          <h3 className="text-xl font-medium text-end max-sm:text-start tracking-wider">
            {appointment.degree}
          </h3>
          <h3 className="text-xl font-medium text-end max-sm:text-start tracking-wide">
            ({appointment.experience} years)
          </h3>
        </div>
      </div>

      {/* Disease Details Input Field with Voice Option */}
      <div className=" flex items-center ml-4 max-sm:ml-0">
        <textarea
          value={diseaseDetails}
          onChange={(e) => setDiseaseDetails(e.target.value)}
          placeholder="Enter details about your condition or symptoms"
          className="w-11/12 border border-gray-300 rounded-full py-7 max-sm:py-4 px-8 max-sm:px-7 text-xl resize-none"
        />
        <div
          onClick={handleVoiceInput}
          className="py-4 px-4 bg-gray-200 hover:bg-gray-300 rounded-full text-lg ml-4"
        >
          <Mic />
        </div>
      </div>

      <button className="py-5 px-10 mx-auto mt-6 hover:bg-green-500/10 rounded-full text-[#fff] bg-gradient-to-r from-blue-400 to-blue-700 text-2xl font-medium transition ease-in-out hover:scale-110 duration-300 uppercase tracking-wider">
        Confirm Booking
      </button>
    </div>
  );
}
