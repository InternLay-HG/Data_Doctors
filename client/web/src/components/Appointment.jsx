import AppointmentScheduling from "../appointment/AppointmentScheduling";
import NotificationAndReminder from "../appointment/NotificationAndReminder";
import PastAppointment from "../appointment/PastAppointment";
import UpcomingAppointment from "../appointment/UpcomingAppointment";

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
