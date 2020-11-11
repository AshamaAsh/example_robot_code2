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
    Get sale order id for creating a debit/credit note

Get sale order number (incase of CN and DN)
    Click header
    sleep   1s
    ${sales_order_id}=           get value           //input[@name="SalesTable_SalesId"]
#    log to console          ${so_number}
    set suite variable      ${sales_order_id}
Click header
    wait until keyword succeeds     4x  5s      click element       //label[@class="label radioButton-label staticText"][text()="Header"]
Get sale order id for creating a debit/credit note
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
    sleep   1s
    wait until keyword succeeds     4x  5s      click element   css:button[id*="SalesTable_"][id*="_Invoice_button"]

Click generate invoice
#    wait until keyword succeeds     4x  5s      click element   css:button[name="buttonUpdateInvoice"]
#    wait until keyword succeeds     4x  5s      click element   css:span[id*="SalesTable_"][id*="_buttonUpdateInvoice_label"]
    wait until keyword succeeds     4x  5s      Click_by_javascript    //button[@name="buttonUpdateInvoice"]

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

Click invoice journals
    sleep   1s
    Wait Until Page Contains Element        css:span[id*="SalesTable_"][id*="_buttonJournalInvoice_label"]
    click element                           css:span[id*="SalesTable_"][id*="_buttonJournalInvoice_label"]
#    ${invoice}=         get value           css:input[id*="CustInvoiceJournal_"][id*="_CustInvoiceJour_InvoiceNum_Grid_input"]
#    log to console      ${invoice}
    wait until keyword succeeds     4x  5s      click element           css:input[id*="CustInvoiceJournal_"][id*="_CustInvoiceJour_InvoiceNum_Grid_input"]
#    wait until keyword succeeds     4x  5s      Click_by_javascript     //input[@name="CustInvoiceJour_InvoiceNum_Grid"]
#    wait until keyword succeeds     4x  5s      Click_by_javascript     //input[@aria-label="Invoice"]


Get invoice number
    sleep   1s
    ${invoice_number}=      get value       //input[@name="CustInvoiceJour_InvoiceNum"]
#    ${invoice_number}=      get value       css:input[id*="CustInvoiceJournal_"][id*="_CustInvoiceJour_InvoiceNum_input"]
    set suite variable      ${invoice_number}
    Dump invoice number into file
    Get invoice number from file

Dump invoice number into file
    Dump_Variable_To_File           ${invoice_number}       invoice_number.txt
Get invoice number from file
    ${invoice_number}=              Load_Variable_From_File         invoice_number.txt
    set suite variable              ${invoice_number}

###########
Click latest sales order
    Get so number from file
    wait until keyword succeeds     4x  5s      click element       css:input[title*="${sales_order_id}"]

###########credit note
Click credit note
    wait until keyword succeeds     4x  5s      click element       css:button[id*="_Sell_button"][id*="SalesTable_"]
    sleep   1s
#    wait until keyword succeeds     4x  5s      click element       css:span[id*="SalesTable_"][id*="_SalesCreditNoteHeader_label"]
    wait until keyword succeeds     4x  5s      click element       //button[@name="SalesCreditNoteHeader"]

Input reason code "${reason_code}"
    wait until keyword succeeds     4x  5s      input text          css:input[name*="editReasonCode"]           ${reason_code}
    press key                       css:input[name*="editReasonCode"]       \\13

Click note format
    wait until keyword succeeds     4x  5s      click element       css:input[aria-controls*="SalesCopying"][aria-controls*="_NoteFormat_TH_list"]
#    wait until keyword succeeds     4x  5s      click element       //input[@data-dyn-qtip-title="${note_format}"]

Select "debit note (value)" in note format
    Click note format
    wait until keyword succeeds     4x  5s    click element       css:li[id*="SalesCopying_"][id*="_NoteFormat_TH_list_item1"]

Select "debit note (quantity)" in note format
    Click note format
    wait until keyword succeeds     4x  5s    click element       css:li[id*="SalesCopying_"][id*="_NoteFormat_TH_list_item2"]

Select "credit note (value)" in note format
    Click note format
    wait until keyword succeeds     4x  5s    click element       css:li[id*="SalesCopying_"][id*="_NoteFormat_TH_list_item3"]

Select "credit note (quantity)" in note format
    Click note format
    wait until keyword succeeds     4x  5s    click element       css:li[id*="SalesCopying_"][id*="_NoteFormat_TH_list_item4"]


