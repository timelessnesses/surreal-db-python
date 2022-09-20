# surreal-db-python

A pure python (and compilable) database client for SurrealDB.

## Installation

1. Install with

```bash
pip install surreal-db-python
```

2. (Optional) You could make library pure python by set `SURREAL_BUILD_NO_COMPILE` enviroment variable to 1

## Usage

```py
import surreal

client = surreal.SurrealDB(
    host: str,
    username: str,
    password: str,
    db: str,
    namespace: str
)

client.execute("CREATE deez:nut SET nice = 69 + 420;")
client.fetch("SELECT * FROM deez:nut;")
```

## Features

- Supported Asynchronous Operation (with class `AsyncSurrealDB`) (`AsyncSurrealDB` have same API as `SurrealDB but you await them.)
- (not) Supported websocket (yet)
