# openshift-buildconfig-sample


## Pre-requisites

- To have an OpenShift instance with access to it.


## Steps

- Create a namespace:

  ```sh
  oc new-project hello-world
  ```

- Generate a key-pair:

  ```ssh
  ssh-keygen -t rsa -b 4096 -C "builder@example.com" -f deployer_key -P ""
  ```

- Add the jusr generated public key as a Deploy key on your GitHub repository.

- Create a secret for your private key by:

  ```sh
  oc create secret generic github-deployer \
    --from-file=ssh-privatekey=./deployer_key \
    --from-file=./known_hosts \
    --type=kubernetes.io/ssh-auth
  ```

- Try to build the image by:

  ```sh
  oc new-build . --source-secret github-deployer
  ```

- Launch a build by:

  ```sh
  oc start-build openshift-buildconfig-sample 
  ```

- Deploy the image by:

  ```sh
  oc new-app --image-source openshift-buildconfig-sample
  ```

## References

- https://docs.openshift.com/container-platform/4.10/cicd/builds/creating-build-inputs.html#builds-source-secret-ssh-key-auth_creating-build-inputs
- https://docs.openshift.com/container-platform/4.10/cicd/builds/triggering-builds-build-hooks.html#builds-using-github-webhooks_triggering-builds-build-hooks

