# Bookmark Manager

## User stories

```
As a user
So I can quickly visit my favourite websites
I would like to see a list of my bookmarks
```
```
As a user
So I can store a bookmark to visit later
I would like to add a bookmark
```
```
As a user
So I can remove a bookmark from bookmark manager
I would like to delete a bookmark
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

connect to psql and create bookmark_manager and bookmark_manager_test databases:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```
To set up the appropriate tables, connect to each database in psql and then run the each SQL script in the db/migrations folder in order.

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
