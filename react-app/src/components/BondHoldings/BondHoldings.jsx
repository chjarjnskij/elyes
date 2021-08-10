import 'ag-grid-community/dist/styles/ag-grid.css';
import 'ag-grid-community/dist/styles/ag-theme-alpine.css';
import { AgGridReact } from 'ag-grid-react';
import React, { useState } from 'react';
import { fetchTradesByISIN } from '../../services/bondServices';
import { HeatMap } from '../HeatMap/HeatMap';
import { PieChartComponent } from '../PieChart/PieChart';
import styles from './BondHoldings.module.css';

const BondHoldings = ({ rowData }) => {
    console.log(rowData)
    const [transactions, setTransactions] = useState([]);

    const rowClick = (event) => {
        fetchTradesByISIN(event.data.isin).then(data => {
            console.log('transactions', data.data.trades)
            setTransactions(data.data.trades);
        }).catch(err => console.log(err));
    }

    const filterParams = {
        comparator: function (filterLocalDateAtMidnight, cellValue) {
            var dateAsString = cellValue;
            if (dateAsString == null) return -1;
            var dateParts = dateAsString.split('/');
            var cellDate = new Date(
                Number(dateParts[2]),
                Number(dateParts[1]) - 1,
                Number(dateParts[0])
            );
            if (filterLocalDateAtMidnight.getTime() === cellDate.getTime()) {
                return 0;
            }
            if (cellDate < filterLocalDateAtMidnight) {
                return -1;
            }
            if (cellDate > filterLocalDateAtMidnight) {
                return 1;
            }
        },
        browserDatePicker: true,
        buttons: ["reset"],
        filterOptions: [

            {
                displayKey: '5Days',
                displayName: '±5 Days',
                test: (filterValue, cellValue) => {
                    const euDate = cellValue;
                    const usDate = euDate.replace(/(\d+[/])(\d+[/])/, '$2$1');
                    const within5Days = Math.abs(Date.parse(usDate) - filterValue) <= 432000000
                    console.log(within5Days)
                    return within5Days
                },
            },
            "inRange",
        ]
    };

    const columnNamesHoldings = [
        { headerName: "ISIN", field: "isin", flex: 1, suppressMovable: "true", resizable: true },
        { headerName: "CUSIP", field: "cusip", flex: 1, suppressMovable: "true", resizable: true },
        { headerName: "Status", field: "status", flex: 0.6, suppressMovable: "true", resizable: true },
        { headerName: "Coupon", field: "coupon_percent", flex: 0.7, suppressMovable: "true", resizable: true },
        { headerName: "Face Value", field: "face_value", flex: 0.7, suppressMovable: "true", resizable: true },
        { headerName: "Bond Currency", field: "bond_currency", flex: 0.8, suppressMovable: "true", resizable: true },
        {
            headerName: "Maturity Date", field: "bond_maturity_date", flex: 1, suppressMovable: "true", resizable: true,
            cellStyle:
                params => {
                    const euDate = params.value;
                    const usDate = euDate.replace(/(\d+[/])(\d+[/])/, '$2$1');
                    const expired = Date.now() > new Date(usDate);
                    const within5Days = (Date.parse(usDate) - Date.now() <= 432000000)
                    return expired ? { color: 'red' } : within5Days ? { color: '#FFBF00' } : null
                },
            filter: "agDateColumnFilter",
            filterParams
        },
        { headerName: "Issuer", field: "issuer_name", flex: 1.4, suppressMovable: "true", resizable: true },
        { headerName: "Bond Type", field: "type", flex: 0.7, suppressMovable: "true", resizable: true }];

    const columnNamesTrnsaction = [
        { headerName: "Trade", field: "trade_type", flex: 0.55, suppressMovable: "true", resizable: true },
        { headerName: "Quantity", field: "quantity", flex: 0.65, suppressMovable: "true", resizable: true },
        { headerName: "Currency", field: "trade_currency", flex: 0.65, suppressMovable: "true", resizable: true },
        { headerName: "Trade Settlement Date", field: "trade_settlement_date", flex: 1.1, suppressMovable: "true", resizable: true },
/*         { headerName: "Trade Status", field: "trade_status", flex: 1, suppressMovable: "true", resizable: true },
 */        { headerName: "Trade Date", field: "trade_date", flex: 1, suppressMovable: "true", resizable: true },
        { headerName: "Unit Price", field: "unit_price", flex: 0.6, suppressMovable: "true", resizable: true },
        { headerName: "Client", field: "bond_holder", flex: 1, suppressMovable: "true", resizable: true },
        { headerName: "Trade Book Number", field: "book_name", flex: 1, suppressMovable: "true", resizable: true }];

    return (
        <div className={styles.bondHoldingsContainer}>

            <div style={{ display: "flex", flexDirection: "row"}}>
                <div className={styles.gridContainer}>
                    <h1>Bond Holdings</h1>

                    <div className="ag-theme-alpine" style={{ height: 360, width: '98%' }}>
                        <AgGridReact
                            onRowClicked={rowClick}
                            suppressCellSelection
                            rowSelection="single"
                            style={{ width: "100%", height: "100%" }}
                            rowData={rowData}
                            columnDefs={columnNamesHoldings}>
                        </AgGridReact>
                    </div>
                </div>
                <PieChartComponent bondData={rowData} />
            </div>
            <div className={styles.rowContainer}>

                <div className={styles.gridContainer2}>
                    <h1>Transaction Details</h1>

                    <div className="ag-theme-alpine" style={{ height: 300, width: '98%' }}>
                        <AgGridReact
                            onRowClicked={rowClick}
                            suppressCellSelection
                            rowSelection="single"
                            style={{ width: "100%", height: "100%" }}
                            rowData={transactions}
                            headerHeight={55}
                            columnDefs={columnNamesTrnsaction}>
                        </AgGridReact>
                    </div>
                </div>
                <HeatMap bondData={rowData} />

            </div>
        </div>


    );
};

export default BondHoldings;