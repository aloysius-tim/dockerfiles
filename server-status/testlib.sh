#!/bin/bash

function msgPass {
  echo -e '\e[32mPASS\e[39m\t'$@
  echo $@ >> $passedLogFile
}
function msgFail {
  echo -e '\e[31mFAIL\e[39m\t'$@
  echo $@ >> $failedLogFile
}

function curlCheck {
  local curlOptions=$1
  local actionName=$2
  local url=$3  # url to cURL
  local str=$4  # string that needs to be present
  local desc=$5 # Optional description of test
  local inv=$6  # inverse operation if set
#  echo Entering $FUNCNAME with url=$url str=$str desc=$desc inv=$inv

  #  if [ "$inv" != "" ]; then
  #    local inv=!
  #  fi
    # the same code as the commented above, but only more sleek
    [[ -n $inv ]] && local inv=!

    local msg=$actionName" "$inv$str" "$url" "$desc

    local curled=$(curl $curlOptions $url)
    local output=$(echo $curled | grep "$str")
    if [ $inv -z "$output" ]; then
      msgFail $msg
    else
      msgPass $msg
    fi
}
