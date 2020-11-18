*** Settings ***
Library         SeleniumLibrary
Library         ../../Keywords/Common/kw_common.py
Resource        ../../Keywords/login/kw_login.robot
Resource        ../../Keywords/Common/kw_create_PR.robot

Test Setup         Run Keywords
...                 Go to web
...                 Input username "bhakjira@playtorium.co.th"
...                 Input password "passwordD365"
...                 Go to procurement and sourcing
#Suite Teardown      Close All Browsers

*** Test Cases ***
Create New PR 1 line not by amount
    [Tags]      create
#    When Click new for new PR
#        And Input PR subject "test fixed asset5"
#        And Input PR type "จัดหาผ่านหน่วยงานจัดหา"
#        And Start date "12/11/2020" and end date "12/11/2020"
#        And Click by amount
#        And Click OK to create PR
#
#        And Click add line
##        And Input reqester "Chollada Amatyakul"
#        And Input buying legal entity "ADAP"
#        And Input item number "72151500-0000000003"
#        And Input quantity "450"
#        And Input unit price "1"
#        And Click financial dimension
#        And Input cost center for financial dimension "1123022"
#        And Input project for financial dimension "BAU_BLDG"
#        And Input security type for financial dimension "Z000001"
#        And Input product for financial dimension "900001"
#        And Input system IT for financial dimension "UNASSIGN"
#
#        And Click save
#        And Click change vendor
#        And Input vendor name "0000000009"
#        And Verify vendor name "ห้างหุ้นส่วนจำกัด เอ็ม แอนด์ เอ็ม เลเซอร์พริ้นต์"
    When Click new for new PR
        And Input PR subject "test ดำเนินการเอง 2"
        And Input PR type "ดำเนินการเอง"
        And Start date "17/11/2020" and end date "17/11/2020"
        And Click OK to create PR

        And Click add line
#        And Input reqester "Chollada Amatyakul"
        And Input buying legal entity "ASET"
        And Input item number "84121600-0000000007"
        And Input quantity "1"
        And Input unit price "2500"
        And Click financial dimension
        And Input cost center for financial dimension "1900000"
        And Input project for financial dimension "BAU_FIN"
        And Input security type for financial dimension "Z000001"
        And Input product for financial dimension "500100"
        And Input system IT for financial dimension "UNASSIGN"
        And Input affiliate for financial dimension "SET"

        And Click save
        And Click change vendor
        And Input vendor name "Z999999999"

        And Submit PR and sending to approval process
        And Click close window to verrify created PR
        And Click refresh button
    Then Verify created PR

Create New PR more than 1 line not by amount
    [Tags]      run_test
    When Click new for new PR
        And Input PR subject "Test ดำเนินการเอง 4 lines"
        And Input PR type "ดำเนินการเอง"
        And Start date "11/11/2020" and end date "11/11/2020"
        And Click OK to create PR

        And Click add line
#        And Input reqester "Phornpan Nooma"
        And Input buying legal entity "ASET"
        And Input item number "84121600-0000000007"
        And Input quantity "1"
        And Input unit price "1000"
        And Click financial dimension
        And Input cost center for financial dimension "1900000"
        And Input project for financial dimension "BAU_FIN"
        And Input security type for financial dimension "Z000001"
        And Input product for financial dimension "500100"
        And Input system IT for financial dimension "UNASSIGN"
        And Input affiliate for financial dimension "SET"
        And Click save
        And Click change vendor
        And Input vendor name "คุณหิรัญ รดีศรี"

        And Click add line
#        And Input reqester "Phornpan Nooma"
        And Input buying legal entity "ASET"
        And Input item number "84121600-0000000007"
        And Input quantity "1"
        And Input unit price "300"
        And Click financial dimension
        And Input cost center for financial dimension "1900000"
        And Input project for financial dimension "BAU_FIN"
        And Input security type for financial dimension "Z000001"
        And Input product for financial dimension "500100"
        And Input system IT for financial dimension "UNASSIGN"
        And Input affiliate for financial dimension "SET"
        And Click save
        And Click change vendor
        And Input vendor name "คุณหิรัญ รดีศรี"
#        And Verify vendor name "ห้างหุ้นส่วนจำกัด เอ็ม แอนด์ เอ็ม เลเซอร์พริ้นต์"

        And Click add line
