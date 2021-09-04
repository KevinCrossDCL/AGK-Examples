# Database Connection

## Setup
Install MAMP or an alternative that will create a web server on your local machine

The next steps for starting the web server are based on MAMP. You will need to find out how to start your webserver if you chose another application, 

- Press the start button at the top right of the MAMP window
- Press the webstart button and it will open a browser with the following URL: http://localhost:8888/MAMP/?language=English
- The menu at the top of the web page will have an option to view your website, or you can amend the URL to: http://localhost:8888. This page will show the location of your webpages on a Mac it might be: /Applications/MAMP/htdocs
- In the folder given above create a folder for your project, for this example I'm going to create a folder called agk-db-example
- Copy the pages from the AGK applications additional files into the folder you created in the step above. The URL for your project will be: http://localhost:8888/agk-db-example/
- Open a new browser tab/window and visit this address: http://localhost:8888/phpMyAdmin5/
- At the top you should see a button called Databases, press it and in the textfield that is shown for creating a new database type a name. For this example I'm going to call it agk_db_example. Don't worry about creating any tables yet.

Now that your web server is running you can run the AGK application which will create tables, update rows, delete rows and other database operations. The AGK application should work regardless of what application you used to install your webserver, but you may need to change the URLs the AGK application connects to in the AGK code.

## Disclaimer
A few things to note, this has been set up to run on your local machine and based on the assumption that you're the only user of that machine so security hasn't been considered when creating this example project. You shouldn't copy the files on to a live/public webserver and use them in your project as is. I'm also no expert with webserver security so I can't offer much assistance, but these are a few things you'd want to change:

- Change the username and password needed to connect to your database and make sure the password is hard to guess. You may need to google to search how to change the mysql password for the software you used to create the webserver.
- Move the credentials.php file so that it lives higher up then the htdocs folder so that it can't be accessed by users typing in a URL. If you move it up you will need to change all paths at the top of the example php files i.e. changing it from include "credentials.php" to something like include "../includes/credentials.php". It shouldn't be possible for a normal user to access that file via a URL in the browser then.
- At the moment anyone that can access the PHP example files via a URL will run the SQL commands in the scripts so you will want to introduce some form of user accounts and only run the code in the scripts if the user is logged in and has permission.
- You should also validate user submitted data before updating tables with it, or running SQL commands in the scripts. That validation should happen in your AGK app code as well as your server PHP files.