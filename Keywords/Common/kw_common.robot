*** Settings ***
Library         SeleniumLibrary        timeout=10      implicit_wait=10
Library         DateTime
Library         RequestsLibrary
Library         Collections
Library         String

*** Variables ***
${url_web}=         sampleurl

*** Keywords ***
####
Wait for loading page
    sleep   2s

wait for loading data
    sleep   1s
####
User enter to website "${url_web}"
    ${url_web}=                     set variable        ${url_web}${/}
    log                             ${url_web}
    set selenium speed              0.15s
    open browser                    ${url_web}          Chrome
    Maximize Browser Window
    Execute javascript              document.body.style.zoom="110%"
    set suite variable              ${url_web}

User login with username "${username}" and "${password}"
    Input Text                  id:someid             ${username}
    Input Text                  id:someid              ${password}
    wait for loading page
    Click_by_javascript         btn-someid

System show message of
    page should contain element         //div[@class="someclass"]

Click accept condition
    wait until keyword succeeds     5x      4s      click element               //label[text()="Accept"]

User select creation and redemption menu
    Click_by_javascript               somepath
    Click_by_javascript               somepath

Select some menu
    Click_by_javascript             somepath

Select creation and redemption menu
    Click_by_javascript             somepath

Select create creation and redemption
    Click_by_javascript             somepath

Transaction date shows current date
#    ${date_now}=    Evaluate    '{dt.day}/{dt.month}/{dt.year}'.format(dt=datetime.datetime.now())    modules=datetime
#    ${date}=        convert date        ${date_now}         	result_format=%d.%mm.%Y
    ${date}=        get_date_time
    ${value}=       get value            id:someid
    should be equal         ${value}             ${date}

PD/MM ID show "${expected_parti_id}"
    ${actual_parti_id}=          get value           id:someid
    ${actual_parti_id}=          strip string        ${actual_parti_id}
    should be equal         ${actual_parti_id}             ${expected_parti_id}

PD/MM short name show "${expected_parti_short_name}"
    ${actual_parti_shortName}=          Get value                       id:someid
    ${actual_parti_shortName}=          strip string                    ${actual_parti_shortName}
    should be equal             ${actual_parti_shortName}           ${expected_parti_short_name}

PD/MM full name show "${expected_parti_full_name}"
    ${str}=                         Get value                       id:someid
    ${actual_parti_fullName}=       strip string                    ${str}
    should be equal                 ${actual_parti_fullName}        ${expected_parti_full_name}

Get access token from "${web_login}" and set it in variable "${request}" for authorization
    [Documentation]     get access token in each re-login and put it to variable for authorization
    set to dictionary                   ${web_login}     url=${url_web}

    ${result}=                          Send post api           ${web_login}

    ${actual_access_token}=             Get From Dictionary     ${result.json()}     accessToken
    ${json_str}=        evaluate        json.dumps(${result.content})     json
    ${json_dic}=        evaluate        json.loads('''${json_str}''')       json
    set to dictionary           ${request["headers"]}    Authorization=Bearer ${actual_access_token}
    Set Suite variable          ${actual_access_token}
    [Return]            ${request}

Get expected settlement date from api
    set to dictionary                   ${get_settlement_date_from_api}             url=${url_web}
    ${get_settlement_date_from_api}=    Get access token from "${web_login}" and set it in variable "${get_settlement_date_from_api}" for authorization
    ${date}=        get_date_for_api
    set to dictionary    ${get_settlement_date_from_api["params"]}    txnDate=${date}
    ${result}=      Send get api            ${get_settlement_date_from_api}
    ${expected_settlement_date}=          Get From Dictionary     ${result.json()}     settlementDate
    Set Suite variable           ${expected_settlement_date}

Get expected cash amount of "${some}" from api
    set to dictionary             ${get_cash_amount}                     url=${url_web}
    ${get_cash_amount}=    Get access token from "${web_login}" and set it in variable "${get_cash_amount}" for authorization
    ${date}=        get_date_for_api
    set to dictionary    ${get_cash_amount["body"]}    txnDate=${date}
    set to dictionary    ${get_cash_amount["body"]}    somesecurityid=${somesecurityid}
#    log             ${get_cash_amount}
    ${result}=      Send post api            ${get_cash_amount}
    ${expected_cash_amount}=          Get From Dictionary     ${result.json()}     cashAmount
    Set Suite variable           ${expected_cash_amount}

Get actual settlement date from screen
    ${actual_sttDate}=          Get_value_by_javascript        settlementDate
    ${actual_settlement_date}=                change_format_date      ${actual_sttDate}
    Set Suite variable         ${actual_settlement_date}

