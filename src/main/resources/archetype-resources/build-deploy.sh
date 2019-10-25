#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
#!/bin/sh
#deploy="false"
deploy="true"

image=${artifactId}
version=${version}
latest=true

#OPTIONS="--no-cache --force-rm"
#OPTIONS="--no-cache"
#OPTIONS="--force-rm"
OPTIONS=""

docker build ${OPTIONS} -t ${docker-hub-name}/${image}:${version} .
if [ "$?" -eq 0 ] && [ ${deploy} == "true" ]; then
    docker push ${docker-hub-name}/${image}:${version}
    if [ "$latest" == "true" ]; then
        docker tag ${docker-hub-name}/${image}:${version} ${docker-hub-name}/${image}:latest
        docker push ${docker-hub-name}/${image}:latest
    fi
fi