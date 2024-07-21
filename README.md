
# Parrot DevOps Challenge API

This project is a Django application configured to run in a local development environment using Docker Compose. Additionally, it allows you to connect to other environments through the use of secret files.

## Project Setup

The `docker-compose.yml` file defines the necessary services for the application, including the PostgreSQL database and the Django service.

### Environment Files

Environment files are used to set environment-specific variables (e.g., dev, prod). The environment files are located in the `secrets` directory and follow the format `envs.<ENV>.sh`.

To use these environment files, you first need to download the pertinent file using the command:

```sh
make get-secrets ENV=<desired environment>
```

Once the appropriate environment file is downloaded, it will be used in the subsequent commands to configure the environment settings.

## Makefile Commands

The `Makefile` provides several commands to interact with the project. Below are the available commands:

### Fetch Secrets

```sh
make get-secrets ENV=<environment>
```

This command runs the script to fetch secrets, using the specified environment.

### Build the Project

```sh
make build
```

This command prepares and downloads the necessary dependencies by building the Docker images.

### Bring Up the Server

```sh
make up ENV=<environment>
```

This command brings up the server using Docker Compose. You can specify the desired environment (e.g., `prod` for production).

### Create Superuser

```sh
make superuser
```

This command creates a superuser for the Django application.

### Apply Migrations

```sh
make migrate
```

This command applies the initial database migrations.

### Create Migrations

```sh
make migrations
```

This command creates new migrations based on the changes in Django models.

### Create New Application

```sh
make startapp ARG=<app_name>
```

This command creates a new Django application with the specified name.

### Run Tests

```sh
make test ARG=<test_options>
```

This command runs tests using pytest. Tests can be executed locally to ensure the integrity of the application.

### Get Commit Information

```sh
make commit
```

This command runs the script to get information about the current commit.

## Example Usage

To fetch secrets and bring up the server in a local development environment, you can run:

```sh
make get-secrets ENV=local
make up ENV=local
```

To fetch secrets and bring up the server in a production environment, you can run:

```sh
make get-secrets ENV=prod
make up ENV=prod
```

## Running Tests Locally

You can also run tests locally using the following command:

```sh
make test
```

## Accessing the Admin Interface

The admin interface can be accessed at [http://localhost:8000/admin](http://localhost:8000/admin).

## Command Execution Order

The typical order of commands to set up and run the project is as follows:

1. Prepare and download the dependencies:
   ```sh
   make build
   ```

2. Apply the initial database migrations:
   ```sh
   make migrate
   ```

3. Create a superuser:
   ```sh
   make superuser
   ```

4. Bring up the API in your local environment:
   ```sh
   make up
   ```