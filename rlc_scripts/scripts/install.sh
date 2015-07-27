#!/bin/bash
MODULE_NAME="rlc_scripts"
MODULESCRIPT="report_broken_client"
CTL="${BASEURL}index.php?/module/${MODULE_NAME}/"

${CURL} "${TPL_BASE}report_broken_client" -o "${MUNKIPATH}mr_report_broken_client" 

${CURL} "${CTL}get_script/${MODULESCRIPT}" -o "${MUNKIPATH}${MODULESCRIPT}"

${CURL} "https://raw.githubusercontent.com/google/simian/master/src/simian/munki/postflight" -o "${MUNKIPATH}preflight.d/0_simian"
${CURL} "https://raw.githubusercontent.com/google/simian/master/src/simian/munki/postflight" -o "${MUNKIPATH}postflight.d/0_simian" 
${CURL} "https://raw.githubusercontent.com/google/simian/master/src/simian/munki/report_broken_client" -o "${MUNKIPATH}simian_report_broken_client"

chmod +x ${MUNKIPATH}mr_report_broken_client
chmod +x ${MUNKIPATH}${MODULESCRIPT}
chmod +x ${MUNKIPATH}preflight.d/0_simian
chmod +x ${MUNKIPATH}postflight.d/0_simian