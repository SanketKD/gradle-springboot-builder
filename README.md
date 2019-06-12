# s2i Builder for Springboot Gradle Applications
Build any Springboot Gradle Applications in OpenShift.

# Installed Contents
1.  Java 1.8.0
2.  Gradle 3.5.1

# How to use
Use this image for deploying Springboot Applications which use Gradle as build tool.

[Docker Image](https://hub.docker.com/r/sanketkd/gradle-springboot-builder/ "Docker Hub") : sanketkd/gradle-springboot-builder:1

	oc new-app sanketkd/gradle-springboot-builder:1~<your-git-repository-url>#<branch-name>

This will create new build config and deployment configs and a service which exposes 8080 port.
