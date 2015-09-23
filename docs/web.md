Web Setup Instructions 
-------
0. Install [Rails.](http://installrails.com/)
1.  Clone the Github repo `git clone git@github.com:calblueprint/ashby-village.git`
2.  Install all appropriate gems `bundle install`
3.  Create `config/database.yml` using the template at `config/database.yml.sample`.  You may need to create a new Postgres user; there's some information [here](http://stackoverflow.com/questions/16973018/createuser-could-not-connect-to-database-postgres-fatal-role-tom-does-not-e/16974197#16974197) if you run into issues.
4.  Create `config/application.yml` using the template at `config/application.yml.sample`.  This requires you to extract your AWS keys, and use a email account that you want to use.  Be aware that if you're using Gmail, there might be issues with authentication.  I didn't really have a good way to work around this.
5.  Run `rake db:create` and `rake db:migrate` to set up the database completely.  If you want to prepopulate the database with dummy data, you can use `rake db:populate`.  See the file in `lib/db.rake` to learn more about the dummy data inserted.
6.  Run `rails s` to start the server, and then navigate to `localhost:3000` to see the website running on your computer!
