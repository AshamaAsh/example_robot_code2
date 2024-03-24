web_login_am_role = {
	"url": "someurl",
	"uri": "/somewebpage/login",
	"method": "POST",
	"param":"",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"username":"username","password":"password","channel":"WEB"}
}

web_login = {
	"url": "",
	"uri": "/somewebpage/login",
	"method": "POST",
	"param":"",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"username":"someusername","password":"somepassword","channel":"WEB"}
}

get_settlement_date_from_api = {
	"url": "",
	"uri": "/somewebpage/somepath/get-settlement-date",
	"method": "GET",
	"params": {"txnDate":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_parti_info_from_api = {
	"url": "",
	"uri": "/somewebpage/somepath/some-inquiry",
	"method": "GET",
	"params": {"activeFlag":"Y","partiID":"","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_etf_info_from_api = {
	"url": "",
	"uri": "/somewebpage/somepath/some-inquiry",
	"method": "GET",
	"params": {"activeFlag":"Y","securityAssetAbbr":"","sth":"","securityNameEng":"","functionCode":"code","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_etf_account_from_api = {
	"url": "",
	"uri": "/somewebpage/somepath/some-inquiry",
	"method": "GET",
	"params": {"sysPartiID":"12","accountNo":"somenumber","matchFlag":"Y","activeFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_ul_account_from_api = {
	"url": "",
	"uri": "/somewebpage/wemon/some-inquiry",
	"method": "GET",
	"params": {"sysPartiID":"12","accountNo":"somenumber","matchFlag":"Y","activeFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_avail_from_api = {
	"url": "",
	"uri": "/somewebpage/web/g-limit",
	"method": "GET",
	"params": {"somewebpageecurityAssetID":"","sysPartiID":"some"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_pdf_data_from_api = {
	"url": "",
	"uri": "/somewebpage/web/createt-pdf-data",
	"method": "GET",
	"params": {"txnDate":"","somewebpageecurityAssetID":"sth","basketType":"sth","txnTypeId":"sth","underlyingSettleStatus":"sth"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

cu = 2

get_ul_sth_from_api = {
	"url": "",
	"uri": "/somewebpage/web/creation-reying-sth-inquiry",
	"method": "GET",
	"params": {"txnDate":"","basketType":"IK","somewebpageecurityAssetID":"sth","activeFlag":"Y","securityAssetAbbr":"sth",
			   "isinCode":"","securityNameEng":"","functionCode":"sth","matchFlag":"Y"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_holder_account_002_from_api = {
	"url": "",
	"uri": "/somewebpage/somepath/sth",
	"method": "GET",
	"params": {"sysPartiID":"3","brokerageAccountId":"sth","referenceNo":"sth","referenceType":"0","sysNationalityId":"1"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_unit_holder_account_from_api = {
	"url": "",
	"uri": "/somewebpage/somepath/get-by-ref",
	"method": "GET",
	"params": {"amSysPartiID":"43","unitHolderId":"sth","referenceTypeId":"0","referenceNo":"sth","sysNationalityId":"1"},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_cash_amount = {
	"url": "",
	"uri": "/somewebpage/web/creatio-data",
	"method": "POST",
	"param": "",
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":{"txnDate":"", "somewebpageecurityAssetID": "", "basketType": "IK"}
}

