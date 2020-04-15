#!/bin/bash -e
IMAGE=$1

if [ -z "$IMAGE" ]; then
  echo "Usage: $0 IMAGE"
  exit 1
fi

echo "IMAGE="${IMAGE}
docker manifest create ${IMAGE} ${IMAGE}-amd64 ${IMAGE}-ppc64le ${IMAGE}-s390x
docker manifest annotate ${IMAGE} ${IMAGE}-amd64   --os linux --arch amd64
docker manifest annotate ${IMAGE} ${IMAGE}-ppc64le --os linux --arch ppc64le
docker manifest annotate ${IMAGE} ${IMAGE}-s390x   --os linux --arch s390x
docker manifest inspect ${IMAGE}
docker manifest push ${IMAGE} -p
