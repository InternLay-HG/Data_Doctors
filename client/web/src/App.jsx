import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
import Dashboard from "./components/Dashboard";
import HeroLayout from "./components/HeroLayout";
import PageNotFound from "./components/PageNotFound";
import CommunitySupport from "./components/CommunitySupport";
import GlobalStyles from "./style/GlobalStyle";
import Settings from "./components/Settings";
import Home from "./components/Home";
import SignUp from "./components/SignUp";
import Login from "./components/Login";
import AppointmentScheduling from "./components/appointment/Schedule/AppointmentScheduling";
import UpcomingAppointment from "./components/appointment/Upcoming/UpcomingAppointment";
import PastAppointments from "./components/appointment/Past/PastAppointments";
import NotificationAndReminder from "./components/appointment/Notifications/NotificationAndReminder";

export default function App() {
  return (
    <>
      <BrowserRouter>
        <GlobalStyles />
        <Routes>
          <Route element={<HeroLayout />}>
            <Route index element={<Navigate replace to="home" />} />
            <Route path="home" element={<Home />} />
            <Route path="signup" element={<SignUp />} />
            <Route path="login" element={<Login />} />
            <Route path="dashboard" element={<Dashboard />} />
            <Route path="appointment" element={<AppointmentScheduling />} />
            <Route
              path="appointment/schedule"
              element={<AppointmentScheduling />}
            />
            <Route
              path="appointment/upcoming"
              element={<UpcomingAppointment />}
            />
            <Route path="appointment/past" element={<PastAppointments />} />
            <Route
              path="appointment/notifications"
              element={<NotificationAndReminder />}
            />
            <Route path="community" element={<CommunitySupport />} />
            <Route path="settings" element={<Settings />} />
          </Route>
          <Route path="*" element={<PageNotFound />} />
        </Routes>
      </BrowserRouter>
    </>
  );
}
