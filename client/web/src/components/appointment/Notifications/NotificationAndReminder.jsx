import { useState } from "react";
import SearchBar from "./SearchBarNotification";
import FilterContainer from "./FilterContainer";
import notificationData from "./NotificationAndReminderDate";
import { Clock } from "lucide-react";
import { MailOpen } from "lucide-react";

export default function NotificationAndReminder() {
  const [isFilterOpen, setIsFilterOpen] = useState(false);
  const [searchTerm, setSearchTerm] = useState("");
  const [filters, setFilters] = useState({
    provider: "",
    dateWithin: "",
    selectedDate: null,
  });

  const toggleFilter = () => {
    setIsFilterOpen((prev) => !prev);
  };

  const handleSearch = (term) => {
    setSearchTerm(term.toLowerCase());
  };

  const handleFilterUpdate = (newFilters) => {
    setFilters(newFilters);
  };

  // Filter notifications based on search term and filters
  const filteredNotifications = notificationData.filter((notification) => {
    const matchesSearch =
      !searchTerm ||
      notification.name.toLowerCase().includes(searchTerm) ||
      notification.date.toLowerCase().includes(searchTerm) ||
      notification.timing.toLowerCase().includes(searchTerm);

    const matchesProvider =
      !filters.provider ||
      notification.provider
        ?.toLowerCase()
        .includes(filters.provider.toLowerCase());

    const matchesDateWithin =
      !filters.dateWithin || // Add your date within logic if necessary
      true;

    const matchesSelectedDate =
      !filters.selectedDate ||
      new Date(notification.date).toDateString() ===
        new Date(filters.selectedDate).toDateString();

    return (
      matchesSearch &&
      matchesProvider &&
      matchesDateWithin &&
      matchesSelectedDate
    );
  });

  return (
    <div className="mx-10 my-12 relative max-sm:mx-5">
      <h1 className="text-5xl font-bold tracking-wide py-10">
        Notifications & Reminders
      </h1>
      <SearchBar onSearch={handleSearch} onFilterToggle={toggleFilter} />
      {isFilterOpen && (
        <div className="absolute w-2/3 max-md:w-full bg-white border px-12 shadow-lg py-4">
          <FilterContainer onFilterUpdate={handleFilterUpdate} />
        </div>
      )}
      <div className="flex flex-col items-start justify-start w-full my-10 border rounded-3xl">
        {filteredNotifications.length > 0 ? (
          <>
            {filteredNotifications.map((notification, index) => {
              const isFirst = index === 0;
              const isLast = index === filteredNotifications.length - 1;

              const borderRadiusClasses = isFirst
                ? "rounded-t-3xl"
                : isLast
                ? "rounded-b-3xl"
                : "rounded-none";

              return (
                <div
                  key={index}
                  className={`hover:bg-gray-100 cursor-pointer px-4 py-3 text-xl border border-l-transparent border-r-transparent border-t-transparent border-b-gray-200 w-full ${borderRadiusClasses}`}
                >
                  <div className="flex items-center justify-between">
                    <div className="flex items-center justify-start gap-1 text-[12px]">
                      <p className="text-gray-600">{notification.date},</p>
                      <p className="text-gray-600">{notification.timing}</p>
                    </div>
                    <p
                      className={`text-xl font-medium px-8 py-3 rounded-3xl ${statusColor(
                        notification.status
                      )}`}
                    >
                      {notification.status}
                    </p>
                  </div>
                  <div className="flex items-center justify-between">
                    <div className="flex flex-col gap-2 my-1">
                      <h2 className="text-xl font-semibold">
                        {notification.name}
                      </h2>
                      <p>
                        Upcoming Appointment with {notification.name} on{" "}
                        {notification.date} at {notification.timing}
                      </p>
                    </div>
                    <div className="flex items-center justify-center gap-10">
                      <div className="relative group hover:bg-gray-200 rounded-full p-3">
                        <MailOpen
                          size={18}
                          className="cursor-pointer text-gray-500 "
                        />
                        <span className="absolute left-1/2 transform -translate-x-1/2 w-[84px] top-full mt-2 bg-gray-600 text-white text-[10px] rounded py-1 px-2 opacity-0 group-hover:opacity-100 transition-opacity tracking-wider">
                          Mark as Read
                        </span>
                      </div>
                      <div className="relative group hover:bg-gray-200 rounded-full p-3">
                        <Clock
                          size={18}
                          className="cursor-pointer text-gray-500"
                        />
                        <span className="absolute left-1/2 transform -translate-x-1/2 w-[48px] top-full mt-2 bg-gray-600 hover:bg-gray-500 text-white text-[10px] rounded py-1 px-2 opacity-0 group-hover:opacity-100 transition-opacity tracking-wider">
                          Snooze
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              );
            })}
          </>
        ) : (
          <p className="text-center w-full text-gray-600 py-6">
            No notifications found
          </p>
        )}
      </div>
    </div>
  );
}

function statusColor(status) {
  switch (status) {
    case "Booked":
      return "text-green-500 bg-green-100";
    case "Canceled":
      return "text-red-500 bg-red-100";
    case "Rescheduled":
      return "text-yellow-500 bg-yellow-100";
    default:
      return "text-gray-500";
  }
}