Settlement date "${actual_settlement_date}" show "${expected_settlement_date}"
    Should be equal     ${actual_settlement_date}     ${expected_settlement_date}


Call api get parti info "${partiID}"
    set to dictionary               ${get_parti_info_from_api}                 url=${url_web}
    ${get_parti_info_from_api}=    Get access token from "${web_login}" and set it in variable "${get_parti_info_from_api}" for authorization
#    ${access_token}=        Get From Dictionary     ${get_parti_info_from_api}       Authorization
    Set to dictionary       ${get_parti_info_from_api["params"]}    partiID=${partiID}
    ${result}=              Send get api            ${get_parti_info_from_api}
    ${parti}=                           Get From Dictionary     ${result.json()}     content
    [Return]                            ${parti}

Call api get some info "${some_sym}"
    set to dictionary               ${get_some_info_from_api}                 url=${url_web}
    ${get_some_info_from_api}=       Get access token from "${web_login}" and set it in variable "${get_some_info_from_api}" for authorization
    log             ${get_some_info_from_api}
    Set to dictionary               ${get_some_info_from_api["params"]}      securityAssetAbbr=${some_sym}
    ${result}=                      Send get api            ${get_some_info_from_api}
#    ${some_info}=                    Get From Dictionary     ${result.json()}     content
    log many            ${result.content}
    [Return]                        ${result}

Get expected parti info "011"
    ${parti}=       Call api get parti info "011"
    ${parti_sth}=      Create dictionary      parti_id=            parti_abbr=         parti_name_eng=
    ${parti_sth.parti_id}=                  Get From Dictionary     ${parti}[0]     partiID
    ${parti_sth.parti_abbr}=                Get From Dictionary     ${parti}[0]     partiAbbr
    ${parti_sth.parti_name_eng}=            Get From Dictionary     ${parti}[0]     partiNameEng
    Set Suite variable           ${parti_sth}

Get expected parti info "sth"
    ${parti}=       Call api get parti info "002"
    ${parti_sth}=      Create dictionary      parti_id=            parti_abbr=         parti_name_eng=
    ${parti_sth.parti_id}=                  Get From Dictionary     ${parti}[0]     partiID
    ${parti_sth.parti_abbr}=                Get From Dictionary     ${parti}[0]     partiAbbr
    ${parti_sth.parti_name_eng}=            Get From Dictionary     ${parti}[0]     partiNameEng
    Set Suite variable           ${parti_sth}

Get expected some symbol from api "somefund"
    ${some}=       Call api get some info "somefund"
    log         ${some.content}
    ${some_somefund}=      Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=      cuShareQty=     securityAssetID=       registrarNameEng=
    ${dict_some}=       Get From Dictionary    ${some.json()}         content
    ${some_somefund.securityAssetAbbr}=       Get From Dictionary     ${dict_some}[0]     securityAssetAbbr
    ${some_somefund.isinCode}=                Get From Dictionary     ${dict_some}[0]     isinCode
    ${some_somefund.securityNameEng}=         Get From Dictionary     ${dict_some}[0]     securityNameEng
    ${some_somefund.cuShareQty}=              Get From Dictionary     ${dict_some}[0]     cuShareQty
    ${some_somefund.securityAssetID}=         Get From Dictionary     ${dict_some}[0]     securityAssetID
    ${some_somefund.registrarNameEng}=        Get From Dictionary     ${dict_some}[0]     registrarNameEng
    Set Suite variable                    ${some_somefund}

Get expected some symbol from api "TDEX"
    ${some}=       Call api get some info "TDEX"
    ${some_tdex}=      Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=      cuShareQty=    securityAssetID=          registrarNameEng=
    ${dict_some}=       Get From Dictionary    ${some.json()}         content
    ${some_tdex.securityAssetAbbr}=       Get From Dictionary     ${dict_some}[0]     securityAssetAbbr
    ${some_tdex.isinCode}=                Get From Dictionary     ${dict_some}[0]     isinCode
    ${some_tdex.securityNameEng}=         Get From Dictionary     ${dict_some}[0]     securityNameEng
    ${some_tdex.cuShareQty}=              Get From Dictionary     ${dict_some}[0]     cuShareQty
    ${some_tdex.securityAssetID}=         Get From Dictionary     ${dict_some}[0]     securityAssetID
    ${some_tdex.registrarNameEng}=        Get From Dictionary     ${dict_some}[0]     registrarNameEng
    Set Suite variable             ${some_tdex}          #return ปรับ ให้เป็น

