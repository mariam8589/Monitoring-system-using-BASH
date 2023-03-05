#!/bin/bash
###### Lab ######

# Monitor every 1 min the system load.
IP=$(hostname -I | awk '{print $2}')
HOSTNAME=$(hostname)

while [ 1 -eq 1 ]
do
	OLD=$(uptime | awk 'BEGIN {FS="average: "} {print $2}'| awk 'BEGIN {FS=","} {print $1}')
	sleep 60
	NEW=$(uptime | awk 'BEGIN {FS="average: "} {print $2}'| awk 'BEGIN {FS=","} {print $1}')
	MIN5=$(uptime | awk 'BEGIN {FS="average: "} {print $2}'| awk 'BEGIN {FS=","} {print $2}')
	MIN15=$(uptime | awk 'BEGIN {FS="average: "} {print $2}'| awk 'BEGIN {FS=","} {print $3}')

   # if NEW > OLD -------> load is increasing
TEST=$(echo $NEW'>'$OLD | bc -l)
      if [ $TEST -eq 1 ]
      then	
	echo "load = ${NEW} date = $(date)" > /var/log/systemLoad
	echo "Subject: Server ${IP} load
		Body:
			Dear, 
				The system ${HOSTNAME} runs with IP ${IP} has a load of 
				1MIN load: ${NEW}
				5MIN load: ${MIN5}
				15MIN load: ${MIN15}
			Thank you ." > /tmp/events

      fi 



done



