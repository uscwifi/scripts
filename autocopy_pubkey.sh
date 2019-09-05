#!/bin/bash
HOSTS='192.168.38.154 192.168.38.146'
USER=root
PASSWORD=123456
for ip in ${HOSTS};do
    /usr/bin/expect <<EOF
set timeout 10
spawn ssh-copy-id ${USER}@${ip}
    expect {
        "(yes/no)?"
        {
            send "yes\n"
            expect "*assword:" { send "$PASSWORD\n"}
        }
        "*assword:"
        {
            send "$PASSWORD\n"
        }
    }
expect eof
EOF
done
