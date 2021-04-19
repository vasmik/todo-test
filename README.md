# TODO Test

API server for coding test for a front-end engineer.

Prerequisites:

- Docker for desktop ([Mac](https://docs.docker.com/docker-for-mac/install/), [Windows](https://docs.docker.com/docker-for-windows/install/))


To start working:

1. Clone the project
    ```bash
    git clone https://github.com/vasmik/todo-test.git
    ```
2. Start API server:

    ```bash
    cd todo-test
    docker-compose up
    ```
3. API is up and running on http://localhost:8080/api
4. See the API specification on https://app.swaggerhub.com/apis/vasmik/todo-public_api/1.0.0
5. Use the following auth credentials: `user1` / `P@ssw0rd1`


To check if service works:

1. Login:

   ```bash
   curl -X POST -u user1:P@ssw0rd1 http://localhost:8080/api/auth/login
   ```

   output:
   ```
   {"apiKey":"XDaPMouI4SXOGfcTFVQxQraXwOLtjdbAfH5VIFsbUklvjtoc3O0ZToUQLUJ1-SWj"}
   ```

2. Use the token to get lists:

   ```bash
   curl -H "Authorization: Bearer XDaPMouI4SXOGfcTFVQxQraXwOLtjdbAfH5VIFsbUklvjtoc3O0ZToUQLUJ1-SWj" http://localhost:8080/api/lists
   ```

   output:
   ```
   [{"id":1,"name":"User 1 TODO list 1","tasks":2},{"id":11,"name":"User 1 TODO list 2","tasks":1}]
   ```