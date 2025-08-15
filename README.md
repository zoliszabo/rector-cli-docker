# Rector Docker

This project provides a Dockerized environment for running [Rector](https://getrector.com/), a PHP refactoring tool. It allows you to run Rector on your codebase without needing to install PHP or Rector directly on your host machine, avoiding version conflicts.

By leveraging Docker containerization, you can always use the latest version of Rector regardless of your project's PHP version or the PHP versions available on your system.

## Usage

There are two primary ways to use this tool: via the Composer package (recommended) or by running the Docker command directly.

### 1. Composer (Recommended)

This method provides a convenient `rector-docker` command.

#### Installation

You can install the package globally in your environment:

```bash
composer global require zoliszabo/rector-docker
```

Ensure your global Composer `bin` directory is in your system's `PATH`.

#### Running Rector

Once installed, you can run Rector from anywhere on your system. Navigate to your project's root directory and execute:

```bash
rector-docker process src
```

Any arguments passed to `rector-docker` are forwarded directly to the Rector process inside the container. The command automatically detects whether it's running in an interactive environment and handles Docker flags accordingly.

### 2. Direct Docker Command

You can also run Rector by using the `docker run` command directly.

```bash
docker run --rm -it -v "$(pwd)":/app zoliszabo/rector rector process src
```

Note: The `-it` flags enable interactive mode, which is only necessary when Rector requires user input (e.g., confirming creation of a rector.php config file). In most cases these flags are not required, but unlike the Composer method, you need to manually manage them when using Docker directly.

## Docker Image Tags

**Recommendation:** Use the `latest` tag for most use cases to ensure you have the newest versions of both PHP and Rector. Note that omitting the tag entirely also defaults to `latest`.

### Available Tags

*   `latest`: The image with the latest versions of PHP and Rector
*   `php<PHP_VERSION>-v<RECTOR_VERSION>`: The image with specific PHP and Rector versions (e.g., `php8.4-v2.1`)

## Development

The Docker image is built automatically by the GitHub Actions workflow defined in `.github/workflows/docker-publish.yml`. Any push to the `main` branch will trigger a new build and push to Docker Hub.
