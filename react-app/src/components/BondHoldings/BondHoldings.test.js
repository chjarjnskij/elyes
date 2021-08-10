import { render } from "@testing-library/react";
import React from "react";
import BondHoldings from './BondHoldings';

describe("<BondHoldings />", () => {
  it("component should render", () => {
    const { container } = render(<BondHoldings rowData={[
    {
      "bond_currency": "USD",
      "bond_maturity_date": "Thu, 30 Sep 2021 00:00:00 GMT",
      "coupon_percent": 2,
      "cusip": "123456bh0",
      "face_value": 900,
      "isin": "A12356111",
      "issuer_name": "UBS Facebook (USD)",
      "status": "active",
      "type": "CORP"
    },
    {
      "bond_currency": "USD",
      "bond_maturity_date": "Mon, 09 Aug 2021 00:00:00 GMT",
      "coupon_percent": 3.15,
      "cusip": "123456764",
      "face_value": 900,
      "isin": "CEM0280EAR6478",
      "issuer_name": "Airbus 3.15%  USD",
      "status": "triggered",
      "type": "CORP"
    },
    {
      "bond_currency": "GBP",
      "bond_maturity_date": "Mon, 09 Aug 2021 00:00:00 GMT",
      "coupon_percent": 0.75,
      "cusip": "BDCHBW8",
      "face_value": 900,
      "isin": "GB00B6460505",
      "issuer_name": "HM Treasury United Kingdon",
      "status": "active",
      "type": "GOVN"
    },
    {
      "bond_currency": "GBP",
      "bond_maturity_date": "Mon, 09 Aug 2021 00:00:00 GMT",
      "coupon_percent": 0.75,
      "cusip": "BDCHBW8",
      "face_value": 900,
      "isin": "GB00B6460506",
      "issuer_name": "HM Treasury United Kingdon",
      "status": "active",
      "type": "GOVN"
    }]} />);
    expect(container).toBeDefined();
  });
});
