# Get Buildable Recipe

[![sponsor the project](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&link=https://github.com/sponsors/defcronyke)](https://github.com/sponsors/defcronyke) [![github-pipeline](https://github.com/defcronyke/get-buildable-recipe/workflows/github-pipeline/badge.svg)](https://github.com/defcronyke/get-buildable-recipe/actions) [![pipeline status](https://gitlab.com/defcronyke/get-buildable-recipe/badges/master/pipeline.svg)](https://gitlab.com/defcronyke/get-buildable-recipe/-/pipelines)

---

Copyright (c) 2021 `Jeremy Carter <jeremy@jeremycarter.ca>`

Get Buildable recipe in JSON format.

---

## Automated builds from the master branch

### Release Binary

- [Linux x86_64 (GitLab mirror)](https://gitlab.com/defcronyke/get-buildable-recipe/-/jobs/artifacts/master/download?job=release-linux-x86_64)
- [Linux x86_64 (GitHub mirror)](https://tinyurl.com/github-artifact?repo=defcronyke/get-buildable-recipe&file=get-buildable-recipe-release-linux-x86_64)

### Debug Binary

- [Linux x86_64 Debug (GitLab mirror)](https://gitlab.com/defcronyke/get-buildable-recipe/-/jobs/artifacts/master/download?job=debug-linux-x86_64)
- [Linux x86_64 Debug (GitHub mirror)](https://tinyurl.com/github-artifact?repo=defcronyke/get-buildable-recipe&file=get-buildable-recipe-debug-linux-x86_64)

NOTE: After downloading and extracting from the GitHub mirror, you need to run the following commands because GitHub Actions isn't preserving the correct permissions for the files:

```shell
cd get-buildable-recipe && chmod 755 *
```

---

## (Optional) Clone the source code with git

```shell
git clone https://github.com/defcronyke/get-buildable-recipe.git && \
cd get-buildable-recipe
```

---

## Run the program

- Automated build version:

  ```shell
  ./get-buildable-recipe
  ```

- Git source version:

  ```shell
  ./serve.sh
  ```

---

## Usage

Headers:

`Authorization: Bearer ...`

Request Route:

`GET /?url={recipe_page_id}&api={recipe_api_id}`

Example:

```shell
curl -H 'Authorization: Bearer ...' 'http://127.0.0.1:8080?url={recipe_page_id}&api={recipe_api_id}'
```

Online Version:

```shell
curl -H 'Authorization: Bearer ...' 'https://get-buildable-recipe-ytyzuol74q-uk.a.run.app?url={recipe_page_id}&api={recipe_api_id}'
```

---

## Build and run the Docker container

- Build the dependencies image:

  ```shell
  ./deps.sh
  ```

- Build the production image:

  ```shell
  ./prod.sh
  ```

- Run the Docker container:

  ```shell
  ./start.sh
  ```

- Stop the Docker container when finished:

  ```shell
  ./stop.sh
  ```
