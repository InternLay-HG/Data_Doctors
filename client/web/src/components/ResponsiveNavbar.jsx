import { Link, NavLink, useLocation } from "react-router-dom";
import styled from "styled-components";
import { HiOutlineHome } from "react-icons/hi2";
import { AlignJustify } from "lucide-react";
import { Logout as LogoutIcon } from "@mui/icons-material";
import {
  Presentation,
  Users,
  CalendarCheck,
  BookCheck,
  Bell,
  BookX,
} from "lucide-react";
import { HiOutlineCog6Tooth } from "react-icons/hi2";
import { useEffect, useState } from "react";

const NavList = styled.ul`
  display: flex;
  flex-direction: column;
  gap: 1rem;
  padding: 2.5rem 1rem;
  justify-content: flex-start;
  height: 90vh;
`;

const StyledNavLink = styled(NavLink)`
  &:link,
  &:visited {
    display: flex;
    align-items: center;
    justify-content: start;
    gap: 2rem;
    color: var(--color-grey-600);
    font-size: 1.5rem;
    font-weight: 500;
    padding: 1.2rem 1.5rem;
    transition: all 0.3s;
  }

  &:hover {
    color: black;
    border-radius: 24px;
    background-color: var(--color-brand-700);
    opacity: 0.8;
  }

  &:active,
  &.active:link,
  &.active:visited {
    color: black;
    border-radius: 24px;
    background-color: var(--color-brand-700);
    opacity: 0.9;
  }

  & svg {
    width: 2rem;
    height: 2rem;
    font-weight: 800;
    transition: all 0.3s;
  }

  span {
    white-space: nowrap;
  }
`;

const SubMenu = styled.ul`
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  margin-top: 0.5rem;
  background-color: var(--color-grey-200);
  border-radius: 2rem;
  padding: 1rem;
  overflow: hidden;
`;

const SubMenuItem = styled(StyledNavLink)`
  font-size: 10px;
  &:hover {
    background-color: var(--color-brand-200);
  }
`;

export default function ResponsiveNavbar() {
  const handleLogout = () => {
    localStorage.removeItem("authtoken");
    window.location.href = "/login";
  };
  const [mobileDrawerOpen, setMobileDrawerOpen] = useState(false);
  const [showAppointmentDropdown, setShowAppointmentDropdown] = useState(false);
  const location = useLocation();

  useEffect(() => {
    const isAppointmentRoute = location.pathname.endsWith("/appointment");
    if (!isAppointmentRoute) {
      setMobileDrawerOpen(false);
    }
  }, [location]);

  return (
    <>
      <div className="flex justify-between items-center py-5 px-10 border border-b-gray-400 bg-white">
        <div className="flex items-center justify-start gap-5 py-5">
          <div className="xl:hidden md:flex flex-col justify-end max-sm:text-[16px]">
            <div onClick={() => setMobileDrawerOpen(!mobileDrawerOpen)}>
              <AlignJustify />
            </div>
          </div>
          <header className="text-3xl font-bold max-sm:text-[16px]">
            Data Doctors
          </header>
        </div>
      </div>
      <div className="mx-auto w-[375px] bg-blue-50/50">
        <div className="container relative text-sm">
          {mobileDrawerOpen && (
            <NavList>
              <div className="flex flex-col justify-between h-full my-1">
                <div className="flex flex-col gap-4">
                  <li>
                    <StyledNavLink to="/home">
                      <HiOutlineHome />
                      <span>Home</span>
                    </StyledNavLink>
                  </li>
                  <li>
                    <StyledNavLink
                      to="/appointment/schedule"
                      onClick={() =>
                        setShowAppointmentDropdown(!showAppointmentDropdown)
                      }
                    >
                      <Presentation />
                      <span>Appointment</span>
                    </StyledNavLink>

                    {showAppointmentDropdown && (
                      <SubMenu>
                        <SubMenuItem to="/appointment/schedule">
                          <CalendarCheck />
                          <span>Appointment Scheduling</span>
                        </SubMenuItem>
                        <SubMenuItem to="/appointment/upcoming">
                          <BookX />
                          <span>Upcoming Appointments</span>
                        </SubMenuItem>
                        <SubMenuItem to="/appointment/past">
                          <BookCheck />
                          <span>Past Appointment</span>
                        </SubMenuItem>
                        <SubMenuItem to="/appointment/notifications">
                          <Bell />
                          <span>Notifications & Reminders</span>
                        </SubMenuItem>
                      </SubMenu>
                    )}
                  </li>
                  <li>
                    <StyledNavLink to="/community">
                      <Users />
                      <span>Community Support</span>
                    </StyledNavLink>
                  </li>
                </div>
                <div className="flex justify-center ml-auto mr-5 items-center gap-5">
                  {!localStorage.getItem("authtoken") ? (
                    <div>
                      <button
                        onClick={() => (window.location.href = "/login")}
                        className="py-5 px-10 text-3xl hover:bg-blue-500/10 text-blue-700 rounded-full transition ease-in-out hover:scale-110 duration-300"
                      >
                        Login
                      </button>
                      <button
                        onClick={() => (window.location.href = "/signup")}
                        className="py-5 px-12 hover:bg-green-500/10 rounded-full text-[#fff] bg-gradient-to-r from-blue-400 to-blue-700 text-3xl font-medium transition ease-in-out hover:scale-110 duration-300"
                      >
                        Sign up
                      </button>
                    </div>
                  ) : (
                    <div>
                     <button
              
              onClick={handleLogout}
              style={{paddingRight:"2rem"}}
            >
              <LogoutIcon style={{height:"3rem",width:"3rem"}}/>
            </button>
                    </div>
                  )}
                </div>
              </div>
              <li className="mt-auto">
                <hr className="border border-gray-800/20" />
                <StyledNavLink to="/settings" className="mt-10">
                  <HiOutlineCog6Tooth />
                  <span>Settings</span>
                </StyledNavLink>
              </li>
            </NavList>
          )}
        </div>
      </div>
    </>
  );
}
