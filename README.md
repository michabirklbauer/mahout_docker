# Apache Mahout for Docker

Running [Apache Mahout](https://mahout.apache.org/) in [Docker](https://www.docker.com/).

The following will run Mahout in a Spark shell:

* **Docker Hub:**

  This image is also available on [Docker Hub](https://hub.docker.com/r/michabirklbauer/mahout):
  ```bash
  docker pull michabirklbauer/mahout:latest
  docker run -it michabirklbauer/mahout:latest
  ```

* **Building locally from Dockerfile:**

  To build locally, clone the repository and run docker build:
  ```bash
  git clone https://github.com/michabirklbauer/mahout_docker.git
  cd mahout_docker
  docker build . -t mahout
  docker run -it mahout
  ```

Try an example:
- [Playing with Mahout's Spark Shell](https://mahout.apache.org/docs/latest/tutorials/samsara/play-with-shell.html)

## Info

The Docker image runs the following Apache services:
- [Apache Mahout 0.14.2](https://mahout.apache.org/)
- [Apache Maven 3.6.3](https://maven.apache.org/)
- [Apache Hadoop 3.2.1](https://hadoop.apache.org/)
- [Apache Spark 3.0.1](https://spark.apache.org/)
