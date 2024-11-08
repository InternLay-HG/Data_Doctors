import AppointmentScheduling from "./appointment/AppointmentScheduling";
import UpcomingAppointment from "./appointment/UpcomingAppointment";
import PastAppointment from "./appointment/PastAppointment";
import NotificationAndReminder from "./appointment/NotificationAndReminder";

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