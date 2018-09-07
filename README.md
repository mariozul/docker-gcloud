# docker-gcloud
Google Cloud SDK bundle with all components and dependencies

## Run emulators in containers
Running emulators in a container provides an easy, predictable configuration for an emulator. You can always reuse a given configuration without needing to initialize the SDK with credentials. For example, the following starts up the pubsub emulator from a baseline SDK:
```
docker run --rm -t \
    -p 8283:8283 \
    mariozul/docker-gcloud \
    gcloud beta emulators pubsub start --host-port 0.0.0.0:8283
```

## Installing additional components
This images do not contain additional components pre-installed. You can extend these images by following
the instructions below:

- Create a Dockerfile that uses the gcloud image as the base image. For example, to add pubsub emulators
components:
``` FROM mariozul/gcloud ```

And run:
``` docker build --build-arg INSTALL_PUBSUB=true -t my-gcloud-docker . ```

Note that in this case, you have to install dependencies of additional components manually.

__Currently **only** support pubsub-emulator component__

source: https://medium.com/google-cloud/google-cloud-sdk-dockerfile-861a0399bbbb