#        And Input reqester "Phornpan Nooma"
#        And Input buying legal entity "ASET"
        And Input item number "84121600-0000000007"
        And Input quantity "1"
        And Input unit price "1200"
        And Click financial dimension
        And Input cost center for financial dimension "1900000"
        And Input project for financial dimension "BAU_FIN"
        And Input security type for financial dimension "Z000001"
        And Input product for financial dimension "500100"
        And Input system IT for financial dimension "UNASSIGN"
        And Input affiliate for financial dimension "SET"
        And Click save
        And Click change vendor
        And Input vendor name "Openitem Dummy NameOpenitem Dummy Name"
#        And Verify vendor name "ห้างหุ้นส่วนจำกัด เอ็ม แอนด์ เอ็ม เลเซอร์พริ้นต์์"

        And Click add line
#        And Input reqester "Phornpan Nooma"
#        And Input buying legal entity "ASET"
        And Input item number "84121600-0000000007"
        And Input quantity "1"
        And Input unit price "1100"
        And Click financial dimension
        And Input cost center for financial dimension "1900000"
        And Input project for financial dimension "BAU_FIN"
        And Input security type for financial dimension "Z000001"
        And Input product for financial dimension "500100"
        And Input system IT for financial dimension "UNASSIGN"
        And Input affiliate for financial dimension "SET"
        And Click save
        And Click change vendor
        And Input vendor name "Openitem Dummy NameOpenitem Dummy Name"
#        And Verify vendor name "ห้างหุ้นส่วนจำกัด เอ็ม แอนด์ เอ็ม เลเซอร์พริ้นต์"

        And Submit PR and sending to approval process
        And Click close window to verrify created PR
    Then Verify created PR

Create New PR more than 1 line by amount
    [Tags]
    When Click new for new PR
        And Input PR subject "test robot by amount"
        And Input PR type "ดำเนินการเอง"
        And Start date "6/11/2020" and end date "7/11/2020"
        And Click by amount
        And Click OK to create PR

        And Click add line
        And Input buying legal entity "ADAP"
        And Input item number "84121600-0000000004"
        And Input quantity "1"
        And Input unit price "1750.29"
        And Submit PR and sending to approval process
        And Click close window to verrify created PR
        And Click refresh button
    Then Verify created PR

Recall PR that already submitted
    [Tags]          recall
    When Click new for new PR
        And Input PR subject "test robot recall PR"
        And Input PR type "ดำเนินการเอง"
        And Start date "6/11/2020" and end date "6/11/2020"
        And Click OK to create PR
        And Click add line
        And Input buying legal entity "ADAP"
        And Input item number "84121600-0000000004"
        And Input quantity "1"
        And Input unit price "3000"
        And Submit PR and sending to approval process
        And Click close window to verrify created PR
    Then Verify created PR

    When Click refresh button
        And Click latest created PR
#        Click PR number
        And Verify PR status "In review"
#        Get text
        And Recall PR for draft status
        And Click close window to verrify created PR
        sleep   90s
        And Click refresh button
        When Click latest created PR
    Then Verify PR status "Draft"

Accept pr for review
    [Tags]          accept_not_done
    Given Get pr number from file
    When Accept and complete pr after creating

Approve after reviewing
    [Tags]          approve_not_done
    When Click Approve workflow
        sleep   60s
        And Verify PR status "Approved"


Test fix asset
    [Tags]      fa
    When Click new for new PR
        And Input PR subject "test fix asset 11"
        And Input PR type "จัดหาผ่านหน่วยงานจัดหา"
        And Start date "18/1/2021" and end date "18/12/2021"
#        And Click by amount
        And Click OK to create PR

        And Click add line
#        And Input reqester "Chollada Amatyakul"
        And Input buying legal entity "ASET"
        And Input item number "70111703-0000000001"
        And Input quantity "1"
        And Input unit price "1500"
        And Click financial dimension
        And Input cost center for financial dimension "1080020"
        And Input project for financial dimension "BAU"
        And Input security type for financial dimension "Z000001"
        And Input product for financial dimension "900001"
        And Input system IT for financial dimension "UNASSIGN"
        And Input affiliate for financial dimension "TSD"

        And Click save
        And Click change vendor
        And Input vendor name "Z999999999"

        And Submit PR and sending to approval process
        And Click close window to verrify created PR
        And Click refresh button
    Then Verify created PR
