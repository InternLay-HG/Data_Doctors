import React, { useState } from "react";
import { ChevronDown } from "lucide-react";

export default function Dropdown() {
  const [isOpen, setIsOpen] = useState(false);
  const [selectedOption, setSelectedOption] = useState("Type of scheduling");

  const options = [
    { value: "In-Person", label: "In-Person" },
    { value: "Telemedicine", label: "Telemedicine" },
  ];

  const toggleDropdown = () => {
    setIsOpen(!isOpen);
  };

  const handleOptionSelect = (option) => {
    setSelectedOption(option.value);
    setIsOpen(false);
  };

  return (
    <div>
      <button
        className="flex items-center justify-center gap-1 border w-[200px] py-4 rounded-full hover:shadow-lg text-2xl font-medium tracking-wide"
        onClick={toggleDropdown}
      >
        {selectedOption} <ChevronDown />
      </button>
      {isOpen && (
        <ul className="absolute bg-white rounded-xl w-[200px] shadow-lg px-5 py-4 text-2xl font-medium tracking-wider">
          {options.map((option) => (
            <li
              key={option.value}
              onClick={() => handleOptionSelect(option)}
              className="py-4 px-5 text-center hover:bg-gray-200 rounded-xl"
            >
              {option.label}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
