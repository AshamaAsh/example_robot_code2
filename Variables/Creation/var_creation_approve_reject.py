web_login_am_role = {
	"url": "someurl",
	"uri": "/somewebpage/login",
	"method": "POST",
	"param":"",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"username":"someusername","password":"somepass","channel":"WEB"}
}

web_login = {
	"url": "someurl",
	"uri": "/somewebpage/login",
	"method": "POST",
	"param":"",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"username":"someusername","password":"somepass","channel":"WEB"}
}

get_settlement_date_from_api = {
	"url": "someurl",
	"uri": "/somewebpage/somepath/get-settlement-date",
	"method": "GET",
	"params": {"txnDate":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_parti_info_from_api = {
	"url": "someurl",
	"uri": "/somewebpage/somepath/csd-participant-inquiry",
	"method": "GET",
	"params": {"activeFlag":"Y","partiID":"","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_sth_info_from_api = {
	"url": "someurl",
	"uri": "/somewebpage/somepath/ile-inquiry",
	"method": "GET",
	"params": {"activeFlag":"Y","securityAssetAbbr":"","sth":"","securityNameEng":"","functionCode":"sth","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_sth_account_from_api = {
	"url": "someurl",
	"uri": "/somewebpage/somepath/csd-nquiry",
	"method": "GET",
	"params": {"sysPartiID":"12","accountNo":"sth","matchFlag":"Y","activeFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_ul_account_from_api = {
	"url": "someurl",
	"uri": "/somewebpage/somepath/ciry",
	"method": "GET",
	"params": {"sysPartiID":"12","accountNo":"sth","matchFlag":"Y","activeFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_avail_from_api = {
	"url": "someurl",
	"uri": "/somewebpage/somepath/getng-limit",
	"method": "GET",
	"params": {"somewebpageecurityAssetID":"","sysPartiID":"12"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_pdf_data_from_api = {
	"url": "someurl",
	"uri": "/somewebpage/web/creation/creation-get-pdf-data",
	"method": "GET",
	"params": {"txnDate":"","somewebpageecurityAssetID":"sth","basketType":"sth","txnTypeId":"sth","underlyingSettleStatus":"sth"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

cu = 2

get_ul_sth_from_api = {
	"url": "someurl",
	"uri": "/somewebpage/web/creation-redemption/pdf-underlying-security-inquiry",
	"method": "GET",
	"params": {"txnDate":"","basketType":"IK","somewebpageecurityAssetID":"sth","activeFlag":"Y","securityAssetAbbr":"sth",
			   "isinCode":"","securityNameEng":"","functionCode":"sth","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

