# Bookmark Manager

## User stories

```
As a user
So I can quickly visit my favourite websites
I would like to see a list of my bookmarks
```

## Domain model

![domain model](https://github.com/YoFirmy/bookmark_manager/blob/main/images/bookmark_manager_domain_model.png?raw=true)

## How to use

### Set up
Clone this repository and then run:
```
bundle
```

### Database setup

connect to psql and create the bookmark_manager database:

```
CREATE DATABASE bookmark_manager;
```
Connect to the database and then run the SQL script in the db/migrations folder.

### To run the Bookmark Manager app
```
rackup -p 3000
```

To view bookmarks, navigate to localhost:3000/bookmarks.

### To run tests
```
rspec
```

### To run linting

```
rubocop
```
