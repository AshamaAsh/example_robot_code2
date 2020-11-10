web_login = {
	"url": "http://10.22.68.64",
	"uri": "/etfs/login",
	"method": "POST",
	"param":"",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"username":"pdrobot011ent","password":"Etf#2020","channel":"WEB"}
}

cu = 2

get_settlement_date_from_api = {
	"url": "http://10.22.68.64",
	"uri": "/etfs/web/common/get-settlement-date",
	"method": "GET",
	"params": {"txnDate":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_parti_info_from_api = {
	"url": "http://10.22.68.64",
	"uri": "/etfs/web/common/csd-participant-inquiry",
	"method": "GET",
	"params": {"activeFlag":"Y","partiID":"","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_etf_info_from_api = {
	"url": "http://10.22.68.64",
	"uri": "/etfs/web/common/etf-profile-inquiry",
	"method": "GET",
	"params": {"activeFlag":"Y","securityAssetAbbr":"TDEX","isinCode":"","securityNameEng":"","functionCode":"CRRD001","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_etf_account_from_api = {
	"url": "http://10.22.68.64",
	"uri": "/etfs/web/common/csd-account-inquiry",
	"method": "GET",
	"params": {"sysPartiID":"12","accountNo":"0110031708","matchFlag":"Y","activeFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_ul_account_from_api = {
	"url": "http://10.22.68.64",
	"uri": "/etfs/web/common/csd-account-inquiry",
	"method": "GET",
	"params": {"sysPartiID":"12","accountNo":"0110000027","matchFlag":"Y","activeFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}


#2348

get_pdf_data_from_api = {
	"url": "http://10.22.68.64",
	"uri": "/etfs/web/creation/creation-get-pdf-data",
	"method": "GET",
	"params": {"txnDate":"","etfSecurityAssetID":"","basketType":"IK","txnTypeId":"CR","underlyingSettleStatus":"NF"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}



get_avail_from_api = {
	"url": "http://10.22.68.64",
	"uri": "/etfs/web/common/get-available-issuing-limit",
	"method": "GET",
	"params": {"etfSecurityAssetID":"","sysPartiID":"12"},
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