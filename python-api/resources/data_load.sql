/* Create database and populate transactions data */

DROP DATABASE IF EXISTS `bonds-group-24`;

CREATE DATABASE IF NOT EXISTS `bonds-group-24`;

USE `bonds-group-24`;

CREATE TABLE IF NOT EXISTS `transactions` (
`id` int NOT NULL AUTO_INCREMENT,
`trade_type` varchar(255) NOT NULL,
`trade_currency` varchar(255) NOT NULL,
`quantity` int NOT NULL,
`trade_settlement_date` date NOT NULL,
`trade_status` varchar(255) NOT NULL,
`trade_date` date NOT NULL,
`unit_price` float NOT NULL,
`coupon_percent` float NOT NULL,
`bond_currency` varchar(255) NOT NULL,
`cusip` varchar(255),
`face_value` float NOT NULL,
`isin` varchar(255) NOT NULL,
`issuer_name` varchar(255) NOT NULL,
`bond_maturity_date` date NOT NULL,
`status` varchar(255) NOT NULL,
`type` varchar(255) NOT NULL,
`book_name` varchar(255) NOT NULL,
`bond_holder` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/* Population script for transactions table */

/* Rows 2-5 */

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`, `type`, book_name, bond_holder) VALUES ("buy", "USD", 50, STR_TO_DATE('4,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('13,5,2021','%d,%m,%Y'), 90, 4.37, "USD", NULL, 1000, "XS1988387210", "BNPParibasIssu 4,37% Microsoft Corp (USD)", STR_TO_DATE('5,8,2021','%d,%m,%Y'), "active", "CORP", "trading_book_1", "AZ Holdings Inc");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`, `type`, book_name, bond_holder) VALUES ("sell", "GBP", 40, STR_TO_DATE('4,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('4,2,2021','%d,%m,%Y'), 89.56, 4.37, "USD", NULL, 1000, "XS1988387210", "BNPParibasIssu 4,37% Microsoft Corp (USD)", STR_TO_DATE('5,8,2021','%d,%m,%Y'), "active", "CORP", "trading_book_1", "AZ Holdings Inc");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 1000, STR_TO_DATE('23,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('13,5,2021','%d,%m,%Y'), 105.775, 3.15, "USD", "123456780", 900, "USN0280EAR64", "Airbus 3.15%  USD", STR_TO_DATE('30,7,2021','%d,%m,%Y'), "active", "CORP", "trading_book_2", "Acme co");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "GBP", 900, STR_TO_DATE('10,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('4,2,2021','%d,%m,%Y'), 105.775, 3.15, "USD", "123456780", 900, "USN0280EAR64", "Airbus 3.15%  USD", STR_TO_DATE('30,7,2021','%d,%m,%Y'), "active", "CORP", "trading_book_2", "Acme co");


/* Rows 6-10 */

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 50, STR_TO_DATE('23,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('13,5,2021','%d,%m,%Y'), 90, 2, "USD", "123456bh0", 900, "A12356111", "UBS Facebook (USD)", STR_TO_DATE('30,9,2021','%d,%m,%Y'), "active", "CORP", "trading_book_3", "Sovereign investments");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 1000, STR_TO_DATE('23,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('13,5,2021','%d,%m,%Y'), 105.775, 3.15, "USD", "123456780", 900, "USN0280EAR64", "Airbus 3.15%  USD", STR_TO_DATE('30,7,2021','%d,%m,%Y'), "active", "CORP", "trading_book_2", "Astra Trading Ltd");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "USD", 50, STR_TO_DATE('23,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('13,5,2021','%d,%m,%Y'), 90, 2, "USD", "123456bh0", 900, "A12356111", "UBS Facebook (USD)", STR_TO_DATE('30,9,2021','%d,%m,%Y'), "active", "CORP", "trading_book_2", "Sovereign investments");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "GBP", 60, STR_TO_DATE('27,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('4,2,2021','%d,%m,%Y'), 98.56, 3.15, "USD", "AMZN 3.15 08/22/27 REGS", 900, "USU02320AG12", "Amazon", STR_TO_DATE('3,8,2021','%d,%m,%Y'), "active", "CORP", "trading_book_4", "Muncipal Gov Of Orange County");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 50, STR_TO_DATE('23,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('23,8,2021','%d,%m,%Y'), 98.56, 3.15, "USD", "AMZN 3.15 08/22/27 REGS", 900, "USU02320AG12", "Amazon", STR_TO_DATE('3,8,2021','%d,%m,%Y'), "active", "CORP", "trading_book_4", "Muncipal Gov Of Orange County");

/* Rows 11-15 */

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "GBP", 1100, STR_TO_DATE('27,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('27,9,2021','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460505", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "Goldman Sachs");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "GBP", 900, STR_TO_DATE('28,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('28,9,2021','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460506", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "Goldman Sachs");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "GBP", 2000, STR_TO_DATE('29,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('28,9,2021','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460507", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "UBS");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "GBP", 2000, STR_TO_DATE('30,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('30,9,2021','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460508", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "UBS");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "GBP", 1000, STR_TO_DATE('1,10,2021','%d,%m,%Y'), "open", STR_TO_DATE('1,10,2021','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460509", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "Barclays");


/* Rows 16-20 */

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "GBP", 900, STR_TO_DATE('2,10,2019','%d,%m,%Y'), "open", STR_TO_DATE('2,10,2019','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460510", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "Barclays");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "GBP", 1900, STR_TO_DATE('3,10,2019','%d,%m,%Y'), "open", STR_TO_DATE('3,10,2019','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460511", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "Barclays");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "GBP", 600, STR_TO_DATE('4,10,2018','%d,%m,%Y'), "open", STR_TO_DATE('4,10,2018','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460512", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "British Telecom");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "GBP", 600, STR_TO_DATE('5,10,2019','%d,%m,%Y'), "open", STR_TO_DATE('5,10,2019','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460513", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "Pension Holdings");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "GBP", 700, STR_TO_DATE('6,6,2021','%d,%m,%Y'), "open", STR_TO_DATE('6,6,2021','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460514", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "Pension Holdings");


/* Rows 21-25 */

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "GBP", 1300, STR_TO_DATE('7,10,2021','%d,%m,%Y'), "open", STR_TO_DATE('7,10,2021','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460515", "HM Treasury United Kingdon", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "Pension Holdings");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 60, STR_TO_DATE('27,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('4,2,2012','%d,%m,%Y'), 100.13, 2.02, "USD", "87973RAA8", 690, "US87973RAA86", "TEMASEK FINL I LTD GLOBAL MEDIUM TERM NTS BOOK ENTRY REG S", STR_TO_DATE('6,8,2021','%d,%m,%Y'), "active", "SOVN", "trading_book_4", "Zurich Pension fund 4");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 50, STR_TO_DATE('23,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('23,8,2012','%d,%m,%Y'), 100.13, 2.02, "USD", "87973RAA8", 690, "US87973RAA86", "TEMASEK FINL I LTD GLOBAL MEDIUM TERM NTS BOOK ENTRY REG S", STR_TO_DATE('6,8,2021','%d,%m,%Y'), "active", "SOVN", "trading_book_4", "Zurich Pension fund 4");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 75, STR_TO_DATE('27,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('4,2,2013','%d,%m,%Y'), 100.13, 2.02, "USD", "87973RAA8", 690, "US87973RAA86", "TEMASEK FINL I LTD GLOBAL MEDIUM TERM NTS BOOK ENTRY REG S", STR_TO_DATE('6,8,2021','%d,%m,%Y'), "active", "SOVN", "trading_book_4", "Zurich Pension fund 4");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 50, STR_TO_DATE('23,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('23,8,2014','%d,%m,%Y'), 100.13, 2.02, "USD", "87973RAA8", 690, "US87973RAA86", "TEMASEK FINL I LTD GLOBAL MEDIUM TERM NTS BOOK ENTRY REG S", STR_TO_DATE('6,8,2021','%d,%m,%Y'), "active", "SOVN", "trading_book_4", "Zurich Pension fund 4");


/* Rows 26-29 */

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 300, STR_TO_DATE('27,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('4,2,2016','%d,%m,%Y'), 98.76, 1.123, "USD", "87973RAA8", 340, "IE00B29LNP31", "First Norway Alpha Kl.IV", STR_TO_DATE('22,12,2030','%d,%m,%Y'), "active", "SOVN", "trading_book_4", "Zurich Pension fund 4");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 300, STR_TO_DATE('23,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('23,8,2012','%d,%m,%Y'), 98.76, 1.123, "USD", "87973RAA8", 340, "IE00B29LNP31", "First Norway Alpha Kl.IV", STR_TO_DATE('22,12,2030','%d,%m,%Y'), "active", "SOVN", "trading_book_4", "Zurich Pension fund 4");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 300, STR_TO_DATE('27,9,2021','%d,%m,%Y'), "open", STR_TO_DATE('4,2,2013','%d,%m,%Y'), 98.76, 1.123, "USD", "87973RAA8", 340, "IE00B29LNP31", "First Norway Alpha Kl.IV", STR_TO_DATE('22,12,2030','%d,%m,%Y'), "active", "SOVN", "trading_book_4", "Zurich Pension fund 4");

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "USD", 300, STR_TO_DATE('23,8,2021','%d,%m,%Y'), "open", STR_TO_DATE('23,8,2015','%d,%m,%Y'), 98.76, 1.123, "USD", "87973RAA8", 340, "IE00B29LNP31", "First Norway Alpha Kl.IV", STR_TO_DATE('22,12,2030','%d,%m,%Y'), "active", "SOVN", "trading_book_4", "Zurich Pension fund 4");
/*Active with expiry date in next 5 days */

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "GBP", 1300, STR_TO_DATE('1,10,2020','%d,%m,%Y'), "open", STR_TO_DATE('1,10,2020','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B6460515DF", "HM Treasury United Kingdon", STR_TO_DATE('12,8,2021','%d,%m,%Y'), "active", "GOVN", "trading_book_6", "Pension Holdings");

/*Redeemed with expiry date in the past */

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "GBP", 1300, STR_TO_DATE('1,10,2020','%d,%m,%Y'), "open", STR_TO_DATE('1,10,2020','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB00B646484de", "HM Treasury United Kingdon", STR_TO_DATE('8,8,2021','%d,%m,%Y'), "redeemed", "GOVN", "trading_book_6", "Pension Holdings");

/* Triggered with expiry date within 5 days in future */

INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("sell", "GBP", 1300, STR_TO_DATE('2,10,2020','%d,%m,%Y'), "open", STR_TO_DATE('2,10,2020','%d,%m,%Y'), 110.35, 0.75, "GBP", "BDCHBW8", 900, "GB048493ef", "HM Treasury United Kingdon", STR_TO_DATE('13,8,2021','%d,%m,%Y'), "triggered", "GOVN", "trading_book_6", "Pension Holdings");

/* Triggered with expiry date within 5 days in the past */
 
INSERT INTO transactions (trade_type, trade_currency, quantity, trade_settlement_date, trade_status, trade_date, unit_price, coupon_percent, bond_currency, cusip, face_value, isin, issuer_name, bond_maturity_date, `status`,  `type`, book_name, bond_holder) VALUES ("buy", "USD", 1000, STR_TO_DATE('23,7,2021','%d,%m,%Y'), "open", STR_TO_DATE('13,5,2021','%d,%m,%Y'), 98.775, 3.15, "USD", "123456764", 900, "CEM0280EAR6478", "Airbus 3.15%  USD", STR_TO_DATE('9,8,2021','%d,%m,%Y'), "triggered", "CORP", "trading_book_2", "Acme co");







/* Regularisation schema*/

USE `bonds-group-24`;

CREATE TABLE IF NOT EXISTS `bond_info` (
`isin` varchar(255),
`cusip` varchar(255),
`coupon_percent` float,
`bond_currency` varchar(255),
`face_value` float,
`issuer_name` varchar(255),
`bond_maturity_date` date,
`status` varchar(255),
`type` varchar(255),
PRIMARY KEY (`isin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `trader` (
`user_id` varchar(255) NOT NULL,
`email` varchar(255) NOT NULL,
PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `book` (
`book_name` varchar(255) NOT NULL,
PRIMARY KEY (`book_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `book_2_trader` (
`book_name` varchar(255) NOT NULL,
`user_id` varchar(255) NOT NULL,
PRIMARY KEY (`user_id`, `book_name`),
FOREIGN KEY (user_id) REFERENCES trader(user_id),
FOREIGN KEY (book_name) REFERENCES book(book_name)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `client` (
`bond_holder` varchar(255) NOT NULL,
PRIMARY KEY (`bond_holder`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `trade` (
`id` int NOT NULL AUTO_INCREMENT,
`isin` varchar(255) NOT NULL,
`trade_type` varchar(255) NOT NULL,
`trade_currency` varchar(255) NOT NULL,
`quantity` int NOT NULL,
`trade_settlement_date` date NOT NULL,
`trade_date` date NOT NULL,
`unit_price` float NOT NULL,
`book_name` varchar(255) NOT NULL,
`bond_holder` varchar(255) NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (isin) REFERENCES bond_info(isin),
FOREIGN KEY (book_name) REFERENCES book(book_name),
FOREIGN KEY (bond_holder) REFERENCES client(bond_holder)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/* Populate post-regularisation schema */

INSERT INTO bond_info (
isin,
cusip,
coupon_percent,
bond_currency,
face_value,
issuer_name,
bond_maturity_date,
`status`,
`type`)
SELECT DISTINCT t.isin, t.cusip, t.coupon_percent, t.bond_currency, t.face_value, t.issuer_name, t.bond_maturity_date, t.`status`, t.`type`
FROM transactions AS t;

INSERT book (
book_name
) SELECT DISTINCT book_name
FROM transactions;

INSERT INTO trader (email, user_id) VALUES ("test@testmail.com", "2WIjV7SxvFVEQy2G2rpz1vBbdDh1");
INSERT INTO trader (email, user_id) VALUES ("trader2@gmail.com", "WJW2HswKAVPsTtX5K2xS3yynrIE3"); 
INSERT INTO trader (email, user_id) VALUES ("trader3@gmail.com", "RG4yC6BSfocar0Kb4cyxYYi1i5P2");
INSERT INTO trader (email, user_id) VALUES ("trader4@gmail.com", "yJT3G2DJZROp2frEcvjeICwJPKg1");

INSERT client (
bond_holder
)
SELECT DISTINCT bond_holder
FROM transactions
WHERE transactions.bond_holder NOT IN (SELECT bond_holder FROM client);

INSERT trade (
id,
isin,
trade_type,
trade_currency,
quantity,
trade_settlement_date,
trade_date,
unit_price,
book_name,
bond_holder
)
SELECT DISTINCT id, isin, trade_type, trade_currency, quantity, trade_settlement_date, trade_date, unit_price, book_name, bond_holder
FROM transactions;

INSERT INTO book_2_trader (book_name, user_id) VALUES ("trading_book_1", "2WIjV7SxvFVEQy2G2rpz1vBbdDh1");
INSERT INTO book_2_trader (book_name, user_id) VALUES ("trading_book_2", "2WIjV7SxvFVEQy2G2rpz1vBbdDh1");
INSERT INTO book_2_trader (book_name, user_id) VALUES ("trading_book_3", "2WIjV7SxvFVEQy2G2rpz1vBbdDh1");
INSERT INTO book_2_trader (book_name, user_id) VALUES ("trading_book_4", "2WIjV7SxvFVEQy2G2rpz1vBbdDh1");
INSERT INTO book_2_trader (book_name, user_id) VALUES ("trading_book_6", "2WIjV7SxvFVEQy2G2rpz1vBbdDh1");
INSERT INTO book_2_trader (book_name, user_id) VALUES ("trading_book_2", "WJW2HswKAVPsTtX5K2xS3yynrIE3");
INSERT INTO book_2_trader (book_name, user_id) VALUES ("trading_book_3", "RG4yC6BSfocar0Kb4cyxYYi1i5P2");
INSERT INTO book_2_trader (book_name, user_id) VALUES ("trading_book_4", "yJT3G2DJZROp2frEcvjeICwJPKg1");