/var/log/lighttpd/*log {
	missingok
	copytruncate
	notifempty
	sharedscripts
	postrotate
	endscript
}
