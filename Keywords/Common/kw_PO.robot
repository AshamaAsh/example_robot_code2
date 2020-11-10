*** Keywords ***
#//div[@class="columnHeader-label alignmentAuto"][text()="Purchase requisition"]
Go to release approved purchase requisition
    Go to module
    wait until keyword succeeds     4x  5s      click element       css:a[data-dyn-title*="Procurement"][data-dyn-title*="sourcing"]
    wait until keyword succeeds     4x  5s      click element       css:a[data-dyn-title="Release approved purchase requisitions"]

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