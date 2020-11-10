*** Settings ***
Library         SeleniumLibrary        timeout=10      implicit_wait=10
Library         DateTime
Library         RequestsLibrary
Library         Collections
Library         String

*** Variables ***
${url_web}=         http://10.22.68.64

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
    Input Text                  id:username             ${username}
    Input Text                  id:password              ${password}
    wait for loading page
    Click_by_javascript         btn-submit

System show message of
    page should contain element         //div[@class="modal-content"]

Click accept condition
    wait until keyword succeeds     5x      4s      click element               //label[text()="Accept"]

User select creation and redemption menu
    Click_by_javascript               Creation&Redemption
    Click_by_javascript               CreateCreation&Redemption

Select ETF menu
    Click_by_javascript             etf

Select creation and redemption menu
    Click_by_javascript             CRRD001menu

Select create creation and redemption
    Click_by_javascript             CreateCreation&Redemption

Transaction date shows current date
#    ${date_now}=    Evaluate    '{dt.day}/{dt.month}/{dt.year}'.format(dt=datetime.datetime.now())    modules=datetime
#    ${date}=        convert date        ${date_now}         	result_format=%d.%mm.%Y
    ${date}=        get_date_time
    ${value}=       get value            id:transactionDate
    should be equal         ${value}             ${date}

PD/MM ID show "${expected_parti_id}"
    ${actual_parti_id}=          get value           id:partiID
    ${actual_parti_id}=          strip string        ${actual_parti_id}
    should be equal         ${actual_parti_id}             ${expected_parti_id}

PD/MM short name show "${expected_parti_short_name}"
    ${actual_parti_shortName}=          Get value                       id:asset-name
    ${actual_parti_shortName}=          strip string                    ${actual_parti_shortName}
    should be equal             ${actual_parti_shortName}           ${expected_parti_short_name}

PD/MM full name show "${expected_parti_full_name}"
    ${str}=                         Get value                       id:asset-name-full
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

Get expected cash amount of "${etf}" from api
    set to dictionary             ${get_cash_amount}                     url=${url_web}
    ${get_cash_amount}=    Get access token from "${web_login}" and set it in variable "${get_cash_amount}" for authorization
    ${date}=        get_date_for_api
    set to dictionary    ${get_cash_amount["body"]}    txnDate=${date}
    set to dictionary    ${get_cash_amount["body"]}    etfSecurityAssetID=${etf_${etf}.securityAssetID}
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

Call api get ETF info "${etf_sym}"
    set to dictionary               ${get_etf_info_from_api}                 url=${url_web}
    ${get_etf_info_from_api}=       Get access token from "${web_login}" and set it in variable "${get_etf_info_from_api}" for authorization
    log             ${get_etf_info_from_api}
    Set to dictionary               ${get_etf_info_from_api["params"]}      securityAssetAbbr=${etf_sym}
    ${result}=                      Send get api            ${get_etf_info_from_api}
#    ${etf_info}=                    Get From Dictionary     ${result.json()}     content
    log many            ${result.content}
    [Return]                        ${result}

Get expected parti info "011"
    ${parti}=       Call api get parti info "011"
    ${parti_011}=      Create dictionary      parti_id=            parti_abbr=         parti_name_eng=
    ${parti_011.parti_id}=                  Get From Dictionary     ${parti}[0]     partiID
    ${parti_011.parti_abbr}=                Get From Dictionary     ${parti}[0]     partiAbbr
    ${parti_011.parti_name_eng}=            Get From Dictionary     ${parti}[0]     partiNameEng
    Set Suite variable           ${parti_011}

Get expected parti info "002"
    ${parti}=       Call api get parti info "002"
    ${parti_002}=      Create dictionary      parti_id=            parti_abbr=         parti_name_eng=
    ${parti_002.parti_id}=                  Get From Dictionary     ${parti}[0]     partiID
    ${parti_002.parti_abbr}=                Get From Dictionary     ${parti}[0]     partiAbbr
    ${parti_002.parti_name_eng}=            Get From Dictionary     ${parti}[0]     partiNameEng
    Set Suite variable           ${parti_002}

Get expected parti info "200"
    ${parti}=       Call api get parti info "200"
    ${parti_200}=      Create dictionary      parti_id=            parti_abbr=         parti_name_eng=
    ${parti_200.parti_id}=                  Get From Dictionary     ${parti}[0]     partiID
    ${parti_200.parti_abbr}=                Get From Dictionary     ${parti}[0]     partiAbbr
    ${parti_200.parti_name_eng}=            Get From Dictionary     ${parti}[0]     partiNameEng
    Set Suite variable           ${parti_200}

