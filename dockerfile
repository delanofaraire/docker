# Utilisez une image de base contenant les outils nécessaires
FROM alpine:latest

# Installez les dépendances requises pour Minikube
RUN apk add --update curl bash

# Téléchargez et installez Minikube
RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
    chmod +x minikube && \
    mv minikube /usr/local/bin/

# Définissez le répertoire de travail
WORKDIR /app

# Copiez votre fichier de configuration de cluster Kubernetes dans le conteneur
COPY config /root/.kube/config

# Exécutez Minikube en tant que point d'entrée par défaut
CMD ["minikube", "start"]
