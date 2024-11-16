import { useState } from "react";
import Dropdown from "./Dropdown";
import SearchBar from "./SearchBar";
import appointmentData from "../AppointmentData";
import Appointment_Schedule from "../../../assets/Appointment_Schedule.jpg";
import { CiHeart } from "react-icons/ci";
import { LuDot } from "react-icons/lu";
import AppointmentDetails from "./AppointmentDetails";
import Popup from "./Popup";
export default function AppointmentScheduling() {
  const [searchResults, setSearchResults] = useState(
    appointmentData.map((appointment) => ({
      ...appointment,
      isFavorite: false,
    }))
  );
  const [isPopupVisible, setIsPopupVisible] = useState(false);
  const [selectedAppointment, setSelectedAppointment] = useState(null);

  const handleSearch = (searchText) => {
    const filteredResults = appointmentData.filter((appointment) => {
      const nameMatch = appointment.name
        .toLowerCase()
        .includes(searchText.toLowerCase());
      const categoryMatch = appointment.specialization
        .toLowerCase()
        .includes(searchText.toLowerCase());
      return nameMatch || categoryMatch;
    });
    setSearchResults(filteredResults);
  };

  const toggleFavorite = (index) => {
    const updatedResults = [...searchResults];
    updatedResults[index].isFavorite = !updatedResults[index].isFavorite;
    setSearchResults(updatedResults);
  };

  const handleBookNow = (appointment) => {
    setSelectedAppointment(appointment);
    setIsPopupVisible(true);
  };

  const closePopup = () => {
    setIsPopupVisible(false);
    setSelectedAppointment(null);
  };

  return (
    <div className="mx-10 my-12">
      <h1 className="text-5xl font-bold tracking-wide py-10">
        Schedule your appointment
      </h1>
      <div className="flex justify-between items-center mx-auto mt-5 mb-10 gap-5">
        <Dropdown />
        <SearchBar onSearch={handleSearch} />
      </div>
      {searchResults.length > 0 ? (
        <div className="flex items-start justify-start flex-wrap gap-10 w-full">
          {searchResults.map((result, index) => (
            <div
              key={index}
              className="px-10 py-8 w-1/4 hover:shadow border rounded-3xl"
            >
              <div className="flex flex-col justify-start items-center gap-10">
                <div className="flex items-start justify-between w-full">
                  <div className="flex items-center justify-center gap-2">
                    <div className="flex items-center justify-between gap-2 border rounded-full px-5 py-2">
                      <p>{result.ratings}</p>⭐
                    </div>
                    <p className="text-xl tracking-wide">
                      ({result.reviews} Reviews)
                    </p>
                  </div>
                  <button
                    className={
                      result.isFavorite ? "text-red-500" : "text-gray-500"
                    }
                    onClick={() => toggleFavorite(index)}
                  >
                    <CiHeart size={30} />
                  </button>
                </div>
                <div className="flex flex-col items-start justify-center w-full mb-5">
                  <p className="text-xl tracking-wide">
                    {result.specialization}
                  </p>
                  <h2 className="text-3xl font-semibold">{result.name}</h2>
                </div>
              </div>
              <div className="flex items-end justify-start mb-5">
                <p className="font-semibold tracking-wide">${result.price}</p>{" "}
                <span className="text-xl">/session</span>
              </div>
              <div className="flex flex-col gap-10">
                <div className="flex flex-col items-start justify-center w-full">
                  <p className="flex items-center justify-center text-xl font-medium tracking-wide">
                    Availability
                    <LuDot size={20} />
                    {result.slots} slots
                  </p>
                  <button>Date & Time picker</button>
                </div>
                <div className="bg-gradient-to-r from-blue-400 to-blue-700 p-1 rounded-full transition ease-in-out hover:scale-110 duration-300">
                  <button
                    className="py-5 px-12 w-full hover:bg-gradient-to-r hover:from-blue-400 hover:to-blue-700 hover:text-white bg-white rounded-full text-2xl font-medium uppercase tracking-wider"
                    onClick={() => handleBookNow(result)}
                  >
                    Book Now
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      ) : (
        <div className="flex flex-col justify-center items-center">
          <img
            className="w-1/3"
            src={Appointment_Schedule}
            alt="Appointment illustration"
          />
          <h1 className="text-2xl tracking-wider w-1/3 text-center">
            Book a convenient time to discuss your needs with our experts.
          </h1>
        </div>
      )}

      {isPopupVisible && (
        <Popup onClose={closePopup}>
          <AppointmentDetails appointment={selectedAppointment} />
        </Popup>
      )}
    </div>
  );
}
