*** Settings ***
Library             SeleniumLibrary                timeout=30

Library             ../../Keywords/Common/kw_common.py
Resource            ../../Keywords/Common/kw_sale_order.robot

Suite Setup         Run Keywords
...                 Go to website
...                 Login with valid credential should be success
...                 Go to sale order page from left menu
...                 Screen should be show Sales Orders page correct
...                 Change company to "ASET"
#Suite Teardown      Close browser

*** Test Cases ***
Test to create sale order and verify created success
    [Tags]         create_so
#    Click sales order number "SO200001131"
    When Click New button
        And Input customer account "0000000179"
        And Input item number "205003_U000"
        And Input sales quantity "1"
        And Input sales unit price "2000"
        And Click save sales order
        And Click generate invoice
        And Click no to apply recommended value popup
        And Click confirm to posting invoice and printing on screen
        And Click close printing invoice page

        And Click Invoice Tab
        And Click invoice journals
        And Get invoice number
        And Click close invoice
    Then Sale status should be "Invoiced"

Test creating credit note
    [Tags]          credit_note
#    Click sales order number "SO200001120"
    Given Get so number from file
        And Get invoice number from file
    When Click New button
        And Input customer account "0000000179"
        And Click credit note
        And Input reason code "CDNG01"
        And Select "credit note (quantity)" in note format
        And Input sales order "${sales_order_id}"
        And Click wanted invoice
        And Click ok to create credit/debit note
#        Click edit sales order
        And Input number sequence group "SET_SO_IN_CN_DN"
        And Input RV number "RN02000001"
        And Click save sales order
#
        And Click confirm sales order
        And Click close printing confirmation
        And Click sales order header
        And Approve sales order
        And Click Invoice Tab
        And Click generate invoice
        And Warning message "Current Quantity value is All. The recommended value is Packing slip. Do you want to apply the recommended value?" popup
        And Click 'No' for applying recommended value
        And Click ok for posting invoice
        And Warning message "Warning: You are posting the invoice and printing to screen only. Do you want to continue?" popup
        And Click 'Yes' for wanting to continue
    Then Verify generate invoice credit note










