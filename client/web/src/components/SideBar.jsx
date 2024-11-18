import styled from "styled-components";
import MainSideBar from "./MainSideBar";

const StyledSideBar = styled.aside`
  display: flex;
  gap: 3.2rem;
  border-right: 1px solid transparent;
  width: ${(props) => (props.collapsed ? "7rem" : "30rem")};
  transition: width 0.3s ease;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  background-color: var(--color-grey-50);
  z-index: 1;
`;

export default function SideBar({ collapsed, onCollapseToggle }) {
  return (
    <StyledSideBar collapsed={collapsed}>
      <MainSideBar collapsed={collapsed} onCollapseToggle={onCollapseToggle} />
    </StyledSideBar>
  );
}
