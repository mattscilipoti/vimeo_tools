# Vimeo Tools

A Rails 8 web application for managing and viewing Vimeo account information.

## Overview

Vimeo Tools provides a simple interface for users to authenticate and view their Vimeo account overview, including profile information and video counts.

## Tech Stack

- **Ruby** 3.2.3
- **Rails** 8.1.2
- **Database** SQLite3
- **Views** Slim templates
- **Forms** SimpleForm
- **Authentication** BCrypt (`has_secure_password`)
- **Vimeo API** vimeo_ruby gem

## Features

- User registration and login with email/password authentication
- Store Vimeo API credentials per user (client ID, client secret, access token)
- Overview page displaying Vimeo account info: name, bio, video count, profile link

## Setup

```bash
bundle install
rails db:migrate
rails server
```

## Running Tests

```bash
bundle exec rspec
```

## Routes

| Method | Path       | Action              |
|--------|------------|---------------------|
| GET    | /signup    | users#new           |
| POST   | /signup    | users#create        |
| GET    | /login     | sessions#new        |
| POST   | /login     | sessions#create     |
| DELETE | /logout    | sessions#destroy    |
| GET    | /overview  | overview#index      |
| GET    | /          | sessions#new (root) |

