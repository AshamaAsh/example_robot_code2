*** Settings ***
Library      Selenium2Library
Resource     ../../Keywords/login/kw_login.robot
Resource     ../../Keywords/Common/kw_expense.robot

Suite Teardown      Close All Browsers

*** Test Cases ***
Test go to D365 website
    [Tags]        run
    Go to web
    Input username                          bhakjira@playtorium.co.th
    Click next for inputing password
    Input password                          passwordD365
    Click signin
    sleep   1s
    Go to module
    Go to "Expense management" and select "Cash advances"
    Select Company "ADAP"

Create new cash advances
    [Tags]
    Click new for creating cash advances
    Input requested day "4/11/2020"
    Input requested amount "2500"
    Input cost center "1900000"
    Input project "BAU_FIN"
#    Click yes to change tax brach to head quarter
#    Input tax branch "00000"
    Click save cash advance
    Click workflow
    Click submit cash advance
    Click submit again


