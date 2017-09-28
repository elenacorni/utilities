#!/bin/bash

the_help(){
	echo -e "\\nUsage: $0 [start-date] [end-date] (format: YYYY-mm-dd)  (-h or --help)\\n"
}

if [[ ( $1 == "--help" ) || ( $1 == "-h" ) || ( $# -lt 2 ) ]]
then
	the_help
	exit 1
fi

curr_date=$(date +%Y_%m_%d)
mkdir -p ${curr_date}_img_currWeekWiki

# trasformo le date in secondi:
start_date_sec=$(date +%s -d "$1")
end_date_sec=$(date +%s -d "$2")
start_date_sec=${start_date_sec}000
end_date_sec=${end_date_sec}000
##############################

echo -e "\n>> ALICE:"
echo "- Queue alice:"
echo "      * jobs"
wget --no-check-certificate --quiet -O ${curr_date}_img_currWeekWiki/alice_job.png "https://t1metria.cr.cnaf.infn.it/render/dashboard-solo/db/accounting-by-queue?panelId=1&from=$start_date_sec&to=$end_date_sec&var-site=All&var-submit=All&var-queue=alice&width=1000&height=500"

echo "      * efficiency"
wget --no-check-certificate --quiet -O ${curr_date}_img_currWeekWiki/alice_eff.png "https://t1metria.cr.cnaf.infn.it/render/dashboard-solo/db/efficiency-by-queue?panelId=3&from=$start_date_sec&to=$end_date_sec&var-site=All&var-submit=All&var-queue=alice&width=1000&height=500"
#

echo "- Queue alice_himem:"
echo "      * jobs"
wget --no-check-certificate --quiet -O ${curr_date}_img_currWeekWiki/alice_himem_job.png "https://t1metria.cr.cnaf.infn.it/render/dashboard-solo/db/accounting-by-queue?panelId=1&from=$start_date_sec&to=$end_date_sec&var-site=All&var-submit=All&var-queue=alice_himem&width=1000&height=500"

echo "      * efficiency"
wget --no-check-certificate --quiet -O ${curr_date}_img_currWeekWiki/alice_himem_eff.png "https://t1metria.cr.cnaf.infn.it/render/dashboard-solo/db/efficiency-by-queue?panelId=3&from=$start_date_sec&to=$end_date_sec&var-site=All&var-queue=alice_himem&width=1000&height=500"
##############################

echo -e "\n>> CMS:"
echo "- Queue cms_mcore:"
echo "      * jobs"
wget --no-check-certificate --quiet -O ${curr_date}_img_currWeekWiki/cms_mcore_job.png "https://t1metria.cr.cnaf.infn.it/render/dashboard-solo/db/accounting-by-queue?panelId=1&from=$start_date_sec&to=$end_date_sec&var-site=All&var-submit=All&var-queue=cms_mcore&width=1000&height=500"

echo "      * efficiency"
wget --no-check-certificate --quiet -O ${curr_date}_img_currWeekWiki/cms_mcore_eff.png "https://t1metria.cr.cnaf.infn.it/render/dashboard-solo/db/efficiency-by-queue?panelId=3&from=$start_date_sec&to=$end_date_sec&var-site=All&var-queue=cms_mcore&width=1000&height=500"
#wget --no-check-certificate --quiet -O ${curr_date}_img_currWeekWiki/cms_mcore_eff.png "https://t1metria.cr.cnaf.infn.it/render/dashboard-solo/db/accounting-by-queue?panelId=2&from=$start_date_sec&to=$end_date_sec&var-site=All&var-submit=All&var-queue=cms_mcore&width=1000&height=500"
##############################

#echo -e "\n>> LIMADOU:"
#echo "- Queue limadou:"
#echo "      * jobs"
#wget --no-check-certificate --quiet -O ${curr_date}_img_currWeekWiki/limadou_job.png "https://t1metria.cr.cnaf.infn.it/render/dashboard-solo/db/accounting-by-queue?panelId=1&from=$start_date_sec&to=$end_date_sec&var-site=All&var-submit=All&var-queue=limadou&width=1000&height=500"

#echo "      * efficiency"
#wget --no-check-certificate -O ${curr_date}_img_currWeekWiki/limadou_eff.png "https://t1metria.cr.cnaf.infn.it/render/dashboard-solo/db/efficiency-by-queue?panelId=3&from=$start_date_sec&to=$end_date_sec&var-site=All&var-submit=All&var-queue=limadou&width=1000&height=500"
##############################

echo "-----"
echo "## Da scaricare a mano:"
echo -e "\\n- Availability ALICE:"
echo "http://wlcg-sam-alice.cern.ch/templates/ember/#/historicalsmry/heatMap?group=Tier-0%2F1&profile=ALICE_CRITICAL&site=CNAF&time=7d&view=Service%20Availability"
echo -e "\\n- Availability CMS:"
echo "http://wlcg-sam-cms.cern.ch/templates/ember/#/historicalsmry/heatMap?profile=CMS_CRITICAL_FULL&site=T1_IT_CNAF&time=Last%20Week&view=Service%20Availability"
echo -e "\\n- Readiness CMS:"
echo "https://cms-site-readiness.web.cern.ch/cms-site-readiness/SiteReadiness/HTML/SiteReadinessReport.html#T1_IT_CNAF"
echo " "
