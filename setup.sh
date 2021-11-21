#curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
#chmod +x ./kubectl
#sudo mv ./kubectl /usr/local/bin/kubectl
#curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
#sudo install minikube-linux-amd64 /usr/local/bin/minikube

minikube start
#installation de metallb
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# connect docker env with kubernetes
sleep 2
eval $(minikube -p minikube docker-env)
# creation des images pour docker
docker build -t "nginx_image" ./srcs/nginx
docker build -t "mysql_image" ./srcs/mysql
docker build -t "wordpress_image" ./srcs/wordpress
docker build -t "phpmyadmin_image" ./srcs/phpmyadmin
docker build -t "ftps_image" ./srcs/ftps
docker build -t "influxdb_image" ./srcs/influxdb
docker build -t "telegraf_image" ./srcs/telegraf
docker build -t "grafana_image" ./srcs/grafana
#fichier de config de metallb
kubectl apply -f config.yaml
#deployement grace aux .yamls des images
kubectl apply -f srcs/
