# create pod
kubectl create -f filename.yaml

# get pods
kubectl get pods

# describe pod
kubectl describe podname

# run pod with nginx image
kubectl run nginx --image nginx

# command to list all pods along with their node placement
kubectl get pods -o wide

# get all nodes from cluster
kubectl get nodes

# get pod definition to a file if pod definition file is not given
kubectl get pod <pod-name> -o yaml > pod-definition.yaml

# To modify the properties of the pod
kubectl edit pod <pod-name>

### replicationcontroller

# To view Replication Controller
kubectl get replicationcontroller
kubectl get rc

### replicaset
# practice -> https://uklabs.kodekloud.com/topic/replicasets-2/

# To view replicaset
kubectl get replicaset
kubectl get rs

# Scale RS from CLI
kubectl scale --replicas=3 -f .\replica-set-definition.yaml
kubectl scale rs new-replica-set --replicas=5

# delete Replicaset
kubectl delete replicaset new-replicaset

# edit Replicaset
kubectl edit replicaset new-replica-set


### Formatting Output with kubectl
# https://kubernetes.io/docs/reference/kubectl/
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/

kubectl [command] [TYPE] [NAME] -o <output_format>

# Output a YAML formatted API object.
kubectl get pods -o yaml

# Output in the plain-text format with any additional information.
kubectl get pods -o wide

# Output a JSON formatted API object
kubectl get pods -o json

# Print only the resource name and nothing else.
kubectl get pods -o name


### NameSpaces
# https://uklabs.kodekloud.com/topic/namespaces-3/

# get all pods from all namespaces
kubectl get pods --all-namespaces
kubectl get pods -A

# get pods from a namespace
kubectl get pods -n dev

# get all namespaces
kubectl get namespaces

# run pod with namespace
kubectl run nginx --image nginx --namespace pro

# change current context
# this will get current context and will update the current to desired
kubectl config set-context $(kubectl config current-context) --namespace=prod

# get only details of blue from list
kubectl get pods --all-namespaces | grep blue



#### Imperative Commands
# https://kubernetes.io/docs/reference/kubectl/conventions/
# https://uklabs.kodekloud.com/topic/imperative-commands/

# dry-run=client option. This will not create the resource. Instead, tell you whether the resource can be created and if your command is right.
kubectl run nginx --image nginx --dry-run=client

# -o yaml: This will output the resource definition in YAML format on the screen.
kubectl get pods nginx -o yaml > def.yaml

# crate pod with imperial commands
kubectl run busybox --image=busybox --dry-run=client -o yaml > busybox.yaml

# create pod with tier
kubectl run redis --image=redis:alpine --labels=tier=db



kubectl expose pod redis --port=6379 --name redis-service
kubectl create deployment webapp --image=kodekloud/webapp-color --replicas=3
kubectl run custom-nginx --image=nginx --port=8080
kubectl create deployment redis-deploy --image=nginx --namespace=dev-ns --replicas=2
kubectl run httpd --image=httpd:alpine --port=80 --expose
kubectl run httpd --image=httpd:alpine --port=80 --expose



#### Docker


# sleep 3 will override command provided in CMD fields
# CMD [ "sleep", "15" ]
docker run ubuntu_sleep sleep 3

# This will append cmd value 10 and command will be sleep 10
# ENTRYPOINT [ "sleep" ]
docker run ubuntu_sleep 10

# If we want to add default value to the entrypoint
# ENTRYPOINT [ "sleep" ]
# CMD [ "15" ]
docker run ubuntu_sleep
docker run ubuntu_sleep 3

# change entrypoint on runtime
docker run --entrypoint sleep ubuntu_sleep 3

### command = Entrypoint in K8S
### args = CMD in k8s

# Edit a pod
kubectl edit pod <pod name>

# Get definition of existing pod in a file
kubectl get pod webapp -o yaml > my-new-pod.yaml

# force update the pod definition
kubectl replace --force -f /path to file

# pass args to cntainer after --
kubectl run nginx --image nginx -- sleep 4
kubectl run nginx --image nginx --dry-run=client -o yaml -- sleep 4

# pass command to container
kubectl run nginx --image nginx -- sleep 4
kubectl run nginx --image nginx --dry-run=client -o yaml --command sleep -- 4



### congig Map

# get configMap
kubectl get configmap
kubectl get cm

# create config map from imerative commands
kubectl create configmap my-config --from-literal=ENV=dev --from-literal=PORT=1000

# describe configmap
kubectl get cm my-config-new -o json