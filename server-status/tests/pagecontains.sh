#!/bin/bash

. $testlib

function pageContains {
  local curlOptions="--silent --show-error --request GET"
  curlCheck "$curlOptions" $FUNCNAME "$@"
}

pageContains "$@"
