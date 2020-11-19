*** Settings ***
Library      SeleniumLibrary
Resource     ../../Keywords/login/kw_login.robot
Resource     ../../Keywords/Common/kw_create_PR.robot
Resource     ../../Keywords/Common/kw_PO.robot

Suite Setup         Run Keywords
...                 Go to web
...                 Input username "bhakjira@playtorium.co.th"
...                 Input password "passwordD365"
...                 Change company to "ASET"
...                 Go to all purchase order

#Suite Teardown      Close All Browsers

*** Test Cases ***
Test release approved pr page
    Input pr id "PR20001239"
    Convert PR to PO
    Verify created PO

Test create new purchase order
    [Tags]          po
    Click create PO
    Input vendor account "Z999999999" [PO]
    Input start date for PO "19/11/2020"
    Input end date for PO "19/11/2020"
    Click ok to create PO
    sleep   2s
    Click edit to edit PO
    Input pr type of po "จัดหาผ่านหน่วยงานจัดหา"
#    43231500-0000000002
    Input item for po "43231500-0000000002"
    Input unit price for po "1200"
    Input received condition "Not involved in inspection committee (ไม่เข้าคณะทำงานตรวจรับ)"
    Click financial dimension of po
    Input cost center for po "1080020"
    Input project for po "BAU_FIN"
    Click save for PO
    Click workflow for po
    Click submit PO

