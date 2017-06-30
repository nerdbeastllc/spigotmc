# Use latest alpine and open jdk-8
FROM openjdk:8-jdk-alpine

RUN apk update \
&& apk add git curl nano \
&& curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar \
&& java -jar BuildTools.jar \
&& touch eula.txt && touch server.properties \
&& echo "eula=true" >> eula.txt

EXPOSE 25565

CMD java -Xmx1024M -Xms1024M -jar craft*.jar
