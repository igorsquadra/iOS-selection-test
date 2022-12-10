# iOS-selection-test

 iOS test
The task
There are three endpoints:
1. GET Access — to check, whether the list of accounts is available
2. GET Config — to get the list of companies, for which some types of payments are available 3. GET Accounts — to get the list of accounts
UI Prototype:
https://invis.io/S4133TZ063AF
The app starts with an Account List screen. To list the accounts the app should check, whether the feature is available (GET Access: `paymentsAvailable == true`) and to get the list of accounts (GET Accounts List).
While the list is being loaded — show "Loading" screen
If the payments are unavailable, failed to load or the list is empty — show the "Failed loading" screen.
Each row in the list of accounts has quick buttons to create certain kind of payment: - DC — Internal payment
- CH — ISR payment, QR-BILL payment
- XT — External payment
The list of available payment types for each account depends on the company of the account (GET Accounts List) and the companies list in the config (GET Config).
If the payment type is unavailable for some account — just do not show the button for it.
If user taps on a payment button — show an alert. Please implement.
API
GET Access
https://6388651da4bb27a7f78508b4.mockapi.io/api/v1/access
Availability of the "Accounts list" feature
Sample:
{ "paymentsAvailable":"false" }
  
 paymentsAvailable — `true` if the accounts can be listed, `false` if not
GET Config
https://6388651da4bb27a7f78508b4.mockapi.io/api/v1/config
The list of companies, for which certain payment types are available.
Sample:
{ "dcCompanies":"UA001,UA004", "chCompanies":"UA001,UA002", "xtCompanies":"UA002"
}
dcCompanies — companies, for which DC payments are available (Internal). chCompanies — companies, for which CH payments are available (ISR + QR-BILL) xtCompanies — companies, for which XT payments are available (External)
GET Accounts
https://6388651da4bb27a7f78508b4.mockapi.io/api/v1/accounts
The list of accounts
Sample:
{ "items":[ {
"id":"1", "iban":"UA001260000023001", "accountNumber":"260000023001", "company":"UA001", "amount":100239.00, "currency":"UAH"
}, {
"id":"5",
"iban":"UA003260000023005", "accountNumber":"260000023005",
"name":"На заряджену чотириколесну тачку для 95-ї бригади", "company":"UA003",
"amount":1234.02,
"currency":"CHF"
} ] }
  
 id — ID of the account (primary key to be used to get account details) iban — IBAN
accountNumber — account number
name — name of the account, optional
company — company, the account belongs to (along with Config defines the list of payment types available for this account)
amount — balance of the account
currency — currency of the account

