#!/bin/bash

. $testlib

function headerContains {
  local curlOptions="--head --silent --show-error --request GET"
  curlCheck "$curlOptions" $FUNCNAME "$@"
}

headerContains "$@"
