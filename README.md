# Monitoring-system-using-BASH
shell script (with comments, and identations) to
Monitor every 1 min the system load.
	if there is high load (increases) Add the load , and date to a log file /var/log/systemLoad & write event to an event file /tmp/events
		Subject: Server <IP> load
		Body:
			Dear, 
				The system (hostname) runs with IP (IP) has a load of 
				1MIN load: <value>
				5MIN load: <value>
				15MIN load: <value>
			Thank you .
