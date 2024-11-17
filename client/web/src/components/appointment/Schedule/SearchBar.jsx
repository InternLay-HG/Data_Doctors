import React, { useState } from "react";
import { IoMdSearch } from "react-icons/io";
import { X } from "lucide-react";

export default function SearchBar({ onSearch }) {
  const [searchTerm, setSearchTerm] = useState("");

  const handleChange = (event) => {
    const value = event.target.value;
    setSearchTerm(value);
    onSearch(value);
  };

  return (
    <div className="w-full border p-2 rounded-full flex items-center justify-center gap-2 focus-within:shadow-md">
      <div className="p-3 hover:bg-gray-200 rounded-full">
        <IoMdSearch size={23} />
      </div>
      <input
        className="w-full rounded-full rounded-l-none rounded-r-none p-2 tracking-wide text-2xl"
        type="text"
        placeholder="Search"
        value={searchTerm}
        onChange={handleChange}
      />
      <div className="p-3 hover:bg-gray-200 rounded-full">
        <X />
      </div>
    </div>
  );
}
