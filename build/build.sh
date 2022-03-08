#!/bin/sh

if [ $# -lt 2 ]; then
  printf "\n  Usage: ${0##*/} [required] [optional]\n\n"
  printf "    Required:\n"
  printf "      --registry                  registry fqdn (eg, registry.example.com)\n\n"
  printf "    Optional:\n"
  printf "      --push                      push image to repository\n"
  printf "      --repo-name                 repository name (default: ci-cd-demo-app)\n"
  printf "      --unprivileged              build unprivileged container\n\n"
  exit 1
fi

while [ $# -gt 0 ]; do
  case "$1" in
    "--push" )
        push=true
        shift;
        ;;
    "--registry" )
        registry=$2
        shift; shift
        ;;
    "--repo-name" )
        repo_name=$2
        shift; shift
        ;;
    "--unprivileged" )
        unprivileged=true
        shift;
        ;;
    * )
        printf "\n  Invalid argument: $1\n\n"
        exit 1
        ;;
  esac
done

if [ -z "${repo_name}" ]; then
  repo_name=ci-cd-demo-app
fi

if [ "${unprivileged}" == "true" ]; then
  dockerfile=Dockerfile.unprivileged
  tag=unprivileged-latest
else
  dockerfile=Dockerfile
  tag=latest
fi

docker build -f ${dockerfile} -t ${registry}/${repo_name}:${tag} .

if [ "${push}" == "true" ]; then
  docker push ${registry}/${repo_name}:latest
fi
