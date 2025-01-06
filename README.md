#kubectl delete all --all
#kubectl get pod podName -n kube-system -o yaml
#kubectl describe nodes | grep "Taints"
# Node Selector  Node Affinity And Taints,Tolerations
# kubectl get nodes
# kubectl get nodes --show-labels
# kubectl describe node <nodeId>
# kubectl desscribe nodes | grep "Taints"
# kubectl label nodes <nodeId/Name> node=workerone
# kubectl taint nodes  <node> node=HatesPods:NoSchedule
#kubectl taint nodes  <node> node=HatesPods:NoSchedule

stage('QA approve') {
       steps {
         notifySlack("Do you approve QA deployment? $registry/job/$BUILD_NUMBER", notification_channel, [])
           input 'Do you approve QA deployment?'
           }
       }

       apiVersion: apps/v1
       kind: Deployment
       metadata:
         name: maven-app
       spec:
         replicas: 2
         selector:
           matchLabels:
             app: maven-app
         strategy:
           type: RollingUpdate
           rollingUpdate:
             maxSurge: 1
             maxUnavailable: 1
         minReadySeconds: 60
         template:
           metadata:
             name: maven-app
             labels:
               app: maven-app
           spec:
             containers:
             - name: maven-app
               image: image_version_update
               ports:
               - containerPort: 8080
               # readinessProbe:
               #   httpGet:
               #     path: /mss-maven-web-app
               #     port: 8080
               #   initialDelaySeconds: 5
               #   timeoutSeconds: 1
               #   periodSeconds: 15
               # livenessProbe:
               #   httpGet:
               #     path: /mss-maven-web-app
               #     port: 8080
               #   initialDelaySeconds: 15
               #   timeoutSeconds: 1
               #   periodSeconds: 15
