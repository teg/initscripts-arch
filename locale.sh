if [ -s /etc/rc.conf ]; then
	LANG=$(. /etc/rc.conf 2> /dev/null ; echo "${LOCALE:=en_US.UTF-8}")
fi
if [ -s /etc/locale.conf ]; then
	. /etc/locale.conf
fi

export LANG LANGUAGE LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE
export LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS
export LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION
