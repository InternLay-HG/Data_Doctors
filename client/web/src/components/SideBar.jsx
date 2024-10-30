import styled from "styled-components";
import MainSideBar from "./MainSideBar";

const StyledSideBar = styled.aside`
  grid-row: 1 / -1;
  display: flex;
  flex-direction: column;
  gap: 3.2rem;
  border-right: 1px solid transparent;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  background-color: var(--color-grey-50);
`;

export default function SideBar() {
  return (
    <StyledSideBar>
      <MainSideBar />
    </StyledSideBar>
  );
}
  