import { render } from "@testing-library/react";
import React from "react";
import { HeatMap } from "./HeatMap";

describe("<HeatMap />", () => {
  it("component should render", () => {
    const { container } = render(<HeatMap bondData={[{bond_maturity_date: "Mon, 09 Aug 2021 00:00:00 GMT"}]}/>);
    expect(container).toBeDefined();
  });
});
