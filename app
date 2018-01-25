#!/bin/bash
#!/

if [ "$1" = "" ]
then
  echo ""
  echo "Usage: app <command>"
  echo ""
  echo "e.g. "
  echo "./app status"
  echo ""
  echo ""
  echo "General Commands:"
  echo ""
  echo "deploy ............. Build containers for production without using cache"
  echo "force-deploy ....... Build containers for production without using cache"
  echo "build .............. Build containers for development"
  echo "force-build ........ Build containers for development without using cache"
  echo "watch .............. Bring container up and attached"
  echo "start .............. Bring container up and dettached"
  echo "stop ............... Stop containers"
  echo "status ............. Container status"
  echo "prune .............. Prune containers, images, cache etc."
  echo "killall ............ Halt all containers"
  echo "remove-images ...... Erase all images"
  echo "shell .............. Start a bash shell"
  echo ""
  echo ""
  echo "Specialized Commands:"
  echo ""
  echo "artisan ............ Run Laravel artisan command"
  echo "composer ........... Run php composer"
  echo "npm ................ Run NPM command"
  echo ""
  echo ""
  echo ""
  echo "Examples:"
  echo ""
  echo "./app build"
  echo "./app start"
  echo "./app status"
  echo "./app stop"
  exit 0
fi


if [ "$1" = "deploy" ]
then
  echo "Building containers for production using cache"
  docker-compose -f docker-compose.yml build --no-cache
fi

if [ "$1" = "force-deploy" ]
then
  echo "Building containers for production without using cache"
  docker-compose -f docker-compose.yml build --no-cache
fi

if [ "$1" = "force-build" ]
then
  echo "Building containers without using cache"
  export XDEBUG_HOST=$(ipconfig getifaddr en0)
  docker-compose -f docker-compose.yml -f docker-compose-local.yml build --no-cache
fi

if [ "$1" = "build" ]
then
  echo "Builiding containers"
  export XDEBUG_HOST=$(ipconfig getifaddr en0)
  docker-compose -f docker-compose.yml -f docker-compose-local.yml build
fi

if [ "$1" = "watch" ]
then
  echo "Bringing containers online"
  export XDEBUG_HOST=$(ipconfig getifaddr en0)
  docker-compose -f docker-compose.yml -f docker-compose-local.yml up
fi

if [ "$1" = "start" ]
then
  echo "Starting containers"
  export XDEBUG_HOST=$(ipconfig getifaddr en0)
  docker-compose -f docker-compose.yml -f docker-compose-local.yml up -d
fi

if [ "$1" = "stop" ]
then
  echo "Stopping containers"
  docker-compose stop
fi

if [ "$1" = "status" ]
then
  echo "Stopping containers"
  docker ps
fi

if [ "$1" = "prune" ]
then
  echo "Removing all unused containers, images, cache, networks etc."
  docker system prune
fi

if [ "$1" = "kill-all" ]
then
  echo "Killing all containers"
  docker kill $(docker ps -q)
fi

if [ "$1" = "remove-images" ]
then
  echo "Erasing all images"
  docker rmi -f $(docker images -q)
fi



if [ "$1" = "artisan" ]
then
  echo "Running Laravel PHP artisan command"
  docker exec -it php bash -c 'cd /var/www/html/current/ && php artisan $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20}'
fi

if [ "$1" = "composer" ]
then
  echo "Running composer"
  docker exec -it php bash -c 'cd /var/www/html/current/ && composer $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20}'
fi

if [ "$1" = "npm" ]
then
  echo "Running NPM"
  docker exec -it php bash -c 'cd /var/www/html/current/ && npm $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20}'
fi

if [ "$1" = "bash" ]
then
  echo "Jumping into php container"
  docker exec -it php bash
fi
