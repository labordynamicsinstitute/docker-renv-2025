#!/bin/bash

. ../.myconfig.sh

[[ -z $1 ]] && tag=$(date +%F) || tag=$1

# where are we
weare=${PWD##*/}

if [[ "$weare" == "build" ]]
then
  cd ..
fi

DOCKER_BUILDKIT=1 docker build  . \
  -f build/Dockerfile \
  -t ${dockerrepo}:$tag

echo "Ready to push?"
echo "  docker push  ${dockerrepo}:$tag"
read answer
case $answer in 
   y|Y)
   docker push  ${dockerrepo}:$tag
   ;;
   *)
   exit 0
   ;;
esac

docker tag ${dockerrepo}:$tag ${dockerrepo}:latest
docker push ${dockerrepo}:latest
