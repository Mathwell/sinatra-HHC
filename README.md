# sinatra-HHC

HHA APP

What it does?
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
To use this app, just clone this repo: https://github.com/Mathwell/sinatra-HHC.
And then execute:$ bundle install

Step 1) Run: rake db:migrate
Step 2) Run: rake db:seed
Step 3) Run: shotgun

Contributors Guide?
Bug reports and pull requests are welcome on GitHub at https://github.com/Mathwell/sinatra-HHC. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

Link to the license for code?
The app is available as open source under the terms of the MIT License.
