web_login_am_role = {
	"url": "",
	"uri": "/etfs/login",
	"method": "POST",
	"param":"",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"username":"itbhakjira525","password":"Etf#2020","channel":"WEB"}
}

web_login = {
	"url": "",
	"uri": "/etfs/login",
	"method": "POST",
	"param":"",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"username":"pdrobot011ent","password":"Etf#2020","channel":"WEB"}
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
	"params": {"txnDate":"","etfSecurityAssetID":"6994","basketType":"IK","txnTypeId":"CR","underlyingSettleStatus":"NF"},
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

get_holder_account_002_from_api = {
	"url": "",
	"uri": "/etfs/web/common/csd-get-holder-account",
	"method": "GET",
	"params": {"sysPartiID":"3","brokerageAccountId":"10013711","referenceNo":"3102002587675","referenceType":"0","sysNationalityId":"1"},
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

get_cash_amount = {
	"url": "",
	"uri": "/etfs/web/creation/create-check-pdf-data",
	"method": "POST",
	"param": "",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"txnDate":"", "etfSecurityAssetID": "", "basketType": "IK"}
}

