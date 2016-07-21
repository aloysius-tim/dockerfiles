#!/bin/bash

. $testlib

function pageContains {
  local url=$1  # url to cURL
  local str=$2  # string that needs to be present
  local desc=$3 # Optional description of test

  if [ -z $desc ]; then
    desc="Page contains '"$str"' ("$url")"
  fi

  local page=$(curl --silent --show-error --request GET $url)
  if [ -z "$(echo $page | grep ${str})" ]; then
    echoFail $desc
  else
    echoPass $desc
  fi
}

$@
