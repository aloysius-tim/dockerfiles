#!/bin/bash
# https://api.slack.com/incoming-webhooks
set -e

[[ -z "$1" ]] \
  && echo "docker run -it --rm \
    superbuddy/slack-push https://hooks.slack.com/services/xx/xx/xx \
    channel \
    uname \
    icon \
    msg" \
  && exit 1

url=$1; shift

channel='general'
[[ -n "$1" ]] && channel=$1; shift

uname='slack-push'
[[ -n "$1" ]] && uname=$1; shift

icon=':speech_balloon:'
[[ -n "$1" ]] && icon=$1; shift

msg="You can set various icons from slack;\n:white_check_mark: for passing tests\n:interrobang:, :warning:, :x: or :fire: for failing tests\n:package: or :whale2: for your docker status\n"
[[ -n "$@" ]] && msg=$@

data='{"text":"'$msg'","username":"'$uname'","icon_emoji":"'$icon'","channel":"#'$channel'"}'

curl -X POST -H 'Content-type: application/json' --data "$data" $url
