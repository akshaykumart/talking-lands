## Solution for Question-3

steps:

1. Refer the following github repo for sample python (flask) app and kubernetes manifests

   ref: https://github.com/akshaykumart/talking-lands/new/main/Assignement-03

2. Create the docker image 

   `$ docker build -t akshaykumart/talking-landing:latest . `

   ![image](https://github.com/user-attachments/assets/6c18ebff-293b-4113-8174-f52273127859)


3. Verify the Image created 

   ` $ docker images `
   
   ![image](https://github.com/user-attachments/assets/e600ae2d-3f9c-457d-94a6-afb2c609baa8)


4. Push the docker image to registry ( dockerhub )

   ` $ docker push -t akshaykumart/talking-landing:latest`

   ![image](https://github.com/user-attachments/assets/bfcdd8e0-779e-403c-a980-aba7e0127bdd)

5. Create a deployment

    `$ kubectl apply -f deployment.yaml`

    `$ kubectl get deployments `

   ![image](https://github.com/user-attachments/assets/347c2f61-d610-4513-a6ad-a5ee214bd3f4)

6. Create the service 

   ` $ kubectl apply -f service.yaml `

   ` $ kubectl get svc `
  
   ![image](https://github.com/user-attachments/assets/240314fc-9087-40ac-915e-48c50e32dd0c)

7. Create the nginx-ingress controller 
   
   ` $ kubectl apply -f ingress.yaml `

   ` $ kubectl get ingress `

   ![image](https://github.com/user-attachments/assets/760a0f32-c892-419a-84a2-f514a241e6c3)

8. Create Horizontal Pod Autoscalar
  
   ` $ kubectl apply -f hpa.yaml `

   ` $ kubectl get hpa `

   ![image](https://github.com/user-attachments/assets/083859f3-1140-4354-83b5-bc828f254f64)

## Monitoring

1. Create the k8s manifests for prometheus deploymemt and service 

   ` $ kubectl create namespace monitoring `

   ` $ kubectl get namespace `

   ![image](https://github.com/user-attachments/assets/0f5dc543-7a5d-454c-bef3-3d1fe103b400)


   ` $ kubectl apply -f monitoring/prometheus-config.yaml `

   ` $ kubectl get config -n monitoring `

   ![image](https://github.com/user-attachments/assets/34d9a688-0e96-4b08-83cd-ff3be972f93e)


   ` $ kubectl apply -f monitoring/prom-deploy.yaml `
  
   ` $ kubectl get deployments -n monitoring `
 
   ` $ kubectl get pods -n monitoring `

   ![image](https://github.com/user-attachments/assets/caec54c6-00f4-4c9d-82e0-bde697aea41b)

   ` $ kubectl apply -f monitoring/prom-service.yaml `

   ` $ kubectl get svc -n monitoring `

   ![image](https://github.com/user-attachments/assets/58e31a0e-773b-445a-89af-a342e7c9fe01)






