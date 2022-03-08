# Build Demo Application
The demo application contains two simple webserver applications, one serving _"coffee"_, the other _"tea"_, and is based on the [nginxinc/ingress-demo](https://hub.docker.com/r/nginxinc/ingress-demo) container image. To build the application container images, follow the steps listed below:

1. Clone the repo.
   
   ```bash
   [user@host] git clone https://github.com/RafaySystems/presales-ci-cd-pipeline.git
   ```

2. Navigate to the `build` directory and run the `build.sh` shell script.
   
   ```bash
   [user@host] cd build
   [user@host] ./build.sh
   
   Usage: build.sh [required] [optional]
   
     Required:
      --registry                  registry fqdn (eg, registry.example.com)
     
     Optional:
       --push                      push image to repository
       --repo-name                 repository name (default: ci-cd-demo-app)
       --unprivileged              build unprivileged container
   ```
   
   Provide the registry FQDN using the `--registry` flag.
   
   Optionally specify a repository name by using the `--repo-name` flag. If no name 
   is provided, the default image name is `ci-cd-demo-app`).
   
   Use the `--push` flag to push the container image to your registry.
   
   Use the `--unprivileged` flag to create an unprivileged version of the container
   image (listens on ports `8080` and `8443`).
   
3. Example:
   
   ```bash
   [user@host] ./build.sh --registry registry.example.com --repo-name demo-app \
       --unprivileged --push
   ```
