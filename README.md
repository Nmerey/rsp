# Rock-Paper-Scissors Game

## Overview
This project is a web-based Rock-Paper-Scissors game built with Ruby on Rails. The application allows users to play the classic game against a server that randomly generates its throw. The game logic determines the winner based on the user's and server's throws and returns the result. Server throw cascades to random throw if server is unreachable. Also, added logic for extending signs and winning combinations

## Features
- User can play Rock-Paper-Scissors(not limited to 3) against the server.
- Server's throw is fetched from an external service or randomly generated if the service is unavailable.
- Game result is determined and displayed to the user.

## Getting Started

### Prerequisites
- Ruby (version specified in the Gemfile)
- Rails (version specified in the Gemfile)
- PostgreSQL (for database)

### Installation
1. **Clone the repository:**
   ```sh
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Install dependencies:**
   ```sh
   bundle install
   yarn install
   ```

3. **Set up the database:**
   ```sh
   rails db:create
   rails db:migrate
   ```

### Running the Application
1. **Start the Rails server:**
   ```sh
   rails server
   ```

2. **Navigate to the application in your web browser:**
   ```
   http://localhost:3000
   ```

### Running Tests
To run the test suite, execute the following command:
```sh
bundle exec rspec
```

## Project Structure
- `app/controllers`: Contains the controllers for handling web requests.
- `app/models`: Contains the models for the application's data.
- `app/views`: Contains the view templates for rendering HTML.
- `app/services`: Contains service objects for encapsulating business logic.
- `config`: Contains configuration files for the application.
- `db`: Contains database migrations and schema.
- `spec`: Contains RSpec tests for the application.

## Key Files
- `app/controllers/games_controller.rb`: Handles the game logic and user interactions.
- `app/services/fetch_curb_throw_service.rb`: Fetches the server's throw from an external service.
- `app/services/rps_result_service.rb`: Determines the game result based on the user's and server's throws.
- `spec/controllers/games_controller_spec.rb`: Contains unit tests for the `GamesController`.

## Contributing
1. Fork the repository.
2. Create a new feature branch.
3. Commit your changes.
4. Push to the branch.
5. Create a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgements
- Ruby on Rails
- RSpec
- PostgreSQL

## Contact
For any questions or feedback, please contact [merey.nurlan@gmail.com].
