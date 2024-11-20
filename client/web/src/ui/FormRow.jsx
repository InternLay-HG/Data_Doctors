import styled from "styled-components";

const StyledFormRow = styled.div`
  display: grid;
  gap: 1rem;
  padding: 0.5rem 0;


  &:last-child {
    padding-bottom: 0;
  }

  &:has(button) {
    display: flex;
    justify-content: space-between;
    gap: 1.5rem;
  }

  /* Label styling */
  label {
    display: block;
    font-weight: 500;
    letter-spacing: 0.7px;
    margin-bottom: 0.3rem;
  }
`;

const Label = styled.label`
  font-weight: 500;
`;

const Error = styled.span`
  font-size: 1.4rem;
  color: var(--color-red-700);
`;

function FormRow({ label, error, children }) {
  return (
    <StyledFormRow>
      {label && <Label htmlFor={children.props.id}>{label}</Label>}
      {children}
      {error && <Error>{error}</Error>}
    </StyledFormRow>
  );
}

export default FormRow;
