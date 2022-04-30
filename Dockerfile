FROM dock.mau.dev/mautrix/facebook

MAINTAINER Fabian Kaindl <gitlab-docker@fabiankaindl.de>
# Add Healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
  CMD code_http=$(curl -sI -o /dev/null -w %{http_code} http://localhost:80); if [ $code_http != 404 ];then exit 1;else exit 0; fi
  
# This makes the build inconsistent in term of reproduceability but it provides every security update needed until the developer updates the main repository
RUN apk -U upgrade
