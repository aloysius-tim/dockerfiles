#!/bin/bash

function echoPass {
  echo -e '\e[32mPASS\e[39m\t'$@
}
function echoFail {
  echo -e '\e[31mFAIL\e[39m\t'$@
}