*** Keywords ***
#Expense management
Go to "${main_module}" and select "${sub_module}"
    click element       xpath://a[@class="modulesPane-module"][text()="${main_module}"]
#    click element       xpath://a[@data-dyn-title="Purchase requisitions"]
    sleep       1s
    click element       xpath://div[@aria-label="${sub_module}"]

Click new for creating cash advances
    wait until keyword succeeds     4x  5s      click element       //button[@id="trvcashadvances_6_SystemDefinedNewButton"]

Input requested day "${requestDay}"
    wait until keyword succeeds     4x  5s      clear element text      //input[@id="trvcashadvances_6_General_RequestedDate_input"]
    wait until keyword succeeds     4x  5s      input text              //input[@id="trvcashadvances_6_General_RequestedDate_input"]      ${requestDay}

Input requested amount "${requestAmount}"
    wait until keyword succeeds     4x  5s      input text      //input[@id="trvcashadvances_6_Amount_RequestedAmountCur_input"]        ${requestAmount}

Input cost center "${cost_center}"
    wait until keyword succeeds     4x  5s      input text      //input[@id="trvcashadvances_6_DimensionEntryControl_DECValue_FD01_Costcenter_input"]       ${cost_center}

Input project "${project}"
    wait until keyword succeeds     4x  5s      input text      //input[@id="trvcashadvances_6_DimensionEntryControl_DECValue_FD02_Project_input"]          ${project}
    Press key           //input[@id="trvcashadvances_6_DimensionEntryControl_DECValue_FD02_Project_input"]          \\13

Click yes to change tax brach to head quarter
    wait until keyword succeeds     4x  5s      click element   //button[@id="SysBoxForm_6_Ok"]

Input tax branch "${taxBranch}"
    wait until keyword succeeds     4x  5s      input text      //input[@id="trvcashadvances_6_DimensionEntryControl_DECValue_FD09_TaxBranch_input"]        ${taxBranch}

Click save cash advance
    wait until keyword succeeds     4x  5s      click element    //button[@id="trvcashadvances_6_SystemDefinedSaveButton"]

Click workflow
    wait until keyword succeeds     4x  5s      click element   //span[@id="trvcashadvances_6_WorkflowActionBarButtonGroup_label"]

Click submit cash advance
    wait until keyword succeeds     4x  5s      click element   //button[@id="trvcashadvances_6_WorkflowActionBarSubmitButton"]

Click submit again
    wait until keyword succeeds     4x  5s      click element   //span[@id="WorkflowSubmitDialog_7_Submit_label"]