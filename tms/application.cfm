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


<cfif structKeyExists(session,'school_user_id') and trim(session.school_user_id)>

    <cfquery name="getschool_user" datasource="mykickcloud" >
        select *
        from school_user
        where school_id = #session.school_user_id#
    </cfquery>  

    <cfquery name="getschool" datasource="mykickcloud" >
        select *
        from school
        where school_id = #session.school_id#
    </cfquery> 

<cfelse>

    <CFSET STRUCTCLEAR(SESSION)>

    <cflocation url="../index.cfm">

</cfif>