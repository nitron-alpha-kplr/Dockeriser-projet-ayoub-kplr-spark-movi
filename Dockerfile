# Utilisez une image de base adaptée à votre projet
FROM openjdk:8-jre

# Définissez le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copiez les fichiers du projet dans le conteneur
COPY . /app

# Installez les dépendances et compilez le projet (ajustez selon les besoins)
RUN ./gradlew build

# Commande pour exécuter l'application lorsque le conteneur démarre
CMD ["./gradlew", "bootRun"]
