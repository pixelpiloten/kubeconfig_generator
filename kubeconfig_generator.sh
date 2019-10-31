#!/bin/sh

KUBERNETES_HOST=$1
KUBERNETES_USER=$2
KUBERNETES_CA=$3
KUBERNETES_TOKEN=$4

cat << EOF > /tmp/kubeconfig
apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: ${KUBERNETES_CA}
    server: ${KUBERNETES_HOST}
contexts:
- name: default-context
  context:
    cluster: default-cluster
    user: ${KUBERNETES_USER}
current-context: default-context
users:
- name: ${KUBERNETES_USER}
  user:
    token: ${KUBERNETES_TOKEN}
EOF