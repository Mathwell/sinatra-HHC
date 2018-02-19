# sinatra-HHC

HHA APP

What is does?
HHA App  is a web-based database management system for Home Health Care. It allows to keep information about intakes and schedule organized, easily accessible and secure.
******************
Data Structure
HHA App database includes the following tables:
Users
•	username
•	email
•	password_digest
Patients
•	first_name
•	last_name
•	date_of_birth
•	SSN
•	Insurance
•	schedule
•	status
Nurses
•	first_name
•	last_name
Table Users is used for authentification for security purposes.  Each patient has an assigned nurse and each nurse visits several patients. Therefore, tables Nurses and Patients relationship is “one to many”.
**********************
Functionality
1.	Authentification. HHA App gives  a secured access for multiple users.  New users can register by entering their username, email and password.
2.	Nurse access. Nurses can edit their personal data in the accounts as well as review and manage their schedule. Patients can be added to the schedule and deleted from it. Nurses have access only to the patients in their schedule.
3.	Patients’ data. Patients can be added, viewed, modified and deleted.  Patient’s information is only accessible to the nurse that is assigned to the patient.
Install instruction?
Contributors Guide?
Link to the license for code?
