# README

This sinatra app stores and displays posts with their comments.
The home page can be found at `localhost:4567`.
To add a new post please go to: `localhost:4567/db`.
Any post can be found with its id: `localhost:4567/db/:id`.
Any comment can be added on this page. 


## Running and more

To check your installations, run the following command in the command line:
```
$ ruby -v
```

```
$ gem install sinatra
$ gem install sinatra-contrib
```

Run example:
```
$ ruby app.rb
```

## Mysql Test

To check your installations, run the following command in the command line:
```
$ mysql --version
$ gem install mysql2 --platform=ruby
```

Set up MySQL database, use -u -p flags to provide username and password:

```
$ sudo mysql < database_backup.sql
$ sudo mysql -u root -p
```
