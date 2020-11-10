web_login = {
	"url": "",
	"uri": "/etfs/login",
	"method": "POST",
	"param":"",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"username":"amrobot525ent","password":"Etf#2020","channel":"WEB"}
}

get_settlement_date_from_api = {
	"url": "",
	"uri": "/etfs/web/common/get-settlement-date",
	"method": "GET",
	"params": {"txnDate":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_parti_info_from_api = {
	"url": "",
	"uri": "/etfs/web/common/csd-participant-inquiry",
	"method": "GET",
	"params": {"activeFlag":"Y","partiID":"","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_etf_info_from_api = {
	"url": "",
	"uri": "/etfs/web/common/etf-profile-inquiry",
	"method": "GET",
	"params": {"activeFlag":"Y","securityAssetAbbr":"","isinCode":"","securityNameEng":"","functionCode":"CRRD001","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_etf_account_from_api = {
	"url": "",
	"uri": "/etfs/web/common/csd-account-inquiry",
	"method": "GET",
	"params": {"sysPartiID":"12","accountNo":"0110031708","matchFlag":"Y","activeFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}


get_etf_another_account_from_api = {
	"url": "",
	"uri": "/etfs/web/common/csd-account-inquiry",
	"method": "GET",
	"params": {"sysPartiID":"12","accountNo":"0110000028","matchFlag":"Y","activeFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}


get_ul_account_from_api = {
	"url": "",
	"uri": "/etfs/web/common/csd-account-inquiry",
	"method": "GET",
	"params": {"sysPartiID":"12","accountNo":"0110000027","matchFlag":"Y","activeFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_avail_from_api = {
	"url": "",
	"uri": "/etfs/web/common/get-available-issuing-limit",
	"method": "GET",
	"params": {"etfSecurityAssetID":"","sysPartiID":"12"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_pdf_data_from_api = {
	"url": "",
	"uri": "/etfs/web/creation/creation-get-pdf-data",
	"method": "GET",
	"params": {"txnDate":"","etfSecurityAssetID":"","basketType":"IC","txnTypeId":"RD","underlyingSettleStatus":"NF"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

cu = 2

get_ul_aot_from_api = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/pdf-underlying-security-inquiry",
	"method": "GET",
	"params": {"txnDate":"","basketType":"IK","etfSecurityAssetID":"6994","activeFlag":"Y","securityAssetAbbr":"AOT",
			   "isinCode":"","securityNameEng":"","functionCode":"CRRD001","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

# http://10.22.68.64/etfs/web/common/csd-get-holder-account?sysPartiID=3&brokerageAccountId=11691&referenceNo=3100900181935&referenceType=0&sysNationalityId=1
get_holder_account_002_from_api = {
	"url": "",
	"uri": "/etfs/web/common/csd-get-holder-account",
	"method": "GET",
	"params": {"sysPartiID":"3","brokerageAccountId":"11691","referenceNo":"3100900181935","referenceType":"0","sysNationalityId":"1"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_unit_holder_account_from_api = {
	"url": "",
	"uri": "/etfs/web/common/get-unit-holder-name-by-ref",
	"method": "GET",
	"params": {"amSysPartiID":"43","unitHolderId":"23344555","referenceTypeId":"0","referenceNo":"3400900688034","sysNationalityId":"1"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

# /etfs/web/creation/create-check-pdf-data

get_cash_amount = {
	"url": "",
	"uri": "/etfs/web/creation/create-check-pdf-data",
	"method": "POST",
	"param": "",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"txnDate":"", "etfSecurityAssetID": "", "basketType": "IC"}
}
# /etfs/web/common/etf-unit-holder-inquiry?unitHolderId=5250001&activeFlag=Y&matchFlag=Y
get_unit_holder_inquiry = {
	"url": "",
	"uri": "/etfs/web/common/etf-unit-holder-inquiry",
	"method": "GET",
	"params": {"unitHolderId":"5250001","activeFlag":"Y","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}




# http://10.22.68.64/etfs/web/creation-redemption/etf-trans-edit-inquiry?etfSecurityAssetID=1955&txnNoFrom=1&txnNoTo=99999&txnTypeID=CR&txnStatusID=F1&actionType=ED&txnDateTo=2020-07-21&txnDateFrom=2020-07-21&settlementDateFrom=2020-07-23&settlementDateTo=2020-07-23
get_trans_edit_inquiry = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/etf-trans-edit-inquiry",
	"method": "GET",
	"params": {"etfSecurityAssetID":"1955","txnNoFrom":"1","txnNoTo":"99999",
               "txnTypeID":"CR","txnStatusID":"","actionType":"ED","txnDateTo":"","txnDateFrom":"",
               "settlementDateFrom":"","settlementDateTo":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

# http://10.22.68.64/etfs/web/creation-redemption/etf-trans-edit-instruction-inquiry?sysTxnId=13528&actionType=ED
get_trans_edit_instruction_inquiry = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/etf-trans-edit-instruction-inquiry",
	"method": "GET",
	"params": {"etfSecurityAssetID":"1955","txnNoFrom":"1","txnNoTo":"99999",
               "txnTypeID":"CR","sysTxnId":"","actionType":"ED"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

# http://10.22.68.64/etfs/web/creation-redemption/etf-trans-all-inquiry?etfSecurityAssetID=1955&txnNoFrom=1&txnNoTo=99999&txnTypeID=CR&basketType=IC&underlyingSettleStatus=&txnStatusID=F1&initSettleStatus=&functionCode=CRRD009&
# pageNo=1&rowsPerPage=5&orderBy=&sysPartiID=208&txnDateFrom=2020-07-21&txnDateTo=2020-07-21&settlementDateFrom=2020-07-23&settlementDateTo=2020-07-23
get_etf_trans_all_inquiry = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/etf-trans-all-inquiry",
	"method": "GET",
	"params": {"etfSecurityAssetID":"1955","txnNoFrom":"1","txnNoTo":"99999","basketType":"IC","underlyingSettleStatus":"",
               "txnTypeID":"CR","functionCode":"CRRD009","txnStatusID":"F1","initSettleStatus":"","pageNo":"1","rowsPerPage":"20",
			   "actionType":"ED","txnDateTo":"","txnDateFrom":"","settlementDateFrom":"","settlementDateTo":"",
               "orderBy":"","sysPartiID":"208"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}