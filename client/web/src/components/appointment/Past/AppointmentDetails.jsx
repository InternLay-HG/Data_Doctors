import React, { useState } from "react";
import User from "../../../assets/User.jpg";
import { ChevronDown, ChevronUp } from "lucide-react";
import { Check } from "lucide-react";

export default function AppointmentDetails({ appointment }) {
  const [openSection, setOpenSection] = useState(null);

  const toggleSection = (section) => {
    setOpenSection(openSection === section ? null : section);
  };

  return (
    <div className="w-full max-sm:ml-0 max-sm:mr-0 ml-2 mr-4 flex flex-col">
      {/* Appointment Header Section */}
      <div className="flex items-center justify-between mt-6">
        <img
          src={User}
          alt="Profile"
          className="w-60 h-60 max-sm:w-50 max-sm:h-50 mb-2 rounded-full object-cover"
        />
        <div>
          <h2 className="text-4xl max-sm:text-3xl font-semibold">
            {appointment.name}
          </h2>
          <h3 className="text-2xl font-medium text-end">
            {appointment.specialization}
          </h3>
          <h3 className="text-xl font-medium text-end tracking-wider">
            {appointment.degree}
          </h3>
        </div>
      </div>

      {/* Accordion Section: Appointment Details */}
      <div className="mt-6">
        <div
          className="flex items-center justify-between cursor-pointer py-5"
          onClick={() => toggleSection("details")}
        >
          <h3 className="text-3xl font-semibold cursor-pointer text-blue-700">
            Appointment Details
          </h3>
          {openSection === "details" ? (
            <ChevronUp className="text-blue-700" />
          ) : (
            <ChevronDown className="text-blue-700" />
          )}
        </div>
        <hr className="border-t-[3px]" />
        {openSection === "details" && (
          <div className="my-5">
            <div className="flex items-center justify-start gap-2 ">
              <Check className="text-green-700" />
              <h4 className="text-2xl font-semibold text-gray-600">
                Diagnosis / Condition Summary:
              </h4>
            </div>
            <p className="text-gray-700 text-xl tracking-wide px-11 pb-5">
              {appointment.diagnosis || "No diagnosis available."}
            </p>
            <div className="flex items-center justify-start gap-2 ">
              <Check className="text-green-700" />
              <h4 className="text-2xl font-semibold text-gray-600">
                Prescriptions and Treatments:
              </h4>
            </div>
            <p className="text-gray-700 text-xl tracking-wide px-11 pb-5">
              {appointment.diagnosis || "No prescriptions provided."}
            </p>
            <div className="flex items-center justify-start gap-2 ">
              <Check className="text-green-700" />
              <h4 className="text-2xl font-semibold text-gray-600">
                Instructions and Recommendations:
              </h4>
            </div>
            <p className="text-gray-700 text-xl tracking-wide px-11">
              {appointment.diagnosis || "No instructions available."}
            </p>
          </div>
        )}
      </div>

      {/* Accordion Section: Follow-Up and Next Steps */}
      <div className="mt-6">
        <div
          className="flex items-center justify-between cursor-pointer pb-5"
          onClick={() => toggleSection("followUp")}
        >
          <h3 className="text-3xl font-semibold cursor-pointer text-blue-700">
            Follow-Up and Next Steps
          </h3>
          {openSection === "followUp" ? (
            <ChevronUp className="text-blue-700" />
          ) : (
            <ChevronDown className="text-blue-700" />
          )}
        </div>
        <hr className="border-t-[3px]" />

        {openSection === "followUp" && (
          <div className="my-5">
            <div className="flex items-center justify-start gap-2 ">
              <Check className="text-green-700" />
              <h4 className="text-2xl font-semibold text-gray-600">
                Follow-Up Recommendation:
              </h4>
            </div>
            <p className="text-gray-700 text-xl tracking-wide px-11 pb-5">
              {appointment.diagnosis || "No follow-up needed."}
            </p>
            <div className="flex items-center justify-start gap-2 ">
              <Check className="text-green-700" />
              <h4 className="text-2xl font-semibold text-gray-600">
                Referral Details:
              </h4>
            </div>
            <p className="text-gray-700 text-xl tracking-wide px-11">
              {appointment.diagnosis || "No referrals provided."}
            </p>
          </div>
        )}
      </div>

      {/* Accordion Section: Supporting Documents and Links */}
      <div className="mt-6">
        <div
          className="flex items-center justify-between cursor-pointer pb-5"
          onClick={() => toggleSection("documents")}
        >
          <h3 className="text-3xl font-semibold cursor-pointer text-blue-700">
            Supporting Documents and Links
          </h3>
          {openSection === "documents" ? (
            <ChevronUp className="text-blue-700" />
          ) : (
            <ChevronDown className="text-blue-700" />
          )}
        </div>
        <hr className="border-t-[3px]" />

        {openSection === "documents" && (
          <div className="my-5">
            <div className="flex items-center justify-start gap-2 ">
              <Check className="text-green-700" />
              <h4 className="text-2xl font-semibold text-gray-600">
                Visit Documents:
              </h4>
            </div>
            <ul className="text-gray-700 text-xl tracking-wide px-11 list-disc=">
              {appointment.documents?.map((document, index) => (
                <li key={index}>
                  <a
                    href={document.link}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="hover:underline"
                  >
                    {document.name}
                  </a>
                </li>
              )) || "No documents available."}
            </ul>
            {appointment.telemedicineRecording && (
              <div className="mt-4">
                <h4 className="text-lg font-medium">Telemedicine Recording:</h4>
                <a
                  href={appointment.telemedicineRecording}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-blue-600 hover:underline"
                >
                  Access Recording
                </a>
              </div>
            )}
          </div>
        )}
      </div>

      <div className="mt-6">
        <h3 className="text-2xl font-semibold">Feedback</h3>
        <textarea
          className="mt-4 w-full p-3 border rounded-md text-xl"
          placeholder="Please share your experience."
        ></textarea>
      </div>

      {/* Confirm Booking Button */}
      <button className="py-5 px-10 ml-auto mt-6 hover:bg-blue-100 rounded-full text-2xl text-blue-700 font-medium">
        Submit Feedback
      </button>
    </div>
  );
}
