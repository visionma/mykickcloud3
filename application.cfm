<cfapplication 
    name = "mykickcloud"
    applicationTimeout = #CreateTimeSpan(0, 0, 30, 0)#
    clientManagement = "no"
    clientStorage = "mykickcloud" 
    loginStorage = "session"
    scriptProtect = "none"
    sessionManagement = "yes"
    sessionTimeout = #CreateTimeSpan(0, 0, 10, 0)#
    setClientCookies = "yes" 
    setDomainCookies = "no">



<cfset session.today = #DateFormat(Now())#>
	
<cfsetting showDebugOutput="No">