Input sales order "${so_number}"
    wait until keyword succeeds     4x  5s      click element                css:div[id*="SalesCopying_"][id*="_CustInvoiceJour_SalesNum_1"]
    wait until keyword succeeds     4x  5s      click element                css:div[id*="SalesCopying_"][id*="_CustInvoiceJour_SalesNum_1"]
    wait until keyword succeeds     4x  5s      input text                   css:input[id*="__FilterField_CustInvoiceJour_SalesNum_SalesId_Input_"]      ${so_number}
    press key       css:input[id*="__FilterField_CustInvoiceJour_SalesNum_SalesId_Input_"]          \\13

Click wanted invoice
    wait until keyword succeeds     4x  5s      click element       css:span[id*="SalesCopying_"][id*="_InvoiceMarkAll_check"]

Click ok to create credit/debit note
    wait until keyword succeeds     4x  5s      Click_by_javascript       //span[@class="button-label"][text()="OK"]
    sleep   2s
    Verify go back to so page

Verify go back to so page
    wait until keyword succeeds     4x  5s      page should not contain element    //div[@role="heading"][text()="Create credit note"]

Click confirm sales order
    wait until keyword succeeds     4x  5s      click element       //span[@class="button-label"][text()="Confirm sales order"]
    Click ok to confirm sales order
    Click yes for cofirming only posting and printing

Click yes for cofirming only posting and printing
    wait until keyword succeeds     4x  5s      Click_by_javascript     //span[@class="button-label"][text()="Yes"]

Click ok to confirm sales order
    wait until keyword succeeds     4x  5s      click element       css:button[id*="SalesEditLines_"][id*="_OK"]

Click close printing confirmation
#    wait until keyword succeeds     4x  5s      click element       css:span[id*="salestablelistpage_"][id*="_SystemDefinedCloseButton_label"]
    wait until keyword succeeds     4x  5s      click element       css:button[id*="SrsReportPdfViewerForm_"][id*="_SystemDefinedCloseButton"]

Click sales order header
    wait until keyword succeeds     4x  5s      click element       css:button[id*="SalesTable_"][id*="_SalesOrder_button"]

Approve sales order
    wait until keyword succeeds     4x  5s      click element           css:span[id*="SalesTable_"][id*="_IVZS_CNApprovalApproveButton_label"]
    wait until keyword succeeds     4x  5s      Click_by_javascript     //span[@class="button-label"][text()="OK"]

Warning message "${message}" popup
    wait until element is visible   //span[@id="titleField"]
    ${msg}=         get text        //span[@id="titleField"]
    Element text should be          //span[@id="titleField"]        ${message}

Click 'No' for applying recommended value
    wait until keyword succeeds     4x  5s      Click_by_javascript     //span[@class="button-label"][text()="No"]

Click 'Yes' for wanting to continue
    wait until keyword succeeds     4x  5s      Click_by_javascript     //span[@class="button-label"][text()="Yes"]

Click ok for posting invoice
    sleep   1s
    wait until keyword succeeds     4x  5s      Click_by_javascript     //span[@class="button-label"][text()="OK"]

Click sales order number "${so_number}"
    wait until keyword succeeds     4x  5s      click element       css:input[title*="${so_number}"]

#########################
Click edit sales order
    wait until keyword succeeds     4x  5s      Click_by_javascript     //span[@class="button-label"][text()="Edit"]

Input number sequence group "${number_seq}"
    Click header
#    input[id*="SalesTable_"][id*="_Posting_NumberSequenceGroup_input"]
    wait until keyword succeeds     4x  5s      input text         //input[@name="Posting_NumberSequenceGroup"]     ${number_seq}

Input RV number "${rv_number}"
    wait until keyword succeeds     4x  5s      input text         //input[@name="SalesTable_IVZS_RVNumber"]        ${rv_number}
#########################
Verify generate invoice credit note
    sleep   2s
    wait until keyword succeeds     4x  5s      Click_css_by_javascript     css:button[id*="CustInvoiceJournal_"][id*="_SystemDefinedCloseButton"]
    sleep   1s
    Page Should Contain Element         //label[@class="label radioButton-label staticText"][text()="Header"]

Click close invoice
#    wait until keyword succeeds     4x  5s      click element     css:span[id*="CustInvoiceJournal_"][id*="_SystemDefinedCloseButton_label"]
#    wait until keyword succeeds     4x  5s      click element     css:span[id*="CustInvoiceJournal_"][id*="_SystemDefinedCloseButton_label"]
    wait until keyword succeeds     4x  5s      click element     css:button[id*="CustInvoiceJournal_"][id*="_SystemDefinedCloseButton"]
    wait until keyword succeeds     4x  5s      click element     css:button[id*="CustInvoiceJournal_"][id*="_SystemDefinedCloseButton"]
