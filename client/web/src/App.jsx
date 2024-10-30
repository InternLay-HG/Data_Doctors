import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
import { Suspense, lazy } from "react";
import GlobalStyles from "./style/GlobalStyle";
import { Loader1, Loader2 }  from "./ui/Loaders";

// Lazy-loaded components
const Dashboard = lazy(() => import("./components/Dashboard"));
const HeroLayout = lazy(() => import("./components/HeroLayout"));
const PageNotFound = lazy(() => import("./components/PageNotFound"));
const Appointment = lazy(() => import("./components/Appointment"));
const CommunitySupport = lazy(() => import("./components/CommunitySupport"));
const Settings = lazy(() => import("./components/Settings"));
const Home = lazy(() => import("./components/Home"));
import SignUp from "./components/SignUp";



export default function App() {
  return (
    <>
      <BrowserRouter>
        <GlobalStyles />
        <Suspense fallback={<Loader1/>}>
          <Routes>
            <Route element={<HeroLayout />}>
              <Route
                index
                element={<Navigate replace to="home" />}
              />
              <Route
                path="home"
                element={
                  <Suspense fallback={<Loader2/>}>
                    <Home />
                  </Suspense>
                }
              />
              <Route
                path="signup"
                element={
                  <Suspense fallback={<Loader2/>}>
                    <SignUp />
                  </Suspense>
                }
              />
              <Route
                path="dashboard"
                element={
                  <Suspense fallback={<Loader2/>}>
                    <Dashboard />
                  </Suspense>
                }
              />
              <Route
                path="appointment"
                element={
                  <Suspense fallback={<Loader2/>}>
                    <Appointment />
                  </Suspense>
                }
              />
              <Route
                path="community"
                element={
                  <Suspense fallback={<Loader2/>}>
                    <CommunitySupport />
                  </Suspense>
                }
              />
              <Route
                path="settings"
                element={
                  <Suspense fallback={<Loader2/>}>
                    <Settings />
                  </Suspense>
                }
              />
            </Route>
            <Route path="*" element={<PageNotFound />} />
          </Routes>
        </Suspense>
      </BrowserRouter>
    </>
  );
}