Get expected some symbol from api "PTT"
    ${some}=       Call api get some info "PTT"
    log           ${some.content}
    ${some_ptt}=      Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=      cuShareQty=     securityAssetID=       registrarNameEng=
    ${dict_some}=       Get From Dictionary    ${some.json()}         content
    ${some_ptt.securityAssetAbbr}=       Get From Dictionary     ${dict_some}[0]     securityAssetAbbr
    ${some_ptt.isinCode}=                Get From Dictionary     ${dict_some}[0]     isinCode
    ${some_ptt.securityNameEng}=         Get From Dictionary     ${dict_some}[0]     securityNameEng
    ${some_ptt.cuShareQty}=              Get From Dictionary     ${dict_some}[0]     cuShareQty
    ${some_ptt.securityAssetID}=         Get From Dictionary     ${dict_some}[0]     securityAssetID
    ${some_ptt.registrarNameEng}=        Get From Dictionary     ${dict_some}[0]     registrarNameEng
    Set Suite variable                    ${some_ptt}

Call api get AOT stock info
    set to dictionary               ${get_ul_aot_from_api}                 url=${url_web}
    ${get_ul_aot_from_api}=         Get access token from "${web_login}" and set it in variable "${get_ul_aot_from_api}" for authorization
    ${date}=                        get_date_for_api
    set to dictionary               ${get_ul_aot_from_api["params"]}    txnDate=${date}
    ${result}=                      Send get api                        ${get_ul_aot_from_api}
    [Return]        ${result}

Get expected AOT stock(TSD) from api
    ${ul}=              Call api get AOT stock info
    ${ul_aot}=          Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=
    ${dict_ul}=        Get From Dictionary    ${ul.json()}         content
    ${ul_aot.securityAssetAbbr}=       Get From Dictionary     ${dict_ul}[0]     securityAssetAbbr
    ${ul_aot.isinCode}=                Get From Dictionary     ${dict_ul}[0]     isinCode
    ${ul_aot.securityNameEng}=         Get From Dictionary     ${dict_ul}[0]     securityNameEng
    Set Suite variable           ${ul_aot}

Call api get some account info "${some_account}"
    set to dictionary               ${get_some_account_from_api}                 url=${url_web}
    ${get_some_info_from_api}=       Get access token from "${web_login}" and set it in variable "${get_some_account_from_api}" for authorization
    Set to dictionary               ${get_some_account_from_api["params"]}      accountNo=${some_account}
    ${result}=                      Send get api            ${get_some_account_from_api}
#    ${some_info}=                    Get From Dictionary     ${result.json()}     content
    [Return]                        ${result}

Get expected some account from api
    set to dictionary               ${get_some_account_from_api}                 url=${url_web}
    ${get_some_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_some_account_from_api}" for authorization
    ${result}=      Send get api            ${get_some_account_from_api}
    ${content}=                                 Get From Dictionary     ${result.json()}    content
    ${expected_some_account}                Create dictionary       acc_no=         acc_flag=       acc_name=
    ${expected_some_account.acc_no}=                 Get From Dictionary     ${content}[0]    accountNo
    ${expected_some_account.acc_flag}=               Get From Dictionary     ${content}[0]    pcFlagDesc
    ${expected_some_account.acc_name}=               Get From Dictionary     ${content}[0]    accountName
    Set Suite variable            ${expected_some_account}

Get expected some another account from api
    set to dictionary                       ${get_some_another_account_from_api}                 url=${url_web}
    ${get_some_another_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_some_another_account_from_api}" for authorization
    ${result}=      Send get api            ${get_some_another_account_from_api}
    ${content}=                                 Get From Dictionary     ${result.json()}    content
    ${expected_some_another_account}                Create dictionary       acc_no=         acc_flag=       acc_name=
    ${expected_some_another_account.acc_no}=                 Get From Dictionary     ${content}[0]    accountNo
    ${expected_some_another_account.acc_flag}=               Get From Dictionary     ${content}[0]    pcFlagDesc
    ${expected_some_another_account.acc_name}=               Get From Dictionary     ${content}[0]    accountName
    Set Suite variable            ${expected_some_another_account}

Get expected some account info "sth"
    ${some_account}=       Call api get some account info "0110000017"
    ${some_account_sth}=      Create dictionary      acc_no=            acc_flag=         acc_name=
    ${some_account_sth.acc_no}=                 Get From Dictionary     ${parti}[0]     accountNo
    ${some_account_sth.acc_flag}=               Get From Dictionary     ${parti}[0]     pcFlagDesc
    ${some_account_sth.acc_name}=               Get From Dictionary     ${parti}[0]     accountName
    Set Suite variable           ${some_account_sth}