Get expected parti info "520"
    ${parti}=       Call api get parti info "520"
    ${parti_520}=      Create dictionary      parti_id=            parti_abbr=         parti_name_eng=
    ${parti_520.parti_id}=                  Get From Dictionary     ${parti}[0]     partiID
    ${parti_520.parti_abbr}=                Get From Dictionary     ${parti}[0]     partiAbbr
    ${parti_520.parti_name_eng}=            Get From Dictionary     ${parti}[0]     partiNameEng
    Set Suite variable           ${parti_520}

Get expected parti info "525"
    ${parti}=           Call api get parti info "525"
    ${parti_525}=       Create dictionary      parti_id=            parti_abbr=         parti_name_eng=
    ${parti_525.parti_id}=                  Get From Dictionary     ${parti}[0]     partiID
    ${parti_525.parti_abbr}=                Get From Dictionary     ${parti}[0]     partiAbbr
    ${parti_525.parti_name_eng}=            Get From Dictionary     ${parti}[0]     partiNameEng
    Set Suite variable           ${parti_525}

Get expected ETF symbol from api "CHINA"
    ${etf}=       Call api get ETF info "CHINA"
    log         ${etf.content}
    ${etf_china}=      Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=      cuShareQty=     securityAssetID=       registrarNameEng=
    ${dict_etf}=       Get From Dictionary    ${etf.json()}         content
    ${etf_china.securityAssetAbbr}=       Get From Dictionary     ${dict_etf}[0]     securityAssetAbbr
    ${etf_china.isinCode}=                Get From Dictionary     ${dict_etf}[0]     isinCode
    ${etf_china.securityNameEng}=         Get From Dictionary     ${dict_etf}[0]     securityNameEng
    ${etf_china.cuShareQty}=              Get From Dictionary     ${dict_etf}[0]     cuShareQty
    ${etf_china.securityAssetID}=         Get From Dictionary     ${dict_etf}[0]     securityAssetID
    ${etf_china.registrarNameEng}=        Get From Dictionary     ${dict_etf}[0]     registrarNameEng
    Set Suite variable                    ${etf_china}

Get expected ETF symbol from api "TDEX"
    ${etf}=       Call api get ETF info "TDEX"
    ${etf_tdex}=      Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=      cuShareQty=    securityAssetID=          registrarNameEng=
    ${dict_etf}=       Get From Dictionary    ${etf.json()}         content
    ${etf_tdex.securityAssetAbbr}=       Get From Dictionary     ${dict_etf}[0]     securityAssetAbbr
    ${etf_tdex.isinCode}=                Get From Dictionary     ${dict_etf}[0]     isinCode
    ${etf_tdex.securityNameEng}=         Get From Dictionary     ${dict_etf}[0]     securityNameEng
    ${etf_tdex.cuShareQty}=              Get From Dictionary     ${dict_etf}[0]     cuShareQty
    ${etf_tdex.securityAssetID}=         Get From Dictionary     ${dict_etf}[0]     securityAssetID
    ${etf_tdex.registrarNameEng}=        Get From Dictionary     ${dict_etf}[0]     registrarNameEng
    Set Suite variable             ${etf_tdex}          #return ปรับ ให้เป็น

Get expected ETF symbol from api "PTT"
    ${etf}=       Call api get ETF info "PTT"
    log           ${etf.content}
    ${etf_ptt}=      Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=      cuShareQty=     securityAssetID=       registrarNameEng=
    ${dict_etf}=       Get From Dictionary    ${etf.json()}         content
    ${etf_ptt.securityAssetAbbr}=       Get From Dictionary     ${dict_etf}[0]     securityAssetAbbr
    ${etf_ptt.isinCode}=                Get From Dictionary     ${dict_etf}[0]     isinCode
    ${etf_ptt.securityNameEng}=         Get From Dictionary     ${dict_etf}[0]     securityNameEng
    ${etf_ptt.cuShareQty}=              Get From Dictionary     ${dict_etf}[0]     cuShareQty
    ${etf_ptt.securityAssetID}=         Get From Dictionary     ${dict_etf}[0]     securityAssetID
    ${etf_ptt.registrarNameEng}=        Get From Dictionary     ${dict_etf}[0]     registrarNameEng
    Set Suite variable                    ${etf_ptt}

#System show inquiry data of ETF "CHINA"
#    set to dictionary       ${get_search_inquiry_data["params"]}         etfSecurityAssetID=${etf_china.securityAssetID}
##    set to dictionary       ${get_search_inquiry_data["params"]}         rowsPerPage=${records_per_page}
#    ${txnDate}=             get_date_for_api
#    set to dictionary       ${get_search_inquiry_data["params"]}         txnDateFrom=${txnDate}
#    set to dictionary       ${get_search_inquiry_data["params"]}         txnDateTo=${txnDate}
#    set to dictionary       ${get_search_inquiry_data["params"]}         settlementDateFrom=${expected_settlement_date}
#    set to dictionary       ${get_search_inquiry_data["params"]}         settlementDateTo=${expected_settlement_date}
#    ${result}=              Send get api                                 ${get_search_inquiry_data}
#    log     ${result}
#    ${eft_inquiry}=                           Get From Dictionary     ${result.json()}     content
#    [Return]                                  ${eft_inquiry}

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

