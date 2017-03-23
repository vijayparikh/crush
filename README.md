# Crush
#### A simple, self-contained, serverless, zero-configuration, json document store.

<img align="left" src="http://vignette4.wikia.nocookie.net/disney/images/3/30/Crush-FN.png/revision/latest?cb=20131111065956" width="25%"/> Crush sandboxes the current working directory similar to SQLite. The crush data directory is named `crush.data` by default, and each json document is saved pretty printed as a uuid.

While this is not the speediest of storage soultion it is simple - with the benefit that all data is stored as plain text in the file system.

## Configuration

You may optionally set the path to the data directory. It defaults to `$PWD/cursh.data` but can manually be set with the `CRUSH_DATA_DIR` environment variable.

````
# default
export CRUSH_DATA_DIR="$PWD"/crush.data

# manually set the data directory path
export CRUSH_DATA_DIR=/tmp/crush.data
````

## Commands

### set

> set \<json\> - Writes a json document and returns the document id

````
➜ crush set '{"name":"John Doe","active":true,"permissions":{"read":true,"write":false}}'
666B81D6-3F8A-4D57-BA3F-11FA8FC47246
````

`set` also supports piping into it:

````
echo '{"key":"value"}' | crush set
4472B861-4C10-4C0A-A63B-E5D45AA679C0
````
````
cat foobar.json | crush set
9DF4DC1F-121E-46DC-B580-E1663B645AED
````

### get

> get \<document-id\> - Retrieves a json document by document id

````
➜ crush get 666B81D6-3F8A-4D57-BA3F-11FA8FC47246
{
    "active": true,
    "name": "John Doe",
    "permissions": {
        "read": true,
        "write": false
    }
}
````

### count

> count - Total number of json documents in the database

````
➜ crush count
293
````

### delete

> delete \<document-id\> - Deletes a json document by document id

````
➜ crush delete 666B81D6-3F8A-4D57-BA3F-11FA8FC47246
````

### drop

> drop (--force) - Drops the database

````
➜ crush drop
Drop database '/tmp/crush.data'? [Y/n] Y
````

````
➜ crush drop --force
````

### help

> help - Displays help

````
➜ crush help
Usage: crush command <command-specific-options>

  set <json>             Writes a json document and returns a document id
  get <document-id>      Retrieves a json document by document id
  count                  Total number of json documents in the database
  delete <document-id>   Deletes a json document by document id
  drop (--force)         Drops the database
  help                   Displays help
  version                Displays the current version

````

### version

> version - Displays the current version

````
➜ crush version
1.1.0
````

### default

> default - Displays the current version, configuration, and help

```
➜ crush
crush 1.1.0
  data directory path: /tmp/crush.data

Usage: crush command <command-specific-options>

  set <json>             Writes a json document and returns a document id
  get <document-id>      Retrieves a json document by document id
  count                  Total number of json documents in the database
  delete <document-id>   Deletes a json document by document id
  drop (--force)         Drops the database
  help                   Displays help
  version                Displays the current version

```

## Support, Bugs, And Feature Requests

Create issues here in GitHub (https://github.com/vijayparikh/crush/issues).

## Versioning

For transparency and insight into the release cycle, and for striving to maintain backward compatibility, crush will be maintained under the semantic versioning guidelines.

Releases will be numbered with the follow format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

+ Breaking backward compatibility bumps the major (and resets the minor and patch)
+ New additions without breaking backward compatibility bumps the minor (and resets the patch)
+ Bug fixes and misc changes bumps the patch