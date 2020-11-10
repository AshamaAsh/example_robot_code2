*** Settings ***
Library             SeleniumLibrary                timeout=30
Library             ../../Keywords/Common/kw_common.py
#Resource            ../../keywords/Common/kw_sale_order.robot
Resource            ../../Keywords/Common/kw_sale_order.robot
#Suite Teardown      Close All Browsers

Suite Setup         Run Keywords
...                 Go to website
...                 Login with valid credential should be success
...                 Go to sale order page from left menu
...                 Screen should be show Sales Orders page correct
...                 Change company to "ASET"

*** Test Cases ***
Test to create sale order and verify created success
    WHEN Click New button
        AND Input customer account "0000000179"
        AND Input item number "205003_U000"
        AND Input sales quantity "1"
        AND Input sales unit price "2000"
        AND Click save sales order
        AND Click generate invoice
        AND Click no to apply recommended value popup
        AND Click confirm to posting invoice and printing on screen
        AND Click close printing invoice page
    THEN Sale status should be "Invoiced"

Test creating credit note
    [Tags]          run
    When Click New button
        And Input customer account "0000000179"
#        CDNG01
        And Click credit note
        And Input reason code "CDNG01"
        And Select note format "Credit note (quantity)"
        And Input sales order "${sales_order_id}"
        And Click wanted invoice
        And Click ok to create credit/debit note






