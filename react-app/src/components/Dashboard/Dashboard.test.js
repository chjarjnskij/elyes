import { render } from "@testing-library/react";
import React from "react";
import { Dashboard } from './Dashboard';

describe("<Dashboard />", () => {
  it("component should render", () => {
    const { container } = render(<Dashboard />);
    expect(container).toBeDefined();
  });
});
