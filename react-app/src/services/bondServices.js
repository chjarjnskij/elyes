import axios from "axios";
import { hostNameUrl } from "../config/api";

export const fetchTransactionsAll = () => {
  return axios.get(`${hostNameUrl}/api/transactions`);
};

export const fetchPermissions = (user_id) => {
  return axios.get(`${hostNameUrl}/api/permissions/${user_id}`);
};

export const fetchTradesByBook = (book_name) => {
  return axios.get(`${hostNameUrl}/api/trades_by_book/${book_name}`);
};

export const fetchTradesByISIN = (isin) => {
  return axios.get(`${hostNameUrl}/api/trades/${isin}`);
};

export const fetchBonds = () => {
  return axios.get(`${hostNameUrl}/api/bonds`);
};

export const fetchAllTrades = () => {
  return axios.get(`${hostNameUrl}/api/trades`);
};