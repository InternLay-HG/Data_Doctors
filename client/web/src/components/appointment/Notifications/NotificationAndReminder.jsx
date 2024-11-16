import { useState } from "react";
import SearchBar from "./SearchBarNotification";
import FilterContainer from "./FilterContainer";

export default function NotificationAndReminder() {
  const [isFilterOpen, setIsFilterOpen] = useState(false);

  const toggleFilter = () => {
    setIsFilterOpen((prev) => !prev);
  };

  return (
    <div className="mx-10 w-10/12 my-12 relative">
      <h1 className="text-5xl font-bold tracking-wide py-10">
        Notifications & Reminders
      </h1>
      <SearchBar onFilterToggle={toggleFilter} />
      {isFilterOpen && (
        <div className="absolute w-2/3 bg-white border px-12 shadow-lg py-4">
          <FilterContainer />
        </div>
      )}
    </div>
  );
}
