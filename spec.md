# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - app is Sinatra based.
- [x] Use ActiveRecord for storing information in a database - ActiveRecord stores information on Users and Podcasts.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - Podcast and User model classes are included.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - class User has_many Podcasts.
- [x] Include user accounts - Users can signup, login, and logout, and can not access much of the site if logged out.
- [x] Ensure that users can't modify content created by other users - Users can not delete or edit the podcast listings of other users, based on user ids.
- [x] Include user input validations - Podcasts can not be created or edited with the input of blank names.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - Attempting to create or edit a podcast to have a blank name will shunt the user to an /error route and provide them a link back to the index page.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - See below.

Confirm
- [x] You have a large number of small Git commits - About 30 so far.
- [x] Your commit messages are meaningful - Attempted to make them descriptive.
- [x] You made the changes in a commit that relate to the commit message - Included to the best of my ability all changes within commit.
- [x] You don't include changes in a commit that aren't related to the commit message - See above.
