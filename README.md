## User story
The first user story I used while starting this project:

```
'as a user'
'so I can quickly visit my favourite websites'
'I would like to see a list of my bookmarks'
```

## Domain model

Domain model created from this user story:

![domain model](https://github.com/YoFirmy/bookmark_manager/blob/main/images/bookmark_manager_domain_model.png?raw=true)

## Database setup

### Connect to psql
It is recommended to use a package manager like Homebrew to install PostgreSQL. You can download Homebrew [here](https://brew.sh/).

Use Homebrew to install PostgreSQL:
```
$ brew install postgresql
```
Start PostgreSQL in the background (It will restart when you login):
```
$ brew services start postgresql
```
Start psql:
```
$ psql postgres
postgres=#
```

### Create database and table

Create a database called bookmark_manager in psql:
```
postgres=# CREATE DATABASE bookmark_manager;
```
Connect to that database:
```
postgres=# \c bookmark_manager;
```
The create the bookmarks table by running the query saved in db/migrations/01_create_bookmarks_table.sql
