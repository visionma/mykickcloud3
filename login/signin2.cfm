
<cfquery datasource="mykickcloud" name="CheckAdmin">
	select *
	from members
	where email_address = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.email#">
	and password = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.password#">
	and is_admin = 'Y'
</cfquery>

<cfquery datasource="mykickcloud" name="CheckUser" >
	select * 
	from members 
	where email_address = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.email#">
	and password = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.password#">
</cfquery>

<cfquery datasource="mykickcloud" name="CheckSchoolUser">
	select *
	from school_user 
	where email = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.email#">
	and password = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.password#">
</cfquery>

<cfif CheckAdmin.RecordCount EQ 1>
	<cflock timeout=60 scope="session" type="Exclusive">
		<cfset session.admin_id = "#CheckAdmin.members_id#">
		<cfset session.password = "#CheckAdmin.password#">
		<cfset session.email = "#CheckAdmin.email_address#">
		<cfset signdate = #DateFormat(now(), "mm/dd/yyyy")#>
	</cflock>
	<cfquery datasource="mykickcloud" name="addlogin">
		update members set last_login = ('#signdate#')
		where members_id = '#Session.admin_id#'
	</cfquery>
	<cflocation url="../admin/index.cfm">

<cfelseif CheckUser.RecordCount EQ 1>
	<cflock timeout=60 scope="session" type="Exclusive">
		<cfset session.user_id = "#CheckUser.members_id#">
		<cfset session.password = "#CheckUser.password#">
		<cfset session.email = "#CheckUser.email_address#">
		<cfset signdate = #DateFormat(now(), "mm/dd/yyyy")#>
	</cflock>
	<cfquery datasource="mykickcloud" name="addlogin">
		update members set last_login = ('#signdate#')
		where members_id = '#Session.user_id#'
	</cfquery>
	<cflocation url="../mcs/index.cfm">
		
<cfelseif CheckSchoolUser.RecordCount EQ 1>

	<cfquery datasource="mykickcloud" name="CheckSchool">
		select *
		from school
		where school_id = '#CheckSchoolUser.school_id#'
	</cfquery>


	<cflock timeout=60 scope="session" type="Exclusive">
		<cfset session.school_id = "#CheckSchool.school_id#">
		<cfset session.school_user_id = '#CheckSchoolUser.id#'>
		<cfset session.school_password = "#CheckSchool.school_password#">
		<cfset session.school_email = "#CheckSchool.school_email#">
	</cflock>
	<cflocation url="../tms/index.cfm">
		
<cfelse>
	<cfset session.user_id = "">
	<cfset session.password = "">
	<cfset session.email = "">
	<cfset session.school_id = "">
	<cfset session.school_password = "">
	<cfset session.school_email = "">
	<cflocation addtoken="no" url="reset.cfm">
</cfif>


