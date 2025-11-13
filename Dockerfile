# Étape 1 : Build du projet avec Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Copier le contenu du projet dans l'image
COPY . /app

# Aller dans le répertoire de travail
WORKDIR /app

# Compiler et empaqueter le projet (génère un fichier .jar dans target/)
RUN mvn clean package

# Étape 2 : Image d'exécution légère
FROM openjdk:17-jdk-slim

# Créer un dossier pour l'app
WORKDIR /app

# Copier le jar depuis l'étape précédente
COPY --from=build /app/target/*.jar app.jar

# Exécuter le jar
CMD ["java", "-jar", "app.jar"]
