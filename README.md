# docker-gcloud
Google Cloud SDK bundle with all components and dependencies

Currently **only** support pubsub-emulator component

## Run emulators in containers
Running emulators in a container provides an easy, predictable configuration for an emulator. You can always reuse a given configuration without needing to initialize the SDK with credentials. For example, the following starts up the pubsub emulator from a baseline SDK:

```
docker run --rm -t -p 8283:8283 mario/gcloud gcloud beta emulators pubsub start --host-port 0.0.0.0:8283
```

source:
https://medium.com/google-cloud/google-cloud-sdk-dockerfile-861a0399bbbb