Call api get ETF account info "${etf_account}"
    set to dictionary               ${get_etf_account_from_api}                 url=${url_web}
    ${get_etf_info_from_api}=       Get access token from "${web_login}" and set it in variable "${get_etf_account_from_api}" for authorization
    Set to dictionary               ${get_etf_account_from_api["params"]}      accountNo=${etf_account}
    ${result}=                      Send get api            ${get_etf_account_from_api}
#    ${etf_info}=                    Get From Dictionary     ${result.json()}     content
    [Return]                        ${result}

Get expected ETF account from api
    set to dictionary               ${get_etf_account_from_api}                 url=${url_web}
    ${get_etf_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_etf_account_from_api}" for authorization
    ${result}=      Send get api            ${get_etf_account_from_api}
    ${content}=                                 Get From Dictionary     ${result.json()}    content
    ${expected_etf_account}                Create dictionary       acc_no=         acc_flag=       acc_name=
    ${expected_etf_account.acc_no}=                 Get From Dictionary     ${content}[0]    accountNo
    ${expected_etf_account.acc_flag}=               Get From Dictionary     ${content}[0]    pcFlagDesc
    ${expected_etf_account.acc_name}=               Get From Dictionary     ${content}[0]    accountName
    Set Suite variable            ${expected_etf_account}

Get expected ETF another account from api
    set to dictionary                       ${get_etf_another_account_from_api}                 url=${url_web}
    ${get_etf_another_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_etf_another_account_from_api}" for authorization
    ${result}=      Send get api            ${get_etf_another_account_from_api}
    ${content}=                                 Get From Dictionary     ${result.json()}    content
    ${expected_etf_another_account}                Create dictionary       acc_no=         acc_flag=       acc_name=
    ${expected_etf_another_account.acc_no}=                 Get From Dictionary     ${content}[0]    accountNo
    ${expected_etf_another_account.acc_flag}=               Get From Dictionary     ${content}[0]    pcFlagDesc
    ${expected_etf_another_account.acc_name}=               Get From Dictionary     ${content}[0]    accountName
    Set Suite variable            ${expected_etf_another_account}

Get expected ETF account info "0110000017"
    ${etf_account}=       Call api get ETF account info "0110000017"
    ${etf_acc_017}=      Create dictionary      acc_no=            acc_flag=         acc_name=
    ${etf_acc_017.acc_no}=                 Get From Dictionary     ${parti}[0]     accountNo
    ${etf_acc_017.acc_flag}=               Get From Dictionary     ${parti}[0]     pcFlagDesc
    ${etf_acc_017.acc_name}=               Get From Dictionary     ${parti}[0]     accountName
    Set Suite variable           ${etf_acc_017}

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
    set to dictionary                      ${get_holder_account_002_from_api}                 url=${url_web}
    ${get_holder_account_002_from_api}=    Get access token from "${web_login}" and set it in variable "${get_holder_account_002_from_api}" for authorization
    ${result}=                      Send get api            ${get_holder_account_002_from_api}
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

Get expected unit holder account from api :parti id 520
    set to dictionary                       ${get_unit_holder_account_520_from_api}                 url=${url_web}
    ${get_unit_holder_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_unit_holder_account_520_from_api}" for authorization
    ${result}=                           Send get api            ${get_unit_holder_account_from_api}
#    ${holder_acc}=                  Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=
    ${unit_holder_name_520}=             Get From Dictionary     ${result.json()}         unitHolderName
    set suite variable              ${unit_holder_name_520}

Get expected unit holder account from api :parti id 525
    set to dictionary                       ${get_unit_holder_account_525_from_api}                 url=${url_web}
    ${get_unit_holder_account_from_api}=    Get access token from "${web_login}" and set it in variable "${get_unit_holder_account_525_from_api}" for authorization
    ${result}=                              Send get api            ${get_unit_holder_account_from_api}
#    ${holder_acc}=                  Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=
    ${unit_holder_name_525}=             Get From Dictionary     ${result.json()}         unitHolderName
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

System show etf table same as expected pdf data
    wait for loading data
    ${notMatch}=            Compare_ETF_table_with_expected_data      //table[@id='enquiry_table']           ${expected_pdf_data}       ${creat_redemp_volume_cu}       ${expected_etf_account}        ${expected_ul_account}   ${parti_011}
    Should Be Equal         ${notMatch}             ${0}

