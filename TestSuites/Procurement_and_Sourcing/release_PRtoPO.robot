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
    Input start date for PO "18/11/2020"
    Input end date for PO "17/11/2021"
    Click ok to create PO
    Click edit to edit PO
    Input pr type of po "จัดหาผ่านหน่วยงานจัดหา"
    Input item for po "70111703-0000000001"
    Input unit price for po "1500"
    Input received condition "Not involved in inspection committee (ไม่เข้าคณะทำงานตรวจรับ)"
    Click financial dimension of po
    Input cost center for po "1123020"
    Input project for po "BAU_BLDG"
    Click save for PO
    Click workflow for po
    Click submit PO
