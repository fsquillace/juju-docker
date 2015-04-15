To pull the image:

    docker pull feel/juju-docker

To build image:

    docker build -t feel/juju-docker .

To run container and generate the JuJu image in /tmp/juju-image:

    docker run --privileged -v /tmp/juju-image:/tmp/juju-image -t feel/juju-docker
