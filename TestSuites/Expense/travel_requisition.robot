*** Settings ***
Library      Selenium2Library
Resource     ../../Keywords/login/kw_login.robot
Resource     ../../Keywords/Common/kw_expense.robot

*** Test Cases ***
Test go to D365 website
    [Tags]        run
    Go to web
    Input username                          bhakjira@playtorium.co.th
    Click next for inputing password
    Input password                          passwordD365
    Click signin
    Go to module
    Go to "Expense management" and select "Travel requisition"
    Select Company "ADAP"

Create new travel requisition
