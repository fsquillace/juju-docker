
To build image:

    docker build -t fee/juju-docker .

To run container and generate the JuJu image in /tmp/juju-image:

    docker run --privileged -v /tmp/juju-image:/tmp/juju-image -t juju
