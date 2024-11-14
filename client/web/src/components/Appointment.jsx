import AppointmentScheduling from "./appointment/Schedule/AppointmentScheduling";
import UpcomingAppointment from "./appointment/Upcoming/UpcomingAppointment";
import PastAppointment from "./appointment/Past/PastAppointments";
import NotificationAndReminder from "./appointment/Notifications/NotificationAndReminder";

export default function Appointment() {
  return (
    <>
      <AppointmentScheduling />
      <UpcomingAppointment />
      <PastAppointment />
      <NotificationAndReminder />
    </>
  );
}