Get expected UL account from api
    set to dictionary              ${get_ul_account_from_api}                 url=${url_web}
    ${get_ul_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_ul_account_from_api}" for authorization
    ${result}=      Send get api            ${get_ul_account_from_api}
    ${content}=                                 Get From Dictionary     ${result.json()}    content
    ${expected_ul_account}                      Create dictionary       acc_no=         acc_flag=       acc_name=
    ${expected_ul_account.acc_no}=              Get From Dictionary     ${content}[0]    accountNo
    ${expected_ul_account.acc_flag}=            Get From Dictionary     ${content}[0]    pcFlagDesc
    ${expected_ul_account.acc_name}=            Get From Dictionary     ${content}[0]    accountName
    Set Suite variable                          ${expected_ul_account}

Get expected holder account from api
    set to dictionary                      ${get_holder_account_sth_from_api}                 url=${url_web}
    ${get_holder_account_sth_from_api}=    Get access token from "${web_login}" and set it in variable "${get_holder_account_sth_from_api}" for authorization
    ${result}=                      Send get api            ${get_holder_account_sth_from_api}
#    ${holder_acc}=                  Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=
    ${holder_acc_name}=             Get From Dictionary     ${result.json()}         accountName
    set suite variable              ${holder_acc_name}

Get expected unit holder account from api :parti id 200
    set to dictionary                       ${get_unit_holder_account_from_api}                 url=${url_web}
    ${get_unit_holder_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_unit_holder_account_from_api}" for authorization
    ${result}=                      Send get api            ${get_unit_holder_account_from_api}
#    ${holder_acc}=                  Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=
    ${unit_holder_name}=             Get From Dictionary     ${result.json()}         unitHolderName
    set suite variable              ${unit_holder_name}

Get expected unit holder account from api :parti id some
    set to dictionary                       ${get_unit_holder_account_520_from_api}                 url=${url_web}
    ${get_unit_holder_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_unit_holder_account_some_from_api}" for authorization
    ${result}=                           Send get api            ${get_unit_holder_account_from_api}
#    ${holder_acc}=                  Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=
    ${unit_holder_name}=             Get From Dictionary     ${result.json()}         unitHolderName
    set suite variable              ${unit_holder_name_some}

Get expected unit holder account from api :parti id some
    set to dictionary                       ${get_unit_holder_account_some_from_api}                 url=${url_web}
    ${get_unit_holder_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_unit_holder_account_525_from_api}" for authorization
    ${result}=                              Send get api            ${get_unit_holder_account_from_api}
#    ${holder_acc}=                  Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=
    ${unit_holder_name}=             Get From Dictionary     ${result.json()}         unitHolderName
    set suite variable              ${unit_holder_name_525}

Get expected unit holder account from api: incash :AM as PD
    set to dictionary                       ${get_unit_holder_inquiry}                 url=${url_web}
    ${get_unit_holder_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_unit_holder_inquiry}" for authorization
    ${result}=                              Send get api            ${get_unit_holder_account_from_api}
    ${content}=                             Get From Dictionary     ${result.json()}    content
    ${unit_holder_role_am}=                     Create dictionary       unitHolderID=            pcFlagDesc=         unitholderName=
    ${unit_holder_role_am.unitHolderID}=        Get From Dictionary     ${content}[0]           unitHolderID
    ${unit_holder_role_am.pcFlagDesc}=          Get From Dictionary       ${content}[0]         pcFlagDesc
    ${unit_holder_role_am.unitholderName}=      Get From Dictionary     ${content}[0]           unitholderName
    set suite variable                          ${unit_holder_role_am}

System show some table same as expected pdf data
    wait for loading data
    ${notMatch}=            Compare_some_table_with_expected_data      //table[@id='enquiry_table']           ${expected_pdf_data}       ${creat_redemp_volume_cu}       ${expected_some_account}        ${expected_ul_account}   ${parti_sth}
    Should Be Equal         ${notMatch}             ${0}

System show some table same as expected pdf data of in cash
    wait for loading data
    ${notMatch}=    Compare_some_table_with_expected_data_incash      //table[@id='enquiry_table']           ${expected_pdf_data}       ${creat_redemp_volume_cu}       ${expected_some_account}        ${expected_ul_account}   ${parti_sth}
    Should Be Equal         ${notMatch}             ${0}

System show some table same as expected pdf data of in cash: AM as PD
    wait for loading data
    ${notMatch}=    Compare_some_table_with_expected_data_incash_AM      //table[@id='enquiry_table']          ${expected_pdf_data}         ${parti_sth}
    Should Be Equal         ${notMatch}             ${0}

