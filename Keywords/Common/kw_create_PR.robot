*** Settings ***
Library         ../../Keywords/Common/kw_common.py

*** Keywords ***
Click new for new PR
    wait until keyword succeeds     4x  5s   click element       //div[@class="button-container"]/span[@class="button-commandRing New-symbol"]

####store variable in file
Get PR id
    ${new_prNumber}=       get value       css:input[id*="PurchReqCreate_"][id*="_PurchReqId_input"]
    set suite variable      ${new_prNumber}
    Dump pr number into file
    Get pr number from file
Dump pr number into file
    Dump_Variable_To_File          ${new_prNumber}        pr_number.txt
Get pr number from file
    ${created_pr_number}=                  Load_Variable_From_File     pr_number.txt
    set global variable                    ${created_pr_number}
#################################

Input PR subject "${subject}"
    wait until keyword succeeds    4x  5s   input text      css:input[id*="PurchReqCreate_"][id*="_PurchReqName_input"]       ${subject}
    Get PR id

Select PR type "${type}"
    wait until keyword succeeds     4x  5s      click element       PurchReqBusinessJustificationCodes_SysTL_4_Grid_RowTemplate_Row0_row_${type}

Input PR type "${prtype}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqCreate_"][id*="_Description_input"]      ${prtype}

Start date "${start_date}" and end date "${end_date}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqCreate_"][id*="_FromDate_input"]       ${start_date}
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqCreate_"][id*="_ToDate_input"]         ${end_date}

Click by amount
    wait until keyword succeeds     4x  5s      click element   css:span[id*="PurchReqCreate"][id*="ProgressAmount_toggle"]

Click OK to create PR
    wait until keyword succeeds     4x  5s      click button        css:button[id*="PurchReqCreate_"][id*="OK"]

Input budget year "${date}"
    sleep   1s
    input text      css:input[id*="PurchReqTable_"][id*="_PurchReqTable_TransDate_input"]       ${date}
#### Add line
Click add line
    wait until keyword succeeds     4x  5s      click element       css:button[id*="PurchReqTable_"][id*="_PurchReqNewLine"]

#Select buying legal entity "${company}"
#    wait until keyword succeeds     4x  5s      click element      //input[@title="${company}"]
Input reqester "${req_name}"
    wait until element is visible       css:input[id*="PurchReqTable_"][id*="_DirPerson_FK_Name_input"][id*="PurchReqLine_Requisitioner"]
    clear element text                  css:input[id*="PurchReqTable_"][id*="_DirPerson_FK_Name_input"][id*="PurchReqLine_Requisitioner"]
    wait until keyword succeeds         4x  5s      input text      css:input[id*="PurchReqTable_"][id*="_DirPerson_FK_Name_input"][id*="PurchReqLine_Requisitioner"]           ${req_name}

Input buying legal entity "${company}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqTable_"][id*="_DataArea_input"]          ${company}
    click element                   css:input[id*="PurchReqTable_"][id*="_DataArea_input"]

Input item number "${item_number}"
    wait until keyword succeeds     4x  5s      input text     css:input[id*="PurchReqTable_"][id*="PurchReqLine_ItemId_input"]       ${item_number}

Input quantity "${quantity}"
    wait until keyword succeeds     4x  5s      input text     css:input[id*="PurchReqTable_"][id*="_PurchReqLine_PurchQty_input"]      ${quantity}

Input unit price "${unit_price}"
    wait until keyword succeeds     4x  5s      input text     css:input[id*="PurchReqTable_"][id*="_PurchReqLine_PurchPrice_input"]     ${unit_price}

Click financial dimension
    wait until keyword succeeds     4x  5s      click element   css:li[title*="Financial"][title*="dimension"]

Input cost center for financial dimension "${costCenter}"
    wait until element is visible               css:input[id*="PurchReqTable_"][id*="Costcenter_input"][id*="DECValue"]
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqTable_"][id*="Costcenter_input"][id*="DECValue"]        ${costCenter}

Input project for financial dimension "${project}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqTable_"][id*="_Project_input"][id*="DECValue"]       ${project}
    sleep   1s

Input security type for financial dimension "${sec_type}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqTable_"][id*="_SecurityType_input"][id*="DECValue"]      ${sec_type}
    sleep   1s

Input product for financial dimension "${product}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqTable_"][id*="_Product_input"][id*="DECValue"]           ${product}
    press key                                                   css:input[id*="PurchReqTable_"][id*="_Product_input"][id*="DECValue"]           \\13
    sleep   1s

Input system IT for financial dimension "${sys_it}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqTable_"][id*="_SystemIT_input"][id*="DECValue"]          ${sys_it}
    sleep   1s

Input

#input[id*="PurchReqTable_"][id*="_Affiliate_input"][id*="DECValue"]
Input affiliate for financial dimension "${affi}"
    wait until keyword succeeds     4x  5s      input text      css:input[id*="PurchReqTable_"][id*="_Affiliate_input"][id*="DECValue"]          ${affi}
    sleep   1s

Click change vendor
    wait until element is visible       css:span[id*="PurchReqTable"][id*="PurchReqEditService_label"]
    wait until keyword succeeds     4x  5s      click element       css:span[id*="PurchReqTable"][id*="PurchReqEditService_label"]
    sleep   1s

