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

const StyledNav = styled.nav`
  display: flex;
  flex-direction: column;
  width: ${(props) => (props.collapsed ? "7rem" : "30rem")};
  transition: width 0.3s ease;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  height: 90vh;
  background-color: var(--color-sidebar-bg, #f4f4f4);
  overflow: hidden;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
`;

const NavList = styled.ul`
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  padding: 2.5rem 1rem;
  justify-content: flex-start;
  height: 90vh;
`;

const StyledNavLink = styled(NavLink)`
  &:link,
  &:visited {
    display: flex;
    align-items: center;
    gap: ${(props) => (props.collapsed ? "0" : "1.2rem")};
    color: var(--color-grey-600);
    font-size: 1.5rem;
    font-weight: 500;
    padding: 1.2rem 1.5rem;
    transition: all 0.3s;
    justify-content: ${(props) => (props.collapsed ? "center" : "flex-start")};
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
    display: ${(props) => (props.collapsed ? "none" : "inline")};
    white-space: nowrap;
  }
`;

const SubMenu = styled.ul`
  display: flex;
  flex-direction: column;
  gap: 1rem;
  margin-top: 0.5rem;
  background-color: rgba(0, 0, 0, 0.05);
  border-radius: 2rem;
  overflow: hidden;
`;

const SubMenuItem = styled(StyledNavLink)`
  font-size: 10px;
  &:hover {
    background-color: var(--color-brand-700);
  }
`;

export default function MainSideBar({ collapsed, onCollapseToggle }) {
  const [showAppointmentDropdown, setShowAppointmentDropdown] = useState(false);

  return (
    <StyledNav collapsed={collapsed}>
      <div onClick={() => onCollapseToggle(!collapsed)}>
        <AlignJustify className="mx-10 my-5 cursor-pointer max-lg:hidden" />
      </div>
      <NavList>
        <li>
          <StyledNavLink to="/home" collapsed={collapsed}>
            <HiOutlineHome />
            <span>Home</span>
          </StyledNavLink>
        </li>
        <li>
          <StyledNavLink
            to="/appointment"
            collapsed={collapsed}
            onClick={() => setShowAppointmentDropdown(!showAppointmentDropdown)}
          >
            <Presentation />
            <span>Appointment</span>
          </StyledNavLink>

          {showAppointmentDropdown && !collapsed && (
            <SubMenu>
              <SubMenuItem to="/appointment/schedule" collapsed={collapsed}>
                <CalendarCheck />
                <span>Appointment Scheduling</span>
              </SubMenuItem>
              <SubMenuItem to="/appointment/upcoming" collapsed={collapsed}>
                <BookX />
                <span>Upcoming Appointments</span>
              </SubMenuItem>
              <SubMenuItem to="/appointment/past" collapsed={collapsed}>
                <BookCheck />
                <span>Past Appointment</span>
              </SubMenuItem>
              <SubMenuItem
                to="/appointment/notifications"
                collapsed={collapsed}
              >
                <Bell />
                <span>Notifications & Reminders</span>
              </SubMenuItem>
            </SubMenu>
          )}
        </li>
        <li>
          <StyledNavLink to="/community" collapsed={collapsed}>
            <Users />
            <span>Community Support</span>
          </StyledNavLink>
        </li>
        <li className="mt-auto">
          <hr className="border border-gray-800/20" />
          <StyledNavLink to="/settings" collapsed={collapsed} className="mt-10">
            <HiOutlineCog6Tooth />
            <span>Settings</span>
          </StyledNavLink>
        </li>
      </NavList>
    </StyledNav>
  );
}
