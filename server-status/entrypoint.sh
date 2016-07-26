#!/bin/bash
set -e

mountedVolume=/totest
testsCopiedIntoDocker=/usr/lib/defaultTests

if [ -z "$(ls -A "$mountedVolume")" ]; then
  echo 'Error: please use the following syntax;'
  echo -e '\ttests_dir_on_host=. \'
  echo -e '\t&& docker run --rm -it -v $tests_dir_on_host:'$mountedVolume' superbuddy/server-status'
  exit
fi

function loopFile {
  local file=$1
  local action=$2
  local linenr=0
  
  while IFS= read -r line || [ -n "$line" ] # http://stackoverflow.com/questions/12916352/shell-script-read-missing-last-line
  do
    if [[ $linenr == "0" ]]; then #first line
      if [[ ${line:0:1} == "!" ]] ; then
        # preceding with !, inverse = true
        local inverse=true
        local matchstr=${line:1:999}
      else
        local matchstr=$line
      fi
#      echo matchstr set to $matchstr
    else # != first line
      if [[ -n $line ]] && [[ ${line:0:1} != "#" ]]; then #check if empty or comment line
        local url=$(echo $line | awk '{print $1;}')
        # if desc is empty, use the default '-'
        #if [ $(echo $line | wc -w) -gt 1 ]; then # also possible, but the next row is faster (but less readable)
        if [ $(IFS=' '; set -- $line; echo $#) -gt 1 ]; then # https://stackoverflow.com/questions/15108229/how-to-count-number-of-words-from-string-using-shell
          local desc=$(IFS=' '; set -- $line; echo ${@:2})
        else
          local desc="-"
        fi
        $action $url "$matchstr" "$desc" $inverse
#      else
#        echo NO VALID LINE FOUND: $line
      fi
    fi
    local linenr=$(($linenr+1))
  done < "$file"
}

function preformTestsFromDir {
  local dir=$2
  local testscript=$1

# Loop through the test cases in a directory and pass them to the testscript
  for totest in $dir/*
  do
    if [ $totest"" == $dir"/*" ]; then
      echo no tests found
    else
      loopFile $totest $testscript
    fi
  done
}

function runTests {
  local dir=$1
  local directories=$(ls -A $dir/)
  
# Loop through all directories and pass them to preformTestsFromDir
  for testscript in $directories
  do
    local currentdir=$dir/$testscript
    if [ -d $currentdir ]; then
      local testLoc=$testdir/$testscript".sh"
      if [ -f $testLoc ]; then
        preformTestsFromDir $testLoc $currentdir
      else
        echo "ERROR, file not found: "$testLoc
        exit 127
      fi
    else
      echo $currentdir" is not a directory, skipping"
    fi
  done
}

runTests $mountedVolume

$@

[[ -f $failedLogFile ]] && exit 1