Input vendor name "${vend_name}"
    sleep   2s
    wait until element is visible       css:input[id*="SysOperationTemplateForm_"][id*="_input"]
    wait until keyword succeeds     4x  5s      input text       css:input[id*="SysOperationTemplateForm_"][id*="_input"]       ${vend_name}
    press key                           css:input[id*="SysOperationTemplateForm_"][id*="_input"]        \\13
    sleep   1s

Verify vendor name "${ven_name}"
    wait until element is visible                   css:input[id*="PurchReqTable_"][id*="vendName_input"][name="vendName"]
    ${actual_name}=     Get Element Attribute       css:input[id*="PurchReqTable_"][id*="vendName_input"][name="vendName"]      title
    should be equal     ${ven_name}     ${actual_name}

#####################
Submit PR and sending to approval process
    Click save
    Click workflow
    Click submit PR for approving
    Click submit again

Recall PR for draft status
    Click workflow
    Click recall
#    Click recall PR
    Confirm recall

Click save
    wait until keyword succeeds     4x  5s      click element   css:span[id*="PurchReqTable"][id*="SystemDefinedSaveButton"]
Click workflow
    wait until keyword succeeds     4x  5s      click element   css:span[for*="PurchReqTable_"][for*="WorkflowDropDialog"]
Click recall
    sleep   3s
    wait until element is visible       //span[@class="button-label"][text()="Recall"]
    click element                       //span[@class="button-label"][text()="Recall"]
Confirm recall
    wait until keyword succeeds     4x  5s      click element   css:button[id*="WorkflowCancel"][id*="Ok"]
Click submit PR for approving
    wait until element is visible       //button[@data-dyn-controlname="PromotedAction1"]
    click element                       //button[@data-dyn-controlname="PromotedAction1"]
#    wait until keyword succeeds     4x  5s      click element   //button[@data-dyn-controlname="PromotedAction1"]
Click submit again
    wait until keyword succeeds     4x  5s      click element   //span[@class="button-label"][text()="Submit"]
Click refresh button
    sleep   1s
#    Click_by_javascript         //button[@id="PurchReqTable_4_SystemDefinedRefreshButton"]
    click element               css:.button-commandRing.Refresh-symbol
#####################

Click close window to verrify created PR
    wait until keyword succeeds     4x  5s      click element        css:button[id*="PurchReqTable"][id*="DefinedCloseButton"]

Verify created PR
    wait until element is visible               css:input[title*="${new_prNumber}"]
    ${created_PR}=      get value               css:input[title*="${new_prNumber}"]
    should be equal     ${new_prNumber}         ${created_PR}

Verify PR status "${status}"
    Click refresh button
    wait until element is visible       css:input[title="${status}"][id*="StatusCopyTitle_input"]
#    click element                       css:button[id*="RefreshButton"][id*="PurchReqTable"]

Edit PR detail
    wait until keyword succeeds     4x  5s      click element       css:button[id*="EditButton"][id*="PurchReqTable"]

Click latest created PR
    wait until keyword succeeds     4x  5s      click element       css:input[title*="${new_prNumber}"]
########################
#Refresh window
#    reload page

Click recall PR
    wait until element is visible       css:span[id*="PromotedAction1"]
    ${action1}=         get value       css:span[id*="PromotedAction1"]
    ${action2}=         get value       css:span[id*="PromotedAction2"]
    run keyword if  '${action1}' != 'Recall'
    ...         run keyword         click element       css:button[id*="PromotedAction2"]
    ...         ELSE                click element       css:button[id*="PromotedAction1"]

Click PR number
    wait until element is visible       css:input[title*="PR20001025"]
    click element                       css:input[title*="PR20001025"]

#Get text
#    Click workflow
#    sleep   1s
#    wait until element is visible       //span[@class="button-label"][text()="Recall"]
#    click element                       //span[@class="button-label"][text()="Recall"]

########### approve PR
Accept and complete pr after creating
    Click created PR
    Click accept workflow for approving
    sleep  1s
    Click complete workflow for approving

Click created PR
    click refresh button
    wait until element is visible       css:input[title*="${created_pr_number}"]
    click element                       css:input[title*="${created_pr_number}"]

Click accept workflow for approving
    Click workflow
    sleep   1s
    wait until element is visible               //span[@class="button-label"][text()="Accept"]
    wait until keyword succeeds     4x  5s      click element            //span[@class="button-label"][text()="Accept"]
    sleep   1s
    wait until keyword succeeds     4x  5s      click element           //span[@class="button-label"][text()="Accept"]

Click complete workflow for approving
    click workflow
    sleep  1s
    wait until element is visible               //span[@class="button-label"][text()="Complete"]
    wait until keyword succeeds     4x  5s      Click_by_javascript           //span[@class="button-label"][text()="Complete"]
    sleep   1s
    wait until keyword succeeds     4x  5s      Click_by_javascript           //span[@class="button-label"][text()="Complete"]

Click Approve workflow
    click workflow
    sleep  1s
    wait until element is visible               //span[@class="button-label"][text()="Approve"]
    wait until keyword succeeds     4x  5s      click element           //span[@class="button-label"][text()="Approve"]

