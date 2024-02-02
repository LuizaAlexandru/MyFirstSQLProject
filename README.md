Using this project I keep the status of my current knowledge of SQL.

Steps of implementation:

In order to create the database schema model I have installed and configured [MySQL Workbench](https://dev.mysql.com/downloads/installer/) and 'MySQL Server' version 8.0.36 on Port: 3306.

As Users I have defined:
1.  VersionDataManager with the role 'Backup Admin',
2.  Alex with role 'Process Admin',
3. UsersAdministrator with role 'User Admin'.

I have created DB HighSchool with the following tables: Class, Stundent and Professor.

The steps to obtain the SQL file:
1. From Menu, select File -> Export -> Forward Engineer SQL CREATE Script (Ctrl+Shift+G).
2. For the Output I have selected the desired location in the 'Save As' window and the name for the file.
3. The SQL Options  group is it present as a set of checkboxes, I have selected each option that was not known for me and I searched the documentation for it than I have decided if it's util for current scope of the project.
