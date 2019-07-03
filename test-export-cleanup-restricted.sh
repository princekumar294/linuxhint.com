#!/bin/bash
## test-export-cleanup
## version 0.0.1 - initial
##################################################
#. ${SH2}/cecho.sh
list-exports() {
  {
    export -p
  } \
  | grep declare \
  | cut '-d ' '-f3' \
  | cut '-d=' '-f1' 
}
cleanup-export() { { local name ; name="${1}" ; }
  export -n  ${export} 
}
test-export-cleanup() {
  echo "exports: $( list-exports )"
  echo "cleaning up exports ..."
  for export in $( list-exports )
  do
   cleanup-export ${export}
  done
  echo "done cleaning up exports"
  echo "exports: $( list-exports )"
}
##################################################
if [ ${#} -eq 0 ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
test-export-cleanup
##################################################
## generated by create-stub2.sh v0.1.2
## on Wed, 03 Jul 2019 23:07:31 +0900
## see <https://github.com/temptemp3/sh2>
##################################################
