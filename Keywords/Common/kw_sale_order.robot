*** Keywords ***

Go to website
    Open Browser             https://setthuat.sandbox.operations.dynamics.com          chrome
    Maximize Browser Window

Login with valid credential should be success
    Wait Until Page Contains Element        name:loginfmt
    Input Text                              name:loginfmt                   bhakjira@playtorium.co.th
    Wait Until Page Contains Element        //input[@type="submit"]
    Click Element                           //input[@type="submit"]
    Wait Until Page Contains Element        name:passwd
    Input Text                              name:passwd                     passwordD365
    sleep   2s
    Wait Until Page Contains Element        id:idSIButton9
    Click Element                           id:idSIButton9
    Wait Until Page Contains Element        id:idSIButton9
    Click Element                           id:idSIButton9

Go to sale order page from left menu
    Click module on left menu
    Click "Sales and marketing" sub menu
    Click on "Sales orders" sub menu
    Click "All sales orders" sub menu


Click module on left menu
    sleep  2s
    Wait Until Page Contains Element        id:navPaneModuleID
    Click Element                           id:navPaneModuleID

Click on "Sales orders" sub menu
    sleep  2s
    ${status}          ${value}             Run Keyword And Ignore Error
    ...     Wait Until Page Contains Element
    ...     //a[@data-dyn-title="All sales orders"]
    Run Keyword If  '${status}' != 'PASS'
    ...     Run Keywords        Wait Until Page Contains Element        //a[@data-dyn-title="Sales orders"]
    ...     AND                 Click Element                           //a[@data-dyn-title="Sales orders"]
    ...     ELSE                Log     "Sales orders" sub menu is already expand

Click "${submenu}" sub menu
    Wait Until Page Contains Element        //a[@data-dyn-title="${submenu}"]
    Click Element                           //a[@data-dyn-title="${submenu}"]

Screen should be show Sales Orders page correct
    sleep  2s
    Title Should Be                         All sales orders -- Finance and Operations

Change company to "${company}"
    Wait Until Page Contains Element        id:CompanyButton
    Click Element                           id:CompanyButton
    Wait Until Page Contains Element        //input[@name="DataArea_id"]
    Click Element                           //input[@name="DataArea_id"]
    Clear Element Text                      //input[@name="DataArea_id"]
    Input Text                              //input[@name="DataArea_id"]               ${company}
    Press key                              //input[@name="DataArea_id"]                \\13
    wait until keyword succeeds     4x  5s      click element       css:span[id*="Close_label"]
    sleep   2s
    
Click New button
    Wait Until Page Contains Element        //span[text()="New"]
    Click Element                           //span[text()="New"]

Screen will show Create sales order popup
    Wait Until Element Is Visible           css:div.dialog-popup-content

#0000000179
Input customer account "${customer_acc}"
    wait until keyword succeeds     4x  5s      Input Text          css:input[id*="CustAccount_input"]         ${customer_acc}
    wait until keyword succeeds     4x  5s      Press key           css:input[id*="CustAccount_input"]         \\13

Click ok to create sales order
    wait until keyword succeeds     4x  5s      click element   css:span[id*="_OK_label"]

Click add line
    wait until keyword succeeds     4x  5s      click element    css:span[id*="LineStripNew_label"]

Input item number "${itemnumber}"
    Wait Until Page Contains Element            //input[@name="SalesLine_ItemId"]
    Input Text
    ...     //input[@name="SalesLine_ItemId"]
    ...     ${itemnumber}

Input sales category "${sales_cat}"
    wait until keyword succeeds     4x  5s      input text      css:input[name*="SalesLine_SalesCategory_Name"]         ${sales_cat}

Input sales quantity "${sales_quantity}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="SalesTable_"][id*="_SalesLine_SalesQty_input"]      ${sales_quantity}

Input sales unit price "${sales_price}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="SalesTable_"][id*="_SalesLine_SalesPrice_input"]     ${sales_price}

Click financial dimension of sales order
    wait until keyword succeeds     4x  5s      click element   css:li[id*="SalesTable_"][id*="FinancialDimensionLine_header"]

Input cost center (sales order) "${cost_center}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="SalesTable_"][id*="DECValue"][id*="Costcenter_input"]        ${cost_center}

