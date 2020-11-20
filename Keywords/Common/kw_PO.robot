*** Keywords ***
Change company to "${company}"
    Wait Until Page Contains Element        id:CompanyButton
    Click Element                           id:CompanyButton
    Wait Until Page Contains Element        //input[@name="DataArea_id"]
    Click Element                           //input[@name="DataArea_id"]
    Clear Element Text                      //input[@name="DataArea_id"]
    Input Text                              //input[@name="DataArea_id"]               ${company}
    Press keys                               //input[@name="DataArea_id"]              RETURN
    wait until keyword succeeds         4x  5s              click element       css:span[id*="Close_label"]
    sleep   2s
    Wait Until Keyword Succeeds         4x  5s              click button        //button[@data-dyn-controlname="Close"]

#//div[@class="columnHeader-label alignmentAuto"][text()="Purchase requisition"]
Go to release approved purchase requisition
    Go to module
    wait until keyword succeeds     4x  5s      click element       css:a[data-dyn-title*="Procurement"][data-dyn-title*="sourcing"]
    wait until keyword succeeds     4x  5s      click element       css:a[data-dyn-title="Release approved purchase requisitions"]

#//a[@data-dyn-title="All purchase orders"]
Go to all purchase order
    Go to module
    wait until keyword succeeds     4x  5s      click element       css:a[data-dyn-title*="Procurement"][data-dyn-title*="sourcing"]
    wait until keyword succeeds     4x  5s      click element       css:a[data-dyn-title="All purchase orders"]

Input pr id "${pr_id}"
    sleep   3s
    click element       //div[@class="columnHeader-label alignmentAuto"][text()="Purchase requisition"]
    wait until keyword succeeds     4x  5s      input text      css:input[id*="_PurchReqId_Input_"]             ${pr_id}
    press key           css:input[id*="_PurchReqId_Input_"]         \\13

Convert PR to PO
    wait until keyword succeeds     4x  5s      click element       css:span[id*="PurchaseOrderMenuItemButton"]

Verify created PO
    wait until element is visible                       css:span[title*="has been created."]
    ${msg}=                             get text        css:span[title*="has been created."]
    log to console                      ${msg}

################
Click create PO
    wait until keyword succeeds     4x  5s      click element           //span[@class="button-label"][text()="New"]

Input vendor account "${vend_acct}" [PO]
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchCreateOrder_"][id*="_PurchTable_OrderAccount_input"]     ${vend_acct}

Input start date for PO "${start_date}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchCreateOrder_"][id*="_PurchTable_IVZS_FromDate_input"]       ${start_date}

Input end date for PO "${end_date}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchCreateOrder_"][id*="_PurchTable_IVZS_ToDate_input"]         ${end_date}

Click ok to create PO
    sleep   1s
    Click_by_javascript     //span[@class="button-label"][text()="OK"]

#//span[@class="button-label"][text()="Edit"]
Click edit to edit PO
    sleep   1s
    Click_by_javascript     //span[@class="button-label"][text()="Edit"]

Input pr type of po "${pr_type}"
    wait until keyword succeeds     4x    5s        input text      css:input[id*="purchtablelistpage_"][id*="PurchTable_IVZS_BusinessJustification_Description_input"]         ${pr_type}

Input item for po "${item}"
    wait until keyword succeeds     4x    5s        input text      css:input[id*="purchtablelistpage_"][id*="_PurchLine_ItemId_input"]         ${item}

Input unit price for po "${unit_price}"
    wait until keyword succeeds     4x  5s      clear element text          css:input[id*="purchtablelistpage_"][id*="_PurchLine_PurchPriceGrid_input"]
    wait until keyword succeeds     4x  5s      input text                  css:input[id*="purchtablelistpage_"][id*="_PurchLine_PurchPriceGrid_input"]         ${unit_price}

Input received condition "${condition}"
    wait until keyword succeeds     4x  5s      click element   //*[@id="purchtablelistpage_7_PurchLine_IVZS_ReceivedCondition"]/div/div[2]/div
    wait until keyword succeeds     4x  5s      click element      //li[text()="${condition}"]
    sleep   2s

Click financial dimension of po
    Click_by_javascript         //span[@class="pivot-label"][text()="Financial dimensions"]
    sleep   2s

Input cost center for po "${cost_center}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="purchtablelistpage_"][id*="_DECValue_FD01_Costcenter_input"]         ${cost_center}

Input project for po "${project}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="purchtablelistpage_"][id*="_DECValue_FD02_Project_input"]            ${project}
    press key               css:input[id*="purchtablelistpage_"][id*="_DECValue_FD02_Project_input"]        \\13

Click save for PO
    Click_by_javascript         //span[text()="Save"]

Click workflow for po
    wait until keyword succeeds     4x  5s      click element   //button[@data-dyn-controlname="PurchTableWorkflowDropDialog"]

Click submit PO
    wait until element is visible       //button[@data-dyn-controlname="PromotedAction1"]
    click element                       //button[@data-dyn-controlname="PromotedAction1"]
#    wait until keyword succeeds     4x  5s      click element   //button[@data-dyn-controlname="PromotedAction1"]

Click submit again
    wait until keyword succeeds     4x  5s      click element   //span[@class="button-label"][text()="Submit"]