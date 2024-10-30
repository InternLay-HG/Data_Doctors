import { Outlet, useLocation } from "react-router";
import Navbar from "./Navbar";
import SideBar from "./SideBar";
import styled from "styled-components";

const StyledAppLayout = styled.div`
  display: grid;
  grid-template-rows: auto 1fr;
  grid-template-columns: 1fr;
  height: 100vh;

  & > main {
    display: grid;
    grid-template-columns: 30rem 1fr;
  }
`;

export default function HeroLayout() {
  const location = useLocation();
  const isSignUpPage = location.pathname === "/signup";

  return (
    <StyledAppLayout>
      {!isSignUpPage && <Navbar />}
      <main>
        {!isSignUpPage && <SideBar />}
        <Outlet />
      </main>
    </StyledAppLayout>
  );
}
