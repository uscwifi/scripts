#!/bin/bash

#host="/root/.acme.sh/cagetest.com/fullchain.cer"
crt_path="/etc/haproxy/ssl/xxx.com_2019.pem"
end_date=`openssl x509 -in ${crt_path} -noout -text | grep "Not After" | awk  -F'Not After :' '{print $2 }'`
now_date_second=`date +%s`
end_date_second=`date +%s --date "${end_date}"`
echo  "(${end_date_second}-${now_date_second})/3600/24" | bc

