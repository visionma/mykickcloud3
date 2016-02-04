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
	
<cfsetting showDebugOutput="No">

<cfif structKeyExists(session,'admin_id') and trim(session.admin_id) eq "">

    <CFSET STRUCTCLEAR(SESSION)>
    <cflocation url="../login.cfm">

</cfif>