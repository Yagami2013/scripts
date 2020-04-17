#/bin/bash

source parse_xml.sh
source operate_app.sh

getStartTime |awk -F: '{print $2}' > startTime.txt
click "是否值得"

