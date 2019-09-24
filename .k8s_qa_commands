#! /bin/bash

# General aliases
alias g='grep'
alias f1="awk '{print \$1}'"

# Kubernetes
alias k='kubectl'
alias kl='kellogs'
alias ke='k_exec'
alias kp='get_pods'

function get_pods() {
  if [ -z "$1" ]; then
    k get pods
  else
    k get pods | grep $1
  fi
}

function k_exec() {
  POD=$(find_pod $1 $2)
  echo "Connecting to POD: $POD"
  kubectl exec -it $POD /bin/bash
}

function kellogs() {
  POD=$(find_pod $1 $2)
  echo "Tailing logs of POD: $POD"
  kubectl log -f $POD
}

function find_pod() {
  if [ -z "$2" ]; then
    POD=$(kubectl get pods | grep $1 | head -1 | awk {'print $1'})
  else
    POD=$(kubectl get pods | grep $1 | grep $(find_env $2) | head -1 | awk {'print $1'})
  fi
  if [ -z "$POD" ]; then
    echo "ERROR: No matching pod found"
    exit 1
  else
    echo $POD
  fi
}

function find_env() {
  if echo $1 | grep -iqF "qa"; then
    echo $1
  else
    echo "qa${1}"
  fi
}