Input project (sales order) "${project}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="SalesTable_"][id*="DECValue"][id*="Project_input"]           ${project}

###################
Click save sales order
    wait until keyword succeeds     4x  5s      click element   css:span[id*="SalesTable_"][id*="SystemDefinedSaveButton_label"]
    Get sale order number (incase of CN and DN)
    Get sales order id for creating a debit/credit note

Get sale order number (incase of CN and DN)
    Click header
    sleep   1s
    ${sales_order_id}=           get value           //input[@name="SalesTable_SalesId"]
#    log to console          ${so_number}
    set suite variable      ${sales_order_id}
Click header
    wait until keyword succeeds     4x  5s      click element       //label[@class="label radioButton-label staticText"][text()="Header"]
Get sales order id for creating a debit/credit note
    Dump so number into file
    Get so number from file
#    log to console                  ${sales_order_id}
Dump so number into file
    Dump_Variable_To_File          ${sales_order_id}        sale_order_number.txt
Get so number from file
    ${sales_order_id}=                  Load_Variable_From_File     sale_order_number.txt
    set global variable            ${sales_order_id}

###################

Click Invoice Tab
    wait until keyword succeeds     4x  5s      click element   css:span[id*="SalesTable_"][id*="Invoice_button"]

Click generate invoice
    wait until keyword succeeds     4x  5s      click element   css:button[name="buttonUpdateInvoice"]

Click no to apply recommended value popup
    Wait Until Element Contains
    ...     //*[@id="titleField"]
    ...     Current Quantity value is All. The recommended value is Packing slip. Do you want to apply the recommended value?
    Wait Until Page Contains Element            css:button[name="No"]
    Click Button                                css:button[name="No"]

Click confirm to posting invoice and printing on screen
    Wait Until Page Contains Element            css:button[name="OK"]
    Click Button                                css:button[name="OK"]
    Wait Until Element Contains
    ...     //*[@id="titleField"]
    ...     Warning: You are posting the invoice and printing to screen only. Do you want to continue?
    Wait Until Page Contains Element            css:button[name="Yes"]
    Click Button                                css:button[name="Yes"]

Click close printing invoice page
    Wait Until Page Contains Element            css:iframe[src*="invoice"]
    sleep   3s
    Wait Until Page Contains Element            css:button[id*="SrsReportPdfViewerForm_"][id*="SystemDefinedCloseButton"]
    Click Element                               css:button[id*="SrsReportPdfViewerForm_"][id*="SystemDefinedCloseButton"]

Sale status should be "${sale_status}"
    Wait Until Page Contains Element            css:input[name="SalesStatus"]
    wait until keyword succeeds                 4x  5s
    ...     Element Attribute Value Should Be
    ...     css:input[name="SalesStatus"]       title       ${sale_status}

###########
Click latest sales order
    Get so number from file
    wait until keyword succeeds     4x  5s      click element       css:input[title*="${sales_order_id}"]

###########credit note
Click credit note
    wait until keyword succeeds     4x  5s      click element       css:button[id*="_Sell_button"][id*="SalesTable_"]
    wait until keyword succeeds     4x  5s      click element       css:span[id*="SalesTable_"][id*="_SalesCreditNoteHeader_label"]

Input reason code "${reason_code}"
    wait until keyword succeeds     4x  5s      input text          css:input[name*="editReasonCode"]           ${reason_code}

Select note format "${note_format}"
    wait until keyword succeeds     4x  5s      click element       //input[@data-dyn-qtip-title="${note_format}"]

Input sales order "${so_number}"
    wait until keyword succeeds     4x  5s      input text          css:input[id*="__FilterField_CustInvoiceJour_SalesNum_SalesId_Input_"]      ${so_number}
    press key       css:input[id*="__FilterField_CustInvoiceJour_SalesNum_SalesId_Input_"]          \\13

Click wanted invoice
    wait until keyword succeeds     4x  5s      click element       css:span[id*="SalesCopying_"][id*="_InvoiceMarkAll_check"]

Click ok to create credit/debit note
    wait until keyword succeeds     4x  5s      click element       css:span[id*="SalesCopying_"][id*="_OK_label"]






