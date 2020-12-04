*** Settings ***
Library      SeleniumLibrary
Resource     ../../Keywords/login/kw_login.robot
Resource     ../../Keywords/Common/kw_create_PR.robot
Resource     ../../Keywords/Common/kw_PO.robot

Suite Setup         Run Keywords
...                 Go to web
...                 Input username "bhakjira@playtorium.co.th"
...                 Input password "passwordD365"
...                 Login success and show home page correctly
...                 Change company to "ASET"

#Suite Teardown      Close All Browsers

*** Test Cases ***
Test release approved pr page
    [Tags]      approved
    GIVEN Go to release approved purchase requisition
    WHEN Input pr id "PR20001337"
        AND Convert PR to PO
    THEN Verify created PO

Test create new purchase order
    [Tags]          po
    GIVEN Go to all purchase order
    WHEN Click create PO
        AND Input vendor account "Z999999999" [PO]
        AND Input start date for PO "1/1/2020"
        AND Input end date for PO "30/11/2021"
        AND Click ok to create PO
        AND Click edit to edit PO
        AND Input pr type of po "จัดหาผ่านหน่วยงานจัดหา"
#    43231500-0000000002
        AND Input item for po "70111703-0000000001"
        AND Input unit price for po "3500"
        AND Input received condition "Not involved in inspection committee (ไม่เข้าคณะทำงานตรวจรับ)"
        AND Click financial dimension of po
        AND Input cost center for po "1123020"
        AND Input project for po "BAU_BLDG"
        AND Input security type for PO "Z000001"
        AND Input product for PO "900001"
        AND Click save for PO
#        AND Click workflow for po
#        AND Click submit PO



