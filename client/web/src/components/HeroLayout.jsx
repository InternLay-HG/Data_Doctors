import SideBar from "./SideBar";
import Navbar from "./Navbar";
import ResponsiveNavbar from "./ResponsiveNavbar";
import { Outlet, useLocation } from "react-router";
import styled from "styled-components";
import { useState } from "react";
import { useMediaQuery } from "react-responsive";

const StyledAppLayout = styled.div`
  display: flex;
  flex-direction: column;
  height: 100vh;

  & > main {
    display: flex;
    overflow: hidden;
  }

  .content {
    overflow-y: auto;
    padding: 1rem;
    width: 100vw;
  }
`;

export default function HeroLayout() {
  const location = useLocation();
  const isSignUpPage = location.pathname === "/signup";
  const [isSidebarCollapsed, setSidebarCollapsed] = useState(false);
  const isSmallScreen = useMediaQuery({ maxWidth: 1350 });
  return (
    <StyledAppLayout collapsed={isSidebarCollapsed}>
      {!isSignUpPage && (
        <>
          {isSmallScreen ? (
            <ResponsiveNavbar collapsed={isSidebarCollapsed} />
          ) : (
            <Navbar
              collapsed={isSidebarCollapsed}
              onCollapseToggle={setSidebarCollapsed}
            />
          )}
        </>
      )}
      <main>
        {!isSignUpPage && !isSmallScreen && (
          <SideBar
            collapsed={isSidebarCollapsed}
            onCollapseToggle={setSidebarCollapsed}
          />
        )}
        <div className="content">
          <Outlet />
        </div>
      </main>
    </StyledAppLayout>
  );
}
