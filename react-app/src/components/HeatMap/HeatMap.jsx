import { ResponsiveCalendar } from '@nivo/calendar';
import React from "react";
import styles from "./HeatMap.module.css";

const countBonds = (bondData) => {
  const displayData = []
  //console.log(bondData)
  for (let i = 0; i < bondData.length; i++) {
    const currentDate = correctDateFormat(bondData[i].bond_maturity_date)
    console.log(currentDate)
    const index = displayData.findIndex(entry => entry.bond_maturity_date == currentDate)
    if (index != -1) {
      displayData[index].value = displayData[index].value + 1
    }
    else {
      displayData.push({ value: 1, day: currentDate })
    }
  }
  return displayData
}

const correctDateFormat = (str) => {
  const date = new Date(str)
  const mnth = ("0" + (date.getMonth() + 1)).slice(-2)
  const day = ("0" + date.getDate()).slice(-2)
  return [date.getFullYear(), mnth, day].join("-");
}

export const HeatMap = ({ bondData }) => {
  return (
    <div className={styles.HeatMap}>
      <h1>Num. of Bonds Expiring by Day</h1>
      <div className={styles.calWrapper}>
        <ResponsiveCalendar
          data={countBonds(bondData)}
          from="2021-01-01"
          to="2021-12-31"
          emptyColor="#eeeeee"
          colors={['#61cdbb', '#97e3d5', '#e8c1a0', '#f47560']}
          margin={{ top: 40, right: 40, bottom: 40, left: 40 }}
          yearSpacing={40}
          monthBorderColor="#ffffff"
          dayBorderWidth={2}
          dayBorderColor="#ffffff"
          legends={[
            {
              anchor: 'bottom-right',
              direction: 'row',
              translateY: 36,
              itemCount: 4,
              itemWidth: 42,
              itemHeight: 36,
              itemsSpacing: 14,
              itemDirection: 'right-to-left'
            }
          ]}
        />
      </div>
    </div>
  )
};


