import React, { useState, useEffect, useRef } from "react";
import { FaCaretDown } from "react-icons/fa";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import "./Filter.css";
import { IoMdCalendar } from "react-icons/io";

export default function FilterContainer({ onFilterUpdate }) {
  const [isOpen, setIsOpen] = useState(false);
  const [selectedOption, setSelectedOption] = useState("1 day");
  const [selectedDate, setSelectedDate] = useState(null);
  const [providerInput, setProviderInput] = useState("");
  const [filteredProviders, setFilteredProviders] = useState([]);
  const [selectedProvider, setSelectedProvider] = useState(null);

  const dropdownRef = useRef(null);
  const providerDropdownRef = useRef(null);

  const options = [
    { value: "1 day", label: "1 day" },
    { value: "3 day", label: "3 day" },
    { value: "1 week", label: "1 week" },
    { value: "2 weeks", label: "2 weeks" },
    { value: "1 month", label: "1 month" },
    { value: "2 months", label: "2 months" },
    { value: "6 months", label: "6 months" },
    { value: "1 year", label: "1 year" },
  ];

  const healthcareProviders = [
    { name: "Cardiology Consultation", specialization: "Heart Surgeon" },
    { name: "Dermatology Check-up", specialization: "Skin" },
    { name: "Physiotherapy Session", specialization: "Physical Therapy" },
    { name: "Mental Health Therapy", specialization: "Psychology" },
  ];

  const toggleDropdown = () => {
    setIsOpen(!isOpen);
  };

  const handleOptionSelect = (option) => {
    setSelectedOption(option.value);
    setSelectedDate(null); // Clear specific date if a range is selected
    setIsOpen(false);
  };

  const handleProviderInputChange = (e) => {
    const input = e.target.value;
    setProviderInput(input);
    setSelectedProvider(null);

    const filtered = healthcareProviders.filter((provider) =>
      provider.name.toLowerCase().includes(input.toLowerCase())
    );
    setFilteredProviders(filtered);
  };

  const selectProvider = (provider) => {
    setProviderInput(provider.name);
    setSelectedProvider(provider);
    setFilteredProviders([]);
  };

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (
        providerDropdownRef.current &&
        !providerDropdownRef.current.contains(event.target) &&
        dropdownRef.current &&
        !dropdownRef.current.contains(event.target)
      ) {
        setFilteredProviders([]);
        setIsOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  const handleClear = () => {
    setProviderInput("");
    setSelectedProvider(null);
    setSelectedDate(null);
    setSelectedOption("1 day");
    onFilterUpdate({
      provider: "",
      dateWithin: "1 day",
      selectedDate: null,
    });
  };

  const handleSearch = () => {
    onFilterUpdate({
      provider: providerInput,
      dateWithin: selectedOption || null, // Use range or null
      selectedDate: selectedDate || null, // Use date or null
    });
  };

  const handleDateChange = (date) => {
    setSelectedDate(date);
    setSelectedOption(null); // Clear the "Date within" option if specific date is selected
  };

  return (
    <div className="flex flex-col items-end justify-center gap-8 pt-5 pb-5">
      <div
        ref={providerDropdownRef}
        className="relative flex items-center justify-start gap-[52px] w-full"
      >
        <div className="text-[12px] text-gray-500">From</div>
        <input
          type="text"
          value={providerInput}
          onChange={handleProviderInputChange}
          className="border-b focus-within:border-b-blue-700 w-full p-0 text-[12px] font-thin tracking-wide"
          placeholder="Enter healthcare provider"
        />
        {providerInput && filteredProviders.length > 0 && (
          <ul className="absolute top-10 left-[80px] bg-white w-[250px] shadow-lg py-2 font-thin tracking-wider z-10">
            {filteredProviders.map((provider, index) => (
              <li
                key={index}
                className="cursor-pointer text-[12px] py-2 px-2 hover:bg-gray-200"
                onClick={() => selectProvider(provider)}
              >
                <div>{provider.name}</div>
                <span className="text-[11px] text-gray-500">
                  {provider.specialization}
                </span>
              </li>
            ))}
          </ul>
        )}
      </div>

      <div
        ref={dropdownRef}
        className="relative flex items-center justify-start gap-7 w-full"
      >
        <div className="text-[12px] text-gray-500">Date within</div>
        <div className="relative">
          <button
            className="flex items-center border-b justify-between gap-1 w-[250px] py-2 hover:bg-gray-100 focus-within:bg-gray-100 text-[12px] font-thin tracking-wide"
            aria-expanded={isOpen}
            aria-controls="date-options"
            onClick={toggleDropdown}
          >
            {selectedOption} <FaCaretDown />
          </button>
          {isOpen && (
            <ul className="absolute mt-2 bg-white w-[150px] shadow-lg py-4 text-[12px] font-thin tracking-wider">
              {options.map((option) => (
                <li
                  key={option.value}
                  onClick={() => handleOptionSelect(option)}
                  className="py-3 text-center font-thin hover:bg-gray-200 cursor-pointer"
                >
                  {option.label}
                </li>
              ))}
            </ul>
          )}
        </div>

        <div className="flex items-center justify-between">
          <DatePicker
            selected={selectedDate}
            onChange={(date) => setSelectedDate(date)}
            placeholderText="Select Date"
            className="border-b border-gray-300 focus-within:border-b-blue-700 w-[250px] text-[12px] font-medium tracking-wide"
            dateFormat="MMMM d, yyyy"
            calendarClassName="custom-datepicker"
          />
          <IoMdCalendar size={19} />
        </div>
      </div>

      <div className="flex items-center justify-between gap-2">
        <span
          className="font-medium tracking-wider text-blue-700 text-xl px-8 py-4 hover:bg-blue-100 rounded-full"
          onClick={handleClear}
        >
          Clear Filter
        </span>
        <button
          className="font-medium tracking-wider text-xl bg-blue-500 px-10 py-4 text-white rounded-full hover:opacity-90 hover:shadow-md"
          onClick={handleSearch}
        >
          Search
        </button>
      </div>
    </div>
  );
}
