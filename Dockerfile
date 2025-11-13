# Étape 1 : Build du projet avec Maven
# utiliser une image Maven officielle (avec Java déjà installé).
FROM maven:3.9.6-eclipse-temurin-17 AS build

# De copier ton projet (y compris pom.xml et le dossier src) dans /app.
COPY . /app

# Aller dans le répertoire de travail
WORKDIR /app

# De compiler le code et créer un .jar (dans target/). Résultat : à la fin de cette étape, ton fichier .jar prêt à exécuter est dans /app/target/.
RUN mvn clean package

# Tu prends une image Java légère (sans Maven, donc plus rapide et plus petite).
FROM openjdk:17-jdk-slim

# Créer un dossier pour l'app
WORKDIR /app

# Tu copies uniquement le .jar depuis l’étape précédente.
COPY --from=build /app/target/*.jar app.jar

# Tu lances l’application Java. L’image finale contient uniquement ce qu’il faut pour exécuter ton appli — pas les outils de build.
CMD ["java", "-jar", "app.jar"]
