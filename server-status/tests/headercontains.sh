#!/bin/bash

. $testlib

function headerContains {
  local url=$1  # url to cURL
  local str=$2  # string that needs to be present
  local desc=$3 # Optional description of test
  local inv=$4  # inverse operation if set
  
  if [ "$inv" != "" ]; then
    local inv=!
  fi

  if [ -z $desc ]; then
    local desc="URL HEADERS contain '"$str"' ("$url")"
  fi

  local headers=$(curl --head --silent --show-error --request GET $url)
  if [ $inv -z "$(echo $headers | grep ${str})" ]; then
    echoFail $desc
  else
    echoPass $desc
  fi
}

headerContains $@
