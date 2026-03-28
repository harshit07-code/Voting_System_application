Project Overview

The Online Voting Portal is a secure and user-friendly web-based application designed to facilitate digital elections.
It allows registered voters to log in, participate in elections, and cast their vote for a candidate of their choice. 
The system ensures one person, one vote by automatically logging out users after voting and preventing duplicate votes.
This application also provides dedicated functionalities for Candidates and Admins, making it a complete election management system.
------------------------------------------------------------------------------------------------------------------------------------
Features
👤 Voter Module
*Secure login authentication,  
*View available elections,   
*Select and vote for a candidate,   
*Automatic logout after voting,   
*Prevents multiple voting attempts.   
---------------------------------
🧑‍💼 Candidate Module
# View elections they are participating in.
# View list of candidates in a particular election
------------------------------------------------
🛠️ Admin Module
Full control over system data
Perform CRUD operations on:
Voters
Candidates
Elections
Manage election lifecycle
-------------------------
🔐 Key Functionalities
Authentication & Authorization
One Vote Policy Enforcement
Role-Based Access Control (Admin, Voter, Candidate)
Secure Session Handling
------------------------
Database Design (Implemented)
The application uses a structured relational database with the following tables:

User Table → Stores common user data (Admin, Voter, Candidate) including authentication details and roles
Voter Table → Stores voter-specific information and voting eligibility/status
Candidate Table → Contains candidate details and their associated elections
Election Table → Maintains election information (name, date, status, etc.)
Vote Record Table → Tracks which voter voted for which candidate (ensures one vote per voter)
Result Table → Stores final election results and aggregated vote counts
-----------------------------------------------------------------------
Installation & Setup
Clone the repository
Navigate to project folder:
Configure database (MySQL):
Update database credentials in application properties (username & password)
No need to manually create tables — Hibernate automatically creates the database schema on first run
Run the application using your IDE (Eclipse/IntelliJ)
Open in browser: (http://localhost:8080)
-----------------------------------------
🔑 Demo Credentials & Usage
Admin Login
Username: Harshit@gmail.com
Password: chiku
---------------------------
How to Test the Application
Login as Admin using the above credentials
Create:
Elections
Candidates
Voters (temporary/test users)
Logout from Admin
Login as a Voter and cast a vote
Observe:
Automatic logout after voting
Voter cannot vote again
Database Access (Optional)
You can verify data directly using MySQL CLI
Check tables like:
user
voter
candidate
election
vote_record
result

This helps in understanding how votes are stored and how results are calculated internally.

-------------------------------------------------------------------------------------------
Use Cases
College elections
Organization voting systems
Online polls with authentication
---------------------------------
Future Enhancements
Email/SMS verification for voters
Real-time vote counting dashboard
Biometric authentication
Blockchain-based voting security
--------------------------------
🤝 Contribution

Contributions are welcome! Feel free to fork this repository and submit pull requests.
--------------------------------------------------------------------------------------
📄 License

This project is licensed under the MIT License.
------------------------------------------------
👨‍💻 Author

Harshit Raghuvanshi
-------------------
⭐ Final Note

This project demonstrates practical implementation of authentication, session management, and role-based access control in a real-world scenario.
It is ideal for showcasing backend logic, database design, and secure application development skills during interviews.
=======================================================================================================================
