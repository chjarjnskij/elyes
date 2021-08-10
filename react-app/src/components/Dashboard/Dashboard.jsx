import React, { useEffect, useState } from "react";
import { auth } from "../../base.js";
import { fetchBonds } from "../../services/bondServices";
import BondHoldings from '../BondHoldings/BondHoldings';
import styles from "./Dashboard.module.css";

export const Dashboard = () => {
  const [bonds, setBonds] = useState([]);

  useEffect(() => {
      fetchBonds()
    .then(({ data }) => {
        setBonds(data.bonds);
        console.log('data', data);
      });

  }, []);
  return (
    <div className={styles.Dashboard}>
      <div className="float-right">
        <button onClick={() => auth.signOut()} className="btn btn-outline-success signout" type="button">Sign Out</button>
      </div>
      <h1 style={{fontSize: "50px", paddingLeft: "20px"}}>Dashboard</h1>
      <BondHoldings rowData={bonds}/>
    </div >
  )
};
