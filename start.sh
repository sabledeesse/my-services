minikube start
minikube addons enable metallb
eval $(minikube -p minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/telegraf/telegraf-config.yaml
kubectl apply -f ./srcs/telegraf/telegraf.yaml
kubectl apply -f ./srcs/influxDb/influxdb-config.yaml
kubectl apply -f ./srcs/influxDb/influxdb.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/nginx.yaml
docker build -t service_mysql ./srcs/mysql/.
docker build -t service_wordpress ./srcs/wordpress/.
docker build -t service_pma ./srcs/phpmyadmin/.
docker build -t service_inf ./srcs/influxDb/.
docker build -t service_tel ./srcs/telegraf/.
docker build -t service_graf ./srcs/grafana/.
docker build -t service_ftps ./srcs/ftps/.
docker build -t service_nginx ./srcs/nginx/.