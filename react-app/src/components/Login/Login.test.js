import { render } from "@testing-library/react";
import React from "react";
import Login from './Login';

describe("<Login />", () => {
  it("component should render", () => {
    const { container } = render(<Login />);
    expect(container).toBeDefined();
  });
});
