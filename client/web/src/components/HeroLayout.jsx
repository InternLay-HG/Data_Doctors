import SideBar from "./SideBar";
import Navbar from "./Navbar";
import { Outlet, useLocation } from "react-router";
import styled from "styled-components";
import { useState } from "react";

const StyledAppLayout = styled.div`
  display: grid;
  grid-template-rows: auto 1fr;
  height: 100vh;

  & > main {
    display: grid;
    grid-template-columns: ${(props) => (props.collapsed ? "7rem 1fr" : "30rem 1fr")};
    transition: grid-template-columns 0.3s ease;
    overflow: hidden;

    @media (max-width: 768px) {
      grid-template-columns: 1fr; /* Adjust for mobile */
    }
  }

  .content {
    grid-column: 2 / 3;

    @media (max-width: 768px) {
      grid-column: 1 / 2;
    }
  }
`;

export default function HeroLayout() {
  const location = useLocation();
  const isSignUpPage = location.pathname === "/signup";
  const [isSidebarCollapsed, setSidebarCollapsed] = useState(false);

  return (
    <StyledAppLayout collapsed={isSidebarCollapsed}>
      {!isSignUpPage && <Navbar />}
      <main>
        {!isSignUpPage && (
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
