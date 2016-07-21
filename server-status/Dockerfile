FROM appropriate/curl
MAINTAINER svlentink <sander@superbuddy.nl>

COPY entrypoint.sh /usr/local/bin/entrypoint
ENV testdir=/usr/bin/curltests
COPY tests $testdir
ENV testlib=/usr/lib/testlib.sh
COPY testlib.sh $testlib

ENTRYPOINT /usr/local/bin/entrypoint