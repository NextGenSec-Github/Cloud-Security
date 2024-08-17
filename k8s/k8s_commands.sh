# Common Commands
kubectl run --generator=run-pod/v1 --rm mytest --image=busybox -it wget # Run wget test temporarily
kubectl run my-nginx --image=nginx --replicas=2 --port=80 --expose # Run nginx deployment with 2 replicas
kubectl run my-nginx --restart=Never --image=nginx --port=80 --expose # Run nginx pod and expose it
kubectl run my-nginx --image=nginx --port=80 --expose # Run nginx deployment and expose it
kubectl config get-contexts ~/.kube/config # List authenticated contexts
kubectl config set-context <context-name> --namespace=<ns-name> # Set namespace preference
kubetctl get pod -o wide # List pods with nodes info
kubectl get all --all-namespaces # List everything
kubectl get service --all-namespaces
kubectl get deployments --all-namespaces
kubectl get nodes --show-labels
kubectl get pods --all-namespaces -o json
