import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
import Dashboard from "./components/Dashboard";
import HeroLayout from "./components/HeroLayout";
import PageNotFound from "./components/PageNotFound";
import Appointment from "./components/Appointment";
import CommunitySupport from "./components/CommunitySupport";
import GlobalStyles from "./style/GlobalStyle";
import Settings from "./components/Settings";
import Home from "./components/Home";
import SignUp from "./components/SignUp";

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
            <Route path="dashboard" element={<Dashboard />} />
            <Route path="appointment" element={<Appointment />} />
            <Route path="community" element={<CommunitySupport />} />
            <Route path="settings" element={<Settings />} />
          </Route>
          <Route path="*" element={<PageNotFound />} />
        </Routes>
      </BrowserRouter>
    </>
  );
}
