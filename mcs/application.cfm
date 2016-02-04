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

<cfif structKeyExists(session,'user_id') and trim(session.user_id)>

    <cfquery name="getUser" datasource="mykickcloud" >
        select *
        from members
        where members_id = '#session.user_id#'
    </cfquery>

<cfelse>

     <CFSET STRUCTCLEAR(SESSION)>
    <cflocation url="../index.cfm">

</cfif>