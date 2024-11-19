import { useState, useEffect } from "react";
import appointmentData from "./PastAppointmentData";
import {
  SlidersHorizontal,
  X,
  ChevronDown,
  CalendarDays,
  Clock,
} from "lucide-react";
import Popup from "./Popup";
import AppointmentDetails from "./AppointmentDetails";

export default function PastAppointments() {
  const [isFilterExpanded, setFilterExpanded] = useState(false);
  const [openDropdown, setOpenDropdown] = useState(null);

  const [isPopupVisible, setIsPopupVisible] = useState(false);
  const [selectedAppointment, setSelectedAppointment] = useState(null); // Store selected appointment data

  const handleBookNow = (appointment) => {
    setSelectedAppointment(appointment); // Set selected appointment data
    setIsPopupVisible(true); // Open popup
  };

  // States for each filter option
  const [selectedType, setSelectedType] = useState(null);
  const [selectedStatus, setSelectedStatus] = useState(null);
  const [selectedDateRange, setSelectedDateRange] = useState(null);
  const [selectedProvider, setSelectedProvider] = useState(null);

  const [providers, setProviders] = useState([]);

  // Toggle filter dropdown and reset filters when closing
  const toggleFilters = () => {
    if (isFilterExpanded) {
      // Reset filters when closing
      setSelectedType(null);
      setSelectedStatus(null);
      setSelectedDateRange(null);
      setSelectedProvider(null);
    }
    setFilterExpanded(!isFilterExpanded);
  };

  const toggleDropdown = (dropdown) => {
    setOpenDropdown((prev) => (prev === dropdown ? null : dropdown));
  };

  // Populate unique providers from appointment data
  useEffect(() => {
    const uniqueProviders = [
      ...new Set(appointmentData.map((appointment) => appointment.name)),
    ];
    setProviders(uniqueProviders);
  }, []);

  // Filter the appointments based on selected filters
  const filteredAppointments = appointmentData.filter((appointment) => {
    return (
      (!selectedType || appointment.mode === selectedType) &&
      (!selectedStatus || appointment.status === selectedStatus) &&
      (!selectedDateRange ||
        isDateInRange(appointment.date, selectedDateRange)) &&
      (!selectedProvider || appointment.name === selectedProvider)
    );
  });

  // Helper function to check if the date falls within the selected range
  const isDateInRange = (date, range) => {
    const today = new Date();
    const appointmentDate = new Date(date);
    if (range === "Today") {
      return appointmentDate.toDateString() === today.toDateString();
    } else if (range === "This Week") {
      const startOfWeek = new Date(today);
      startOfWeek.setDate(today.getDate() - today.getDay());
      const endOfWeek = new Date(startOfWeek);
      endOfWeek.setDate(startOfWeek.getDate() + 6);
      return appointmentDate >= startOfWeek && appointmentDate <= endOfWeek;
    } else if (range === "This Month") {
      return (
        appointmentDate.getMonth() === today.getMonth() &&
        appointmentDate.getFullYear() === today.getFullYear()
      );
    }
    return true;
  };

  const closePopup = () => {
    setIsPopupVisible(false); // Close popup when triggered
    setSelectedAppointment(null); // Reset selected appointment
  };

  return (
    <div className="mx-10 my-10 max-sm:mx-5">
      <h1 className="text-5xl font-bold tracking-wide py-10">
        Past Appointment
      </h1>

      <div
        className="flex items-center justify-start gap-4 border border-blue-700 cursor-pointer rounded-full py-4 px-5 w-[105px] hover:bg-blue-50"
        onClick={toggleFilters}
      >
        {isFilterExpanded ? (
          <X size={16} className="text-blue-700" />
        ) : (
          <SlidersHorizontal size={16} className="text-blue-700" />
        )}
        <span className="text-2xl tracking-wider text-blue-700">Filters</span>
      </div>

      {isFilterExpanded && (
        <div className="mt-5 flex gap-5 relative">
          {/* Filter dropdowns */}
          {/* Type of Appointment */}
          <div className="relative">
            <button
              onClick={() => toggleDropdown("appointmentType")}
              className="flex items-center justify-center gap-1 border w-full px-5 py-4 rounded-full hover:shadow-lg text-2xl font-medium tracking-wide"
            >
              <span>Type of Appointment</span>
              <ChevronDown />
            </button>
            {openDropdown === "appointmentType" && (
              <ul className="absolute bg-white rounded-xl w-full shadow-lg py-4 px-4 text-2xl mt-1 font-medium tracking-wider z-10">
                <li
                  onClick={() => setSelectedType("In-Person")}
                  className="py-4 px-4 text-center hover:bg-gray-200 rounded-xl cursor-pointer"
                >
                  In-Person
                </li>
                <li
                  onClick={() => setSelectedType("Telemedicine")}
                  className="py-4 px-4 text-center hover:bg-gray-200 rounded-xl cursor-pointer"
                >
                  Telemedicine
                </li>
              </ul>
            )}
          </div>

          {/* Appointment Status */}
          <div className="relative">
            <button
              onClick={() => toggleDropdown("status")}
              className="flex items-center justify-center gap-1 border w-full px-5 py-4 rounded-full hover:shadow-lg text-2xl font-medium tracking-wide"
            >
              <span>Appointment Status</span>
              <ChevronDown />
            </button>
            {openDropdown === "status" && (
              <ul className="absolute bg-white rounded-xl w-full shadow-lg py-4 px-4 text-2xl mt-1 font-medium tracking-wider z-10">
                <li
                  onClick={() => setSelectedStatus("Completed")}
                  className="py-4 px-4 text-center hover:bg-gray-200 rounded-xl cursor-pointer"
                >
                  Completed
                </li>
                <li
                  onClick={() => setSelectedStatus("Follow-up Needed")}
                  className="py-4 px-4 text-center hover:bg-gray-200 rounded-xl cursor-pointer"
                >
                  Follow-up Needed
                </li>
                <li
                  onClick={() => setSelectedStatus("No-show")}
                  className="py-4 px-4 text-center hover:bg-gray-200 rounded-xl cursor-pointer"
                >
                  No-show
                </li>
              </ul>
            )}
          </div>

          {/* Date Range */}
          <div className="relative">
            <button
              onClick={() => toggleDropdown("dateRange")}
              className="flex items-center justify-center gap-1 border w-full px-4 py-4 rounded-full hover:shadow-lg text-2xl font-medium tracking-wide"
            >
              <span>Date Range</span>
              <ChevronDown />
            </button>
            {openDropdown === "dateRange" && (
              <ul className="absolute bg-white rounded-xl w-full shadow-lg py-4 px-4 text-2xl mt-1 font-medium tracking-wider z-10">
                <li
                  onClick={() => setSelectedDateRange("Today")}
                  className="py-4 px-4 text-center hover:bg-gray-200 rounded-xl cursor-pointer"
                >
                  Today
                </li>
                <li
                  onClick={() => setSelectedDateRange("This Week")}
                  className="py-4 px-4 text-center hover:bg-gray-200 rounded-xl cursor-pointer"
                >
                  This Week
                </li>
                <li
                  onClick={() => setSelectedDateRange("This Month")}
                  className="py-4 px-4 text-center hover:bg-gray-200 rounded-xl cursor-pointer"
                >
                  This Month
                </li>
              </ul>
            )}
          </div>

          {/* Healthcare Provider */}
          <div className="relative">
            <button
              onClick={() => toggleDropdown("healthcareProvider")}
              className="flex items-center justify-center gap-1 border w-full px-4 py-4 rounded-full hover:shadow-lg text-2xl font-medium tracking-wide"
            >
              <span>Healthcare Provider</span>
              <ChevronDown />
            </button>
            {openDropdown === "healthcareProvider" && (
              <ul className="absolute bg-white rounded-xl w-full shadow-lg py-4 px-4 text-2xl mt-1 font-medium tracking-wider z-10">
                {providers.map((provider, index) => (
                  <li
                    key={index}
                    onClick={() => setSelectedProvider(provider)}
                    className="py-4 px-4 text-center hover:bg-gray-200 rounded-xl cursor-pointer"
                  >
                    {provider}
                  </li>
                ))}
              </ul>
            )}
          </div>
        </div>
      )}

      <div className="flex flex-col items-start justify-start w-full gap-10 my-10">
        {filteredAppointments.length === 0 ? (
          <p className="text-xl text-gray-500">No appointments found.</p>
        ) : (
          filteredAppointments.map((result, index) => (
            <div
              key={index}
              className="hover:bg-gray-100 shadow-md cursor-pointer rounded-xl px-4 py-2 text-xl border border-l-transparent border-r-transparent border-t-transparent border-b-gray-200 w-full"
            >
              <div className="flex flex-col items-start justify-center text-xl text-gray-500 gap-2">
                <div className="flex items-center justify-between w-full">
                  <div className="flex items-center justify-start gap-2">
                    <CalendarDays size={17} />
                    <h4>{result.date}</h4>
                  </div>
                  <div className="text-gray-700 font-medium tracking-wide">
                    {result.mode}
                    {result.mode === "Telemedicine" ? (
                      <> | {result.telemedicine}</>
                    ) : null}
                  </div>
                </div>
                <div className="flex items-center justify-start gap-2">
                  <Clock size={17} />
                  <h4>{result.timing}</h4>
                </div>
              </div>

              <div className="flex items-center justify-between w-full my-3">
                <h1 className="text-4xl font-semibold">{result.name}</h1>
                <div
                  className={`border rounded-xl px-5 py-3 text-center mb-3 tracking-wide ${
                    result.status === "Completed"
                      ? "bg-green-100 text-green-700"
                      : result.status === "No-show"
                      ? "bg-red-100 text-red-700"
                      : "bg-yellow-100 text-yellow-700"
                  }`}
                >
                  {result.status}
                </div>
              </div>
              <div className="flex items-center justify-start w-full mb-5">
                <button
                  onClick={() => handleBookNow(result)} // Pass the appointment data
                  className="hover:bg-blue-100 rounded-lg px-6 py-3 text-blue-700 font-medium tracking-wide"
                >
                  View Summary
                </button>
              </div>
            </div>
          ))
        )}
      </div>
      {isPopupVisible && (
        <Popup onClose={closePopup}>
          <AppointmentDetails appointment={selectedAppointment} />
        </Popup>
      )}
    </div>
  );
}
