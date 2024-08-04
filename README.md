# Coach Booking System

A web application for managing coaching appointments, including coach availability and bookings. This project provides functionality for users to book time slots with coaches.

## Features

- **Coach Management**: Create and manage coaches with their availability.
- **Availability Management**: Define available time slots for each coach.
- **Booking System**: Book available time slots with coaches.

## Tech Stack

- **Backend**: Ruby on Rails
- **Frontend**: React.js
- **Database**: PostgreSQL
- **Testing**: RSpec, FactoryBot, Shoulda Matchers
- **Time Handling**: Moment.js

## Setup

### Prerequisites

- Ruby 3.0.6
- Rails 7.0.8
- PostgreSQL
- Node.js (v18.20.4)
- Yarn

### Running Tests

To run the test suite, use the following command:

```bash
bundle exec rspec

Running the Server
To start the server, use:

bin/dev
This command will run both the backend and frontend servers concurrently.

If you need to run them separately:

For the backend:
rails s
For the frontend:
yarn build --watch
