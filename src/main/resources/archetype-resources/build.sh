#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
#!/bin/sh
mvn clean package
docker build -t ${docker-hub-name}/${artifactId} .
