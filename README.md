# AirBnC

AirBnC is a clone of AirBnB.  For this front-end focused project, each team member picked a single module from the website to re-create using their own code.  I chose the Reviews module.

For this project, I: 
- create and populate a MySQL database with template review data
- create a server in Node using Express with specific endpoints to serve up that data
- build a React App that mimicks the Reviews module from the AirBnB website.

## Get This Running On Your Local Environment

### Requirements:
Make sure you have MySQL installed locally.

Make sure your local instance of MySQL is *not* version ^8.0.4 or later.
- This code makes use of the MySQL node module, which has issues with ^8.0.4
- See here: https://github.com/mysqljs/mysql/pull/1962	
- If you do use ^8.0.4+, you will likely get an error: `Error: ER_NOT_SUPPORTED_AUTH_MODE: Client does not support authentication protocol requested by server; consider upgrading MySQL client`.  Try the following command in your MySQL shell: `ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY '';` (replace `root` with your super user) and see if that resolves the issue.
	
Make sure your local instance of MySQL has local-infile set to ON.  To do so:
- Run the following command in your MySQL shell: `SHOW VARIABLES LIKE 'local_infile';`.
- If the value is set to ON, you are good to go.  If the value is set to OFF, you can turn it on by running the following: `SET GLOBAL local_infile = 1;`.  To turn it OFF again after you load the sample data, you can run: `SET GLOBAL local_infile = 1;`.

### To begin:
Open `database/index.js` and update `user` and `password` with your information.

Open `package.json` and, on line 16, update `root` to the correct user in the `load-data` script.

Then:
```sh
npm install
npm run load-data
npm run deploy
```

And finally, navigate to `http://localhost:3004/rooms/1/`

When you're done looking around, feel free to drop the airbnc_reviews_module_data database and turn local_infile back off!

## Related Projects

These are the other modules my team members produced:

  - https://github.com/airBnC/booking-module
  - https://github.com/airBnC/property-info-module
  - https://github.com/airBnC/calendar-module

