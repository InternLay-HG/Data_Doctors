import React, { useState } from "react";
import { Search } from "lucide-react";
import { X } from "lucide-react";

export default function SearchBar({ onSearch }) {
  const [searchTerm, setSearchTerm] = useState("");

  const handleChange = (event) => {
    const value = event.target.value;
    setSearchTerm(value);
    onSearch(value);
  };

  return (
    <div className="w-full border px-2 py-1 rounded-full flex items-center justify-center gap-2">
      <div className="py-3 px-4 hover:bg-gray-200 rounded-full">
        <Search />
      </div>
      <input
        className="w-full rounded-full rounded-l-none rounded-r-none py-2 px-2 tracking-wide"
        type="text"
        placeholder="Search"
        value={searchTerm}
        onChange={handleChange}
      />
      <div className="py-3 px-4 hover:bg-gray-200 rounded-full">
        <X />
      </div>
    </div>
  );
}
