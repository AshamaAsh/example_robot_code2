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
	"body":{"username":"pdrobot011aut","password":"Etf#2020","channel":"WEB"}
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
#/etfs/web/common/etf-profile-inquiry?activeFlag=Y&securityAssetAbbr=CHINA&isinCode=&securityNameEng=&functionCode=CRRD009&matchFlag=Y
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

# /etfs/web/creation-redemption/etf-trans-inquiry?etfSecurityAssetID=&txnNoFrom=&txnNoTo=&txnTypeID=&basketType=&underlyingSettleStatus=&txnStatusID=PA&functionCode=CRRD003&txnDate=2020-05-25
get_inquiry_approve_reject = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/etf-trans-inquiry",
	"method": "GET",
	"params": {"etfSecurityAssetID":"","txnNoFrom":"","txnNoTo":"","txnTypeID":"","basketType":"",
               "underlyingSettleStatus":"","txnStatusID":"PA","functionCode":"CRRD003","txnDate":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

# /etfs/web/creation-redemption/etf-trans-all-inquiry?etfSecurityAssetID=6994&txnNoFrom=1&txnNoTo=99999&txnTypeID=CR&basketType=IK&underlyingSettleStatus=FS&txnStatusID=PA&initSettleStatus=&functionCode=CRRD009&pageNo=1&rowsPerPage=5&orderBy=&sysPartiID=12&txnDateFrom=2020-05-26&txnDateTo=2020-05-26&settlementDateFrom=2020-05-28&settlementDateTo=2020-05-28
get_search_inquiry_data = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/etf-trans-all-inquiry",
	"method": "GET",
	"params": {"etfSecurityAssetID":"","txnNoFrom":"1","txnNoTo":"99999","txnTypeID":"CR","basketType":"IK",
               "underlyingSettleStatus":"FS","initSettleStatus":"","txnStatusID":"PA","functionCode":"CRRD003","pageNo":"1",
			   "rowsPerPage":"20","orderBy":"","sysPartiID":"12","txnDateFrom":"","txnDateTo":"","settlementDateFrom":"","settlementDateTo":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_inquiry_table_china_creation_IK_PA = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/etf-trans-all-inquiry",
	"method": "GET",
	"params": {"etfSecurityAssetID":"","txnNoFrom":"1","txnNoTo":"99999","txnTypeID":"CR","basketType":"IK",
               "underlyingSettleStatus":"","initSettleStatus":"","txnStatusID":"PA","functionCode":"CRRD009","pageNo":"1",
			   "rowsPerPage":"20","orderBy":"","sysPartiID":"12","txnDateFrom":"","txnDateTo":"","settlementDateFrom":"","settlementDateTo":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

# http://10.22.68.64/etfs/web/creation-redemption/etf-trans-all-inquiry?etfSecurityAssetID=&txnNoFrom=1&txnNoTo=99999&txnTypeID=CR&basketType=IK&underlyingSettleStatus=&txnStatusID=PA&initSettleStatus=&functionCode=CRRD009&pageNo=1&rowsPerPage=20&orderBy=&sysPartiID=12&txnDateFrom=2020-06-04&txnDateTo=2020-06-04&settlementDateFrom=2020-06-08&settlementDateTo=2020-06-08
get_inquiry_table_creation_IK_PA = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/etf-trans-all-inquiry",
	"method": "GET",
	"params": {"etfSecurityAssetID":"","txnNoFrom":"1","txnNoTo":"99999","txnTypeID":"CR","basketType":"IK",
               "underlyingSettleStatus":"","initSettleStatus":"","txnStatusID":"PA","functionCode":"CRRD009","pageNo":"1",
			   "rowsPerPage":"20","orderBy":"","sysPartiID":"12","txnDateFrom":"","txnDateTo":"","settlementDateFrom":"","settlementDateTo":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_inquiry_table_creation_PA = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/etf-trans-all-inquiry",
	"method": "GET",
	"params": {"etfSecurityAssetID":"","txnNoFrom":"1","txnNoTo":"99999","txnTypeID":"CR","basketType":"",
               "underlyingSettleStatus":"","initSettleStatus":"","txnStatusID":"PA","functionCode":"CRRD003","pageNo":"1",
			   "rowsPerPage":"50","orderBy":"","sysPartiID":"12","txnDateFrom":"","txnDateTo":"","settlementDateFrom":"","settlementDateTo":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}

get_inquiry_table_PA = {
	"url": "",
	"uri": "/etfs/web/creation-redemption/etf-trans-all-inquiry",
	"method": "GET",
	"params": {"etfSecurityAssetID":"","txnNoFrom":"1","txnNoTo":"99999","txnTypeID":"","basketType":"",
               "underlyingSettleStatus":"","initSettleStatus":"","txnStatusID":"PA","functionCode":"CRRD003","pageNo":"1",
			   "rowsPerPage":"50","orderBy":"","sysPartiID":"12","txnDateFrom":"","txnDateTo":"","settlementDateFrom":"","settlementDateTo":""},
	"headers":{"Authorization":"","Content-Type":"application/json"},
	"body":""
}
