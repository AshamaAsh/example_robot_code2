*** Keywords ***
Go to web
    Open Browser            https://webpage            Chrome
    Maximize Browser Window
#####################
Input username "${username}"
    Sleep   2s
    Input Text              someid            ${username}
    Click next for inputing password

Click next for inputing password
    Click Element           someid
#####################

#####################
Input password "${password}"
    Input Text              someid             ${password}
    Click signin

Click signin
    Sleep   2s
    click element           xpath://input[@id="someid"]
    click element           xpath://input[@id="someid"]
#####################

Login success and show home page correctly
    Wait Until Element Is Visible           //img[@src="resources/images/somepics.jpg"]
#    Title Should Be                         Finance and Operations

Select Company "${company}"
    Click Element           xpath://button[@id="someid"]
    wait until keyword succeeds     4x  5s      input text          //input[@id="someid"]       ${company}
    Press Keys              xpath://input[@id="someid"]              RETURN
    wait until keyword succeeds     4x  5s      click element       //button[@data-dy="Close"]

Go to module
    wait until keyword succeeds     4x  5s      click element       someid

Go to Procurement and sourcing
    sleep   1s
    Go to module
    click element       css:a[data-dyn-title*="Procurement"]
    sleep   1s
    click element       css:a[data-dyn-title*="Purchase"]






