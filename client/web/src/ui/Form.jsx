import styled, { css } from "styled-components";

const Form = styled.form`
  ${(props) =>
    props.type !== "modal" &&
    css`
      padding: 1.5rem 4rem;

      background-color: var(--color-grey-0);
      border-radius: var(--border-radius-lg);
    `}

  ${(props) =>
    props.type === "modal" &&
    css`
      width: 80rem;
    `}

    overflow: hidden;
  font-size: 1.3rem;
  font-weight: 600;
`;

export default Form;