System show some table same as expected pdf data: not fully
    wait for loading data
    ${notMatch}=            Compare_some_table_with_expected_data_not_fully      //table[@id='enquiry_table']           ${expected_pdf_data}       ${creat_redemp_volume_cu}
    Should Be Equal         ${notMatch}             ${0}

Get expected available issuing limit of "${some}" from api
    set to dictionary               ${get_avail_from_api}                 url=${url_web}
    ${get_avail_somefund_from_api}=    Get access token from "${web_login}" and set it in variable "${get_avail_from_api}" for authorization
    Set to dictionary               ${get_avail_from_api["params"]}    someSecurityAssetID=${some.securityAssetID}
    ${result}=      Send get api            ${get_avail_from_api}
    ${expected_avail_limit}=                 Get From Dictionary     ${result.json()}    availableIssuingLimitQty
    Set Suite variable                      ${expected_avail_limit}

Get expected pdf data of "${some}" from api
    set to dictionary               ${get_pdf_data_from_api}                 url=${url_web}
    ${get_pdf_data_from_api}=       Get access token from "${web_login}" and set it in variable "${get_pdf_data_from_api}" for authorization
    ${date}=        get_date_for_api
    Set to dictionary    ${get_pdf_data_from_api["params"]}    txnDate=${date}
    Set to dictionary    ${get_pdf_data_from_api["params"]}    someSecurityAssetID=${some.securityAssetID}
    ${result}=      Send get api            ${get_pdf_data_from_api}
    ${expected_pdf_data}=          Get From Dictionary     ${result.json()}     content
    Set Suite variable           ${expected_pdf_data}

Settlement date show "${expected_settlement_date}"
    ${actual_sttDate}=          Get_value_by_javascript        settlementDate
    ${actual_settlement_date}=                change_format_date      ${actual_sttDate}
    Should be equal     ${actual_settlement_date}     ${expected_settlement_date}

###### NUT 2 ##########

Get expected user detail from api
    set to dictionary                ${get_user_detail_from_api}                 url=${url_web}
    ${get_user_detail_from_api}=     Get access token from "${web_login}" and set it in variable "${get_user_detail_from_api}" for authorization
    ${result}=       Send get api            ${get_user_detail_from_api}
    ${user}=         Create dictionary      userFullName=            sysPartiID=         partiID=      partiNameEng=     partiAbbr=
    ${user.userFullName}=               Get From Dictionary     ${result.json()}     userFullName
    ${user.sysPartiID}=                 Get From Dictionary     ${result.json()}     sysPartiID
    ${user.partiID}=                    Get From Dictionary     ${result.json()}     partiID
    ${user.partiNameEng}=               Get From Dictionary     ${result.json()}     partiNameEng
    ${user.partiAbbr}=                  Get From Dictionary     ${result.json()}     partiAbbr
    Set Suite variable           ${user}

Get expected some symbol from api "somefund"
    ${some}=       Call api get some info "somefund"
    ${some_somefund}=      Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=      cuShareQty=    securityAssetID=
    ${dict_some}=       Get From Dictionary    ${some.json()}         content
    ${some_somefund.securityAssetAbbr}=       Get From Dictionary     ${dict_some}[0]     securityAssetAbbr
    ${some_somefund.isinCode}=                Get From Dictionary     ${dict_some}[0]     isinCode
    ${some_somefund.securityNameEng}=         Get From Dictionary     ${dict_some}[0]     securityNameEng
    ${some_somefund.cuShareQty}=              Get From Dictionary     ${dict_some}[0]     cuShareQty
    ${some_somefund.securityAssetID}=         Get From Dictionary     ${dict_some}[0]     securityAssetID
    Set Suite variable             ${some_somefund}

###check confirm parti ID
Get expected data of "${some}" from api: inquiry confirm/reject
    set to dictionary               ${get_trans_inquiry}                 url=${url_web}
    ${get_trans_inquiry}=           Get access token from "${web_am_login}" and set it in variable "${get_trans_inquiry}" for authorization
    ${date}=                        get_date_for_api
    Set to dictionary    ${get_trans_inquiry["params"]}    txnDate=${date}
    Set to dictionary    ${get_trans_inquiry["params"]}    someSecurityAssetID=${some.securityAssetID}
    log         ${get_trans_inquiry}
    ${result}=      Send get api            ${get_trans_inquiry}
    log         ${result.content}
    ${expected_data_confirm_inquiry}=       Get From Dictionary     ${result.json()}     content
    Set Suite variable                      ${expected_data_confirm_inquiry}

