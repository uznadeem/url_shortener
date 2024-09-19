
# URL Shortener

## Overview

This is a URL Shortener application built with Ruby on Rails. It allows users to shorten long URLs and track visit statistics, such as the IP address, browser, and operating system of visitors. The project uses Sidekiq for background job processing and stores visit data in a separate table for logging purposes. Real-time visit count updates are handled using Action Cable.

<img width="1799" alt="image" src="https://github.com/user-attachments/assets/91bb4e49-f9ac-403b-93c5-46e5ff49c202">


## Features

- Shorten long URLs
- Customize shortened URL aliases
- Automatically generate aliases if none are provided
- Track visits with details such as:
  - IP Address
  - Browser
  - Operating System
- Real-time visit count updates with Action Cable
- Sidekiq integration for background processing
- Redis as a queue backend for Sidekiq and Action Cable
- Bootstrap integration for basic styling

## Technologies

- **Ruby on Rails 7.2.1**
- **PostgreSQL** for database
- **Sidekiq** for background job processing
- **Redis** as the backend for Sidekiq and Action Cable
- **Action Cable** for real-time visit count updates
- **Bootstrap** for UI styling
- **Capybara** and **RSpec** for testing
- **Validates URL gem** for URL validation

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/url_shortener.git
   cd url_shortener
   ```

2. **Install dependencies**:

   ```bash
   bundle install
   ```

3. **Set up the database**:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Install Redis**:

   If you don't have Redis installed, you can install it using Homebrew (macOS):

   ```bash
   brew install redis
   ```

5. **Start Redis**:

   ```bash
   redis-server
   ```

6. **Start Sidekiq**:

   In a separate terminal window, start Sidekiq to handle background jobs:

   ```bash
   bundle exec sidekiq
   ```

7. **Run the server**:

   ```bash
   rails server
   ```

8. **Access the application**:

   Open your browser and navigate to `http://localhost:3000`.

## Real-Time Updates with Action Cable

This application uses Action Cable to update the visit count in real-time. When a new visit is logged, the visit count on the details page of the shortened URL is automatically updated.

### LogVisitJob

The `LogVisitJob` is responsible for logging the details of each visit to the shortened URL and broadcasting the updated visit count to the client via Action Cable:

```ruby
class LogVisitJob < ApplicationJob
  queue_as :default

  def perform(redirection_id, ip_address, user_agent_string)
    redirection = Redirection.find(redirection_id)
    user_browser = Browser.new(user_agent_string)

    redirection.visits.create!(
      ip_address: ip_address,
      user_agent: user_agent_string,
      browser: user_browser.name,
      operating_system: user_browser.platform.name
    )

    # Broadcast the updated visit count
    ActionCable.server.broadcast("redirection_#{redirection.alias}", { visits_count: redirection.visits.count })
  end
end
```

## Routes

- `GET /`: The homepage where users can shorten a new URL.
- `POST /redirections`: Handles the form submission to create a new shortened URL.
- `GET /:alias`: Redirects to the original URL using the shortened alias.
- `GET /:alias/visits`: Displays the visit statistics for a given shortened URL.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request or open an Issue.

