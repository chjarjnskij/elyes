import React, { useEffect, useState } from "react";
import { Cell, Legend, Pie, PieChart, ResponsiveContainer, Tooltip } from 'recharts';
import styles from "./PieChart.module.css";

const data01 = [
  { name: 'Expired, Not Redeemed', value: 400 },
  { name: 'Expired, Redeemed', value: 400 },
  { name: 'Expiring within 5 days', value: 300 },
  { name: 'Active', value: 300 },
];

export const PieChartComponent = ({bondData}) => {

  const [data, setData] = useState([]);
  //categorise by past and future
  const pastAndFuture = (bondData) => {
    const past = [];
    const future = [];
    bondData.forEach(bond => {
        const maturity = Date.parse(bond.bond_maturity_date);
        const pastTest = maturity - Date.now() < 0;
        if(pastTest){
          past.push(bond);
        } else {
          future.push(bond);
        }
    });
    return {past, future}
  };

  //categorise by active, triggered and redeemed
  
  const activeTriggeredOrRedeemed = (past, future) => {
      let pastReedemed = 0;
      let pastActive = 0;
      let pastTriggered = 0;
      let futureActive = 0;
      let futureTriggered = 0;

      past.forEach(pastBond => {
        if(pastBond.status == "active"){
          pastActive += 1;
        } else if (pastBond.status == "triggered") {
          pastTriggered += 1;
        } else {
          pastReedemed += 1;
        }
    });
    future.forEach(futureBond => {
        if(futureBond.status == "active"){
          futureActive += 1;
        } else if (futureBond.status == "triggered") {
          futureTriggered += 1;
        }
    });

    return [
          { name: 'Expired, Not Redeemed', value: pastActive },
          { name: 'Expired, Redeemed', value: pastReedemed },
          { name: 'Expired, Triggered', value: pastTriggered },
          { name: 'Active, Triggered', value: futureTriggered },
          { name: 'Active', value: futureActive }
        ];
  }

  useEffect(() => {
        const {past, future} = pastAndFuture(bondData);
        const newData = activeTriggeredOrRedeemed(past, future);
        console.log('setting data', newData);
        setData(newData);
  }, [bondData])

  return (
    <div className={styles.PieChart}>
        <h1>Current Bond Status Distribution</h1>
        <div className={styles.pieWrapper}>
          <ResponsiveContainer width="100%" height="85%">
        <PieChart width={300} height={300}>
          <Pie
            dataKey="value"
            isAnimationActive={false}
            data={data}
            cx="50%"
            cy="50%"
            outerRadius={80}
            innerRadius={40}
            fill="#8884d8"
            label
          >
              <Cell key={`cell-1`} fill={'red'} />
              <Cell key={`cell-2`} fill={'#00C49F'} />
              <Cell key={`cell-3`} fill={'#FFBF00'} />
              <Cell key={`cell-4`} fill={"#0088FE"} />
              
          </Pie>
           
          <Tooltip />
          <Legend/>
        </PieChart>
      </ResponsiveContainer>  
        </div>
      
    </div>
  )
};
