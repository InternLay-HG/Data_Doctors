import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
import PageNotFound from "./components/PageNotFound";
import GlobalStyles from "./style/GlobalStyle";
import { Loader1, Loader2 } from "./ui/Loaders";
import { lazy, Suspense } from "react";

// Lazy-loaded components
const HeroLayout = lazy(() => import("./components/HeroLayout"));
const AppointmentScheduling = lazy(() =>
  import("./components/appointment/Schedule/AppointmentScheduling")
);
const UpcomingAppointment = lazy(() =>
  import("./components/appointment/Upcoming/UpcomingAppointment")
);
const PastAppointments = lazy(() =>
  import("./components/appointment/Past/PastAppointments")
);
const NotificationAndReminder = lazy(() =>
  import("./components/appointment/Notifications/NotificationAndReminder")
);
const CommunitySupport = lazy(() => import("./components/CommunitySupport"));
const Home = lazy(() => import("./components/Home"));
import Settings from "./components/Settings";
import SignUp from "./components/SignUp";
import Login from "./components/Login";
import ForgetPassword from "./components/ForgetPassword";
import OTPverifyPage from "./components/OTPverifyPage";

export default function App() {
  return (
    <>
      <BrowserRouter>
        <GlobalStyles />
        <Suspense fallback={<Loader1 />}>
          <Routes>
            <Route element={<HeroLayout />}>
              <Route index element={<Navigate replace to="home" />} />
              <Route
                path="home"
                element={
                  <Suspense fallback={<Loader2 />}>
                    <Home />
                  </Suspense>
                }
              />
              <Route
                path="appointment/schedule"
                element={
                  <Suspense fallback={<Loader2 />}>
                    <AppointmentScheduling />
                  </Suspense>
                }
              />
              <Route
                path="appointment/upcoming"
                element={
                  <Suspense fallback={<Loader2 />}>
                    <UpcomingAppointment />
                  </Suspense>
                }
              />
              <Route
                path="appointment/past"
                element={
                  <Suspense fallback={<Loader2 />}>
                    <PastAppointments />
                  </Suspense>
                }
              />
              <Route
                path="appointment/notifications"
                element={
                  <Suspense fallback={<Loader2 />}>
                    <NotificationAndReminder />
                  </Suspense>
                }
              />
              <Route
                path="community"
                element={
                  <Suspense fallback={<Loader2 />}>
                    <CommunitySupport />
                  </Suspense>
                }
              />
              <Route path="settings" element={<Settings />} />
            </Route>
            <Route path="login" element={<Login />} />
            <Route path="signup" element={<SignUp />} />
            <Route path="forgetpassword" element={<ForgetPassword />} />
            <Route path="verifyotp" element={<OTPverifyPage />} />
            <Route path="*" element={<PageNotFound />} />
          </Routes>
        </Suspense>
      </BrowserRouter>
    </>
  );
}