System show etf table same as expected pdf data of in cash
    wait for loading data
    ${notMatch}=    Compare_ETF_table_with_expected_data_incash      //table[@id='enquiry_table']           ${expected_pdf_data}       ${creat_redemp_volume_cu}       ${expected_etf_account}        ${expected_ul_account}   ${parti_011}
    Should Be Equal         ${notMatch}             ${0}

System show etf table same as expected pdf data of in cash: AM as PD
    wait for loading data
    ${notMatch}=    Compare_ETF_table_with_expected_data_incash_AM      //table[@id='enquiry_table']          ${expected_pdf_data}         ${parti_525}
    Should Be Equal         ${notMatch}             ${0}

System show etf table same as expected pdf data: not fully
    wait for loading data
    ${notMatch}=            Compare_ETF_table_with_expected_data_not_fully      //table[@id='enquiry_table']           ${expected_pdf_data}       ${creat_redemp_volume_cu}
    Should Be Equal         ${notMatch}             ${0}


#### NUT #######
#Get expected ETF symbol from api "TDEX"
#    ${etf}=       Call api get ETF info "TDEX"
#    ${etf_tdex}=      Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=      cuShareQty=    securityAssetID=
#    ${dict_etf}=       Get From Dictionary    ${etf.json()}         content
#    ${etf_tdex.securityAssetAbbr}=       Get From Dictionary     ${dict_etf}[0]     securityAssetAbbr
#    ${etf_tdex.isinCode}=                Get From Dictionary     ${dict_etf}[0]     isinCode
#    ${etf_tdex.securityNameEng}=         Get From Dictionary     ${dict_etf}[0]     securityNameEng
#    ${etf_tdex.cuShareQty}=              Get From Dictionary     ${dict_etf}[0]     cuShareQty
#    ${etf_tdex.securityAssetID}=         Get From Dictionary     ${dict_etf}[0]     securityAssetID
#    Set Suite variable             ${etf_tdex}          #return ปรับ ให้เป็น

Get expected available issuing limit of "${etf}" from api
    set to dictionary               ${get_avail_from_api}                 url=${url_web}
    ${get_avail_china_from_api}=    Get access token from "${web_login}" and set it in variable "${get_avail_from_api}" for authorization
    Set to dictionary               ${get_avail_from_api["params"]}    etfSecurityAssetID=${etf.securityAssetID}
    ${result}=      Send get api            ${get_avail_from_api}
    ${expected_avail_limit}=                 Get From Dictionary     ${result.json()}    availableIssuingLimitQty
    Set Suite variable                      ${expected_avail_limit}

Get expected pdf data of "${etf}" from api
    set to dictionary               ${get_pdf_data_from_api}                 url=${url_web}
    ${get_pdf_data_from_api}=       Get access token from "${web_login}" and set it in variable "${get_pdf_data_from_api}" for authorization
    ${date}=        get_date_for_api
    Set to dictionary    ${get_pdf_data_from_api["params"]}    txnDate=${date}
    Set to dictionary    ${get_pdf_data_from_api["params"]}    etfSecurityAssetID=${etf.securityAssetID}
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

Get expected ETF symbol from api "TGOLDETF"
    ${etf}=       Call api get ETF info "TGOLDETF"
    ${etf_tgoldetf}=      Create dictionary      securityAssetAbbr=            isinCode=         securityNameEng=      cuShareQty=    securityAssetID=
    ${dict_etf}=       Get From Dictionary    ${etf.json()}         content
    ${etf_tgoldetf.securityAssetAbbr}=       Get From Dictionary     ${dict_etf}[0]     securityAssetAbbr
    ${etf_tgoldetf.isinCode}=                Get From Dictionary     ${dict_etf}[0]     isinCode
    ${etf_tgoldetf.securityNameEng}=         Get From Dictionary     ${dict_etf}[0]     securityNameEng
    ${etf_tgoldetf.cuShareQty}=              Get From Dictionary     ${dict_etf}[0]     cuShareQty
    ${etf_tgoldetf.securityAssetID}=         Get From Dictionary     ${dict_etf}[0]     securityAssetID
    Set Suite variable             ${etf_tgoldetf}

###check confirm parti ID
Get expected data of "${etf}" from api: inquiry confirm/reject
    set to dictionary               ${get_trans_inquiry}                 url=${url_web}
    ${get_trans_inquiry}=           Get access token from "${web_am_login}" and set it in variable "${get_trans_inquiry}" for authorization
    ${date}=                        get_date_for_api
    Set to dictionary    ${get_trans_inquiry["params"]}    txnDate=${date}
    Set to dictionary    ${get_trans_inquiry["params"]}    etfSecurityAssetID=${etf.securityAssetID}
    log         ${get_trans_inquiry}
    ${result}=      Send get api            ${get_trans_inquiry}
    log         ${result.content}
    ${expected_data_confirm_inquiry}=       Get From Dictionary     ${result.json()}     content
    Set Suite variable                      ${expected_data_confirm_inquiry}

