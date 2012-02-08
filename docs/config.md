# config.json options
dystopia uses nconf for its configuration.

database.host: the IP address to use 
database.port: the port to use
database.user: the database user
database.password: the database password

server.address: the server address
server.port: the port to listen on

# example config.json
    {
        "database": {
            "host": "127.0.0.1",
            "port": 5432,
            "user": "dystopia_db",
            "password": "foobarbaz1234"
        },
        "server": {
            "address": "127.0.0.1",
            "port": 8000
        }
    }


