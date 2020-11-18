*** Settings ***
Library      SeleniumLibrary
Resource     ../../Keywords/login/kw_login.robot
Resource     ../../Keywords/Common/kw_create_PR.robot
Resource     ../../Keywords/Common/kw_PO.robot

Suite Setup         Run Keywords
...                 Go to web
...                 Input username "bhakjira@playtorium.co.th"
...                 Input password "passwordD365"
...                 Go to release approved purchase requisition
#Suite Teardown      Close All Browsers

*** Test Cases ***
Test release approved pr page
    Input pr id "PR20001156"
    Convert PR to PO
    Verify created PO
