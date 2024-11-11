import { Link, NavLink } from "react-router-dom";
import styled from "styled-components";
import { HiOutlineHome } from "react-icons/hi2";
import { MenuSquare, Presentation } from "lucide-react";
import { Users } from "lucide-react";
import { LayoutDashboard } from "lucide-react";
import { HiOutlineCog6Tooth } from "react-icons/hi2";
import { useState } from "react";
import { AlignJustify } from "lucide-react";
import { CalendarCheck } from "lucide-react";
import { BookCheck } from "lucide-react";
import { Bell } from "lucide-react";
import { BookX } from "lucide-react";

const NavList = styled.ul`
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  padding: 2rem 1rem;
  justify-content: flex-start;
  height: 90vh;
`;

const StyledNavLink = styled(NavLink)`
  &:link,
  &:visited {
    display: flex;
    align-items: center;
    gap: 1.2rem;

    colors: blue;
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

  // &:hover svg,
  // &:active svg,
  //   &.active:link svg,
  //   &.active: visited svg {
  //   color: blue;
  // }
`;

const SubMenu = styled.ul`
  display: flex;
  flex-direction: column;
  gap: 1rem;
  margin-top: 0.5rem;
  background-color: rgba(0, 0, 0, 0.05);
  border-radius: 2rem;
`;

const SubMenuItem = styled(StyledNavLink)`
  font-size: 10px;
  &:hover {
    background-color: var(--color-brand-700);
  }
`;

export default function MainSideBar() {
  const [extended, setExtended] = useState(true);
  const [showAppointmentDropdown, setShowAppointmentDropdown] = useState(false);
  return (
    <nav>
      <NavList>
        <AlignJustify className="mx-6 my-5 cursor-pointer" />
        {extended ? (
          <>
            <li>
              <StyledNavLink to="/home">
                <HiOutlineHome />
                <span>Home</span>
              </StyledNavLink>
            </li>
            <li>
              <StyledNavLink to="/dashboard">
                <LayoutDashboard />
                <span>Dashboard</span>
              </StyledNavLink>
            </li>
            <li>
              <StyledNavLink
                to="/appointment"
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
            <li className="mt-auto">
              <hr className="border border-gray-800/20" />
              <StyledNavLink to="/settings" className="mt-10">
                <HiOutlineCog6Tooth />
                <span>Settings</span>
              </StyledNavLink>
            </li>
          </>
        ) : null}
      </NavList>
    </nav>
  );
}
