
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

Running the local (development) environment
```
docker-compose -f docker-compose.yml -f docker-compose-local.yml up
```

Running the production environment
```
docker-compose -f docker-compose.yml -d up
```

Postgres is available on port 5432.
Remember to create your database as needed.
