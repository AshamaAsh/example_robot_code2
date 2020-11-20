*** Keywords ***
Go to web
    Open Browser            https://setthuat.sandbox.operations.dynamics.com            Chrome
    Maximize Browser Window
#####################
Input username "${username}"
    Sleep   2s
    Input Text              i0116            ${username}
    Click next for inputing password

Click next for inputing password
    Click Element           idSIButton9
#####################

#####################
Input password "${password}"
    Input Text              i0118             ${password}
    Click signin

Click signin
    Sleep   2s
    click element           xpath://input[@id="idSIButton9"]
    click element           xpath://input[@id="idSIButton9"]
#####################

Login success and show home page correctly
    Wait Until Element Is Visible           //img[@src="resources/images/defaultCompanyBanner.jpg"]
#    Title Should Be                         Finance and Operations

Select Company "${company}"
    Click Element           xpath://button[@id="CompanyButton"]
    wait until keyword succeeds     4x  5s      input text          //input[@id="SysCompanyChooser_4_DataArea_id_input"]       ${company}
    Press Keys              xpath://input[@id="SysCompanyChooser_4_DataArea_id_input"]              RETURN
    wait until keyword succeeds     4x  5s      click element       //button[@data-dyn-controlname="Close"]

Go to module
    wait until keyword succeeds     4x  5s      click element       navPaneModuleID

Go to Procurement and sourcing
    sleep   1s
    Go to module
    click element       css:a[data-dyn-title*="Procurement"][data-dyn-title*="sourcing"]
    sleep   1s
    click element       css:a[data-dyn-title*="Purchase"][data-dyn-title*="prepared"]






