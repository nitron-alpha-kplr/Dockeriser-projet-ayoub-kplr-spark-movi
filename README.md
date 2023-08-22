# Dockeriser-projet-ayoub-kplr-spark-movie ;

captain log du 22 aout 2023 :

1/Cloner le dépôt :
git clone https://github.com/ayoub-kplr/spark-movie.git

# Utiliser une image de base Spark
FROM bitnami/spark:3.0.0

# Passage à l'utilisateur root
USER root

# Mise à jour et installation des paquets nécessaires
RUN apt-get update && \
    apt-get -y install git default-jre default-jdk wget

# Modifie le dossier de travail
WORKDIR /root

# Clonage du dépôt GitHub
RUN git clone https://github.com/mehdi-lamrani/spark-movie.git

# Installation de packages Python
RUN pip3 install CherryPy Flask Cython pandas findspark

# Modification du fichier index.js
RUN sed -i "s/localhost/$(curl http://checkip.amazonaws.com)/g" /root/spark-movie/static/index.js

# Modifie le dossier de travail
WORKDIR /root/spark-movie

# Lance le serveur
CMD ["spark-submit", "server.py", "/root/spark-movie/ml-latest/movies.csv", "/root/spark-movie/ml-latest/ratings.csv"]

# Expose le port 5432
EXPOSE 5432

docker build -t spark-movie-image .
12 h 16
docker run -p 5432:5432 -it spark-movie-image
