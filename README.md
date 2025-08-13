# TaskMaster - Simple Task Management System Template

## TaskMaster is a full-stack JavaScript application template for task management with authentication, built for educational purposes and coding challenges.

# Welcome to `Simple Task Management System`

>> DISCLAIMER: Please note that this project is created for educational purposes and coding challenges.

1. Setting up your environment
2. Understanding the codebase
3. Solving the challenges
4. Getting support
5. References

## Setting up your environment

This section helps you to understand the prerequisites required and how to work with the codebase. Please read through carefully and follow the instructions to understand the codebase of this project.

### Prerequisites (Mandatory)

Installations of stable versions of `Git`, `Node.js` and `npm` are required on your computer. You must also be proficient in working with the aforementioned technologies.

- Install [Git](https://git-scm.com/)
- Install [NodeJS 18.18.0](https://nodejs.org/)

_Recommended: To ensure seamless management of multiple Node.js versions on your machine, it is highly recommended to use a **Node Version Manager (NVM)**._

> For Windows -: Download the .exe file   
> Mac and Linux -: Refer to [NVM installation guide](https://github.com/nvm-sh/nvm#installing-and-updating)

For macOS users, it is recommended to prepend `sudo` to the installation commands to ensure they have the required permissions.

We recommend that you use Visual Studio Code and install the Live Server extension for a better developer experience.

### Clone the project to your local computer

The Git repository URL and credentials will be available at the start of the contest through a link.

Use Git to clone the project to the local development environment using the credentials that will be shared with the team leader.

* `git clone <repository-url>`

> _Note for **Windows users**: Use `cmd` as the terminal to run commands._

### Installing dependencies

Once you clone the project from your team's Git repository, run the following command to install dependencies.

* `npm install`

### Rename env file

The repository contains an environment configuration file. Please rename it to `.env` to follow standard conventions for environment variable management.

### Setting up the development database

The following commands will create a SQLite database called `main.sqlite3` in your root folder for development purposes. The `migrate` command deletes the existing database and creates a new one with the DB schema, whereas the `seed` command populates the DB with some initial data. These steps are required for running the application.

* to recreate the database  
   * `npm run migrate`
* to populate initial data  
   * `npm run seed`

If you do change `db/seeds/**` files, the database schema changes with `migrations` and it may break your test cases and the application. Therefore, ensure not to change or modify files within the `db` and `tests` directories.

### Building and running the application

To start the server (without nodemon) use the following command:

* `npm start`

Click on the `client/index.html` file and click on the option **"Open with Live Server"** as shown in the screenshot below.

### Add .gitignore

You will have to note that the project code has no `.gitignore` file. Please add a `.gitignore` file with the following content.

```
node_modules
config/node_modules
.env
.idea
package-lock.json
.vscode
*.sqlite3
*.xml
```

> It is advised that one member of your team create the file, commit, and push the .gitignore file to the remote repository with the following commands.

### Commit and Push code to origin

* `git add .`
* `git commit -m "adding .gitignore file"`
* `git push`

Then other team members can pull the changes from the remote repository to receive the `.gitignore` file to their local machines.

* `git pull`

This is how you may use git to collaborate as a team to solve challenges.

## Overview

The TaskMaster System is a web application that allows users to create, manage, and track their tasks. The system includes features for user authentication, task management with priority levels, due date tracking, and completion status. It provides a responsive dashboard interface for users to organize their tasks efficiently. The system uses JWT authentication for secure access and includes role-based features for different user types.

You can use the following credentials to log in as an admin, and an already existing user in seed data. Navigate the application using the main menu.

ADMIN

* Email: `jane@example.com`
* Password: `password123`

USER

* Email: `john@example.com`
* Password: `password123`

### Executing the Tests
* To run a single test file of a challenge:  
`npm test challenge01.test.js`

As you complete the challenges, the respective tests will be passed one by one. When you complete all the tasks of a challenge, all tests of the respective challenge should pass. Every DevQuest challenge has a test case that you can run to validate the successful completion of the challenge.

> _Note: Tests are not using the main.sqlite3 database. Every test creates an isolated in-memory database._

### Legitimacy of your solution

Any attempt to compromise the integrity of the contest will `unconditionally disqualify` your team. Therefore please ensure you avoid attempting:

* Tampering files in the `tests` folder or `config` folder
* Hard coding values or logic to pass the test without solving the challenge legitimately

### Improving your developer Experience (Optional)

This step is not mandatory to work on the DevQuest challenges, but it may improve your development experience.

* Install a plugin for **SQLite Viewer** on your IDE so that you are able to explore the SQLite database.

* Install any other plugin as necessary for you to improve your developer experience.

## Understanding the Codebase

### Architecture

The TaskMaster application follows a **full-stack JavaScript architecture** with clear separation between frontend and backend:

#### Backend (Node.js/Express)
- **Framework**: Express.js with ES6 modules
- **Database**: SQLite with Knex.js ORM
- **Authentication**: JWT tokens with bcrypt password hashing
- **Validation**: Joi schema validation
- **Testing**: Vitest framework

#### Frontend (Vanilla JavaScript)
- **Structure**: Multi-page HTML application
- **Styling**: Bootstrap 5 + custom CSS
- **JavaScript**: ES6 modules with fetch API
- **Pages**: Landing, login, signup, dashboard

### File Structure

```
taskmaster-template/
├── client/                 # Frontend files
│   ├── js/                # JavaScript modules
│   ├── styles/            # CSS files
│   ├── index.html         # Landing page
│   ├── login.html         # Login page
│   ├── signup.html        # Signup page
│   └── dashboard.html     # Main dashboard
├── src/                   # Backend source code
│   ├── controller/        # Route controllers
│   ├── middleware/        # Express middleware
│   ├── models/           # Data models
│   ├── repositories/     # Data access layer
│   ├── routes/           # API routes
│   ├── enums/            # Constants and enums
│   └── server.js         # Main server file
├── db/                   # Database related files
│   ├── migrations/       # Database migrations
│   └── seeds/           # Database seed files
├── tests/               # Test files
│   ├── seeds/          # Test seed data
│   └── *.test.js       # Test cases
├── package.json
├── knexfile.js         # Database configuration
├── vitest.config.js    # Test configuration
└── README.md
```

### Key Components

#### 1. Server Structure (`src/`)
- **`server.js`**: Main Express server with route mounting
- **`controller/`**: Business logic (auth, tasks)
- **`models/`**: Data validation with Joi schemas
- **`repositories/`**: Database access layer
- **`middleware/`**: Auth, CORS, error handling
- **`routes/`**: API endpoint definitions

#### 2. Database Layer (`db/`)
- **Migrations**: User and task table schemas
- **Seeds**: Sample user data
- **Foreign key relationships**: Tasks belong to users

#### 3. Frontend (`client/`)
- **Static HTML pages**: Landing, auth, dashboard
- **JavaScript modules**: API communication
- **Bootstrap styling**: Responsive design

### API Endpoints

#### Authentication
- `POST /api/auth/signup` - Register a new user
- `POST /api/auth/login` - Login user

#### Tasks (Protected Routes)
- `GET /api/task` - Get all tasks for authenticated user
- `POST /api/task` - Create a new task
- `GET /api/task/:id` - Get specific task
- `PUT /api/task/:id` - Update a task
- `DELETE /api/task/:id` - Delete a task

### Database Schema

#### Users Table
- `id` (UUID, Primary Key)
- `first_name` (String)
- `last_name` (String)
- `email` (String, Unique)
- `password` (String, Hashed)
- `is_admin` (Boolean)
- `created_at` (Timestamp)
- `updated_at` (Timestamp)

#### Tasks Table
- `id` (UUID, Primary Key)
- `title` (String)
- `description` (Text)
- `is_completed` (Boolean)
- `priority` (String: low/medium/high)
- `due_date` (DateTime)
- `user_id` (UUID, Foreign Key)
- `created_at` (Timestamp)
- `updated_at` (Timestamp)

## Solving the challenges

#### You can now try out the Challenge 1 for the test run.

Happy coding !

## Getting support

There will be minimal to no support available on the context day. We are not in a position to clarify challenge descriptions on an individual basis. However, in case of a setting up the project need, you may contact the technical support team via a chat on WhatsApp (No support for technical doubts) to the phone number `+94 75 463 9283`.

In case of **non-technical support** you may reach out to the DevQuest Support Contact No. `+94 70 233 4139` via calls only.

## References

* [DevQuest Website](https://devquest.lk/)
* [Express.js Documentation](https://expressjs.com/)
* [Knex.js Documentation](https://knexjs.org/)
* [Joi Validation](https://joi.dev/)
* [Bootstrap Documentation](https://getbootstrap.com/)

## Technology Stack

- **Backend**: Node.js, Express.js, SQLite, Knex.js
- **Frontend**: HTML5, CSS3, Bootstrap 5, Vanilla JavaScript
- **Authentication**: JWT, bcrypt
- **Validation**: Joi
- **Testing**: Vitest, Supertest, JSDOM
- **Development**: Nodemon, ES6 Modules

## Scripts

- `npm start` - Start the production server
- `npm run start-dev` - Start development server with hot reload
- `npm run migrate` - Run database migrations
- `npm run seed` - Seed the database with sample data
- `npm test` - Run the test suite
- `npm run delete-db` - Delete the database file

## Contributing

This template is designed for educational purposes. Feel free to:
- Add new features
- Improve the UI/UX
- Add more test cases
- Enhance security measures
- Add more validation rules

## License

This project is created for educational purposes and does not represent production-ready code.


