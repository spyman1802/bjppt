#!/bin/bash
#
# Test the JMeter Docker image using a trivial test plan.

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script
# See also: http://stackoverflow.com/questions/14317715/jmeter-changing-user-defined-variables-from-command-line

T_DIR=tests

# Reporting dir: start fresh
R_DIR=${T_DIR}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test_plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

${PWD}/bin/jmeter -Dlog_level.jmeter=DEBUG \
	-JDBIP=${DBIP} \
	-n -t ${T_DIR}/test_plan.jmx -l ${T_DIR}/test_plan.jtl -j ${T_DIR}/jmeter.log \
	-e -o ${R_DIR}

echo "==== jmeter.log ===="
#cat ${T_DIR}/jmeter.log

echo "==== Raw Test Report ===="
#cat ${T_DIR}/test_plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/index.html"
