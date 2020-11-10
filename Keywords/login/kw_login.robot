*** Keywords ***
Go to web
    Open Browser        https://setthuat.sandbox.operations.dynamics.com        Chrome
#####################
Input username "${username}"
    sleep   1s
    Input Text       i0116            ${username}
    Click next for inputing password
Click next for inputing password
    click element      idSIButton9
#####################

#####################
Input password "${password}"
    Input Text      i0118             ${password}
    Click signin
Click signin
    sleep   1s
    click element           xpath://input[@id="idSIButton9"]
    click element           xpath://input[@id="idSIButton9"]
#####################

Select Company "${company}"
    click element       xpath://button[@id="CompanyButton"]
    wait until keyword succeeds     4x  5s      input text          //input[@id="SysCompanyChooser_4_DataArea_id_input"]       ${company}
    Press Key          xpath://input[@id="SysCompanyChooser_4_DataArea_id_input"]       \\13
    wait until keyword succeeds     4x  5s      click element       //button[@data-dyn-controlname="Close"]

Go to module
    wait until keyword succeeds     4x  5s      click element       navPaneModuleID

Go to Procurement and sourcing
    sleep   1s
    Go to module
    click element       css:a[data-dyn-title*="Procurement"][data-dyn-title*="sourcing"]
    sleep   1s
    click element       css:a[data-dyn-title*="Purchase"][data-dyn-title*="prepared"]






