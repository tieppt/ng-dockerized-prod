#!/bin/sh

echo 'RUN ENV Interpolation';
cd /var/www
envsubst '${BASE_URL}' < index.html > index.fix.html;

mv index.html index.bak
mv index.fix.html index.html
echo 'DONE RUN ENV Interpolation';
nginx -g "daemon off;";
exit 0;
