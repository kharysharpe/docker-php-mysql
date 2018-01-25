
DEVELOPMENT

*NB* Document Root is `webapp/current/public`

You must place your PHP application within this folder

Why? This allows for continuous deployment in production using zero downtime techniques. e.g. Envoyer. Zero downtime method pulls code from a repository into a new folder and then creates a symbol link to `current` to this new folder.

*Generic PHP*
```
mkdir -p webapp/current/public
```


*Setting up for Laravel*
```
cd webapp
laravel new current

```

*From a git repository*
```
cd webapp
git clone http://repo current

```

*Wordpress*
```
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz -C webapp/current/public
rm -f latest.tar.gz
```

Building
Running the local (development) environment
```
./app build
```

Running the local (development) environment
```
./app watch
```

Running the local (development) environment detached
```
./app dev
```

Building the production environment
```
./app deploy
```

Running the production environment
```
./app start
```

Switching to php container
```
./app bash
```


Postgres is available on port 5432, database `webapp` is created by default.


