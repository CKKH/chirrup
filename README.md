## Messenger Web App - Week 4 Makers Academy
============================================

## Task
-------

Build a Web App using Sinatra and BDD/TDD practices.

## As a user...
---------------
```
I can write and submit messages on the homepage

I see a list of all messages on the homepage

I see a timestamp for when those messges were posted on the homepage

I see the messages listed in chronological order, most recent at the top

I can only see the first 20 characters of every message on the homepage

I can click on any message on the homepage in order to view that full message

I can edit any message

I can delete any message
```

## Setup
--------
From your terminal move to your project directory and input these commands:
```
git clone git@github.com:CKKH/chirrup.git
cd chirrup
bundle
brew install postgres
psql
CREATE DATABASE chirrup_app_test;
CREATE DATABASE chirrup_app_development;

```

#### Approach-
--------------
- Developed user stories based on requirements
- Drew model diagrams of pages and the flow of requests/responses between them
- Wrote feature tests and used their failures to build unit tests, which drove
  the code
