

<cfquery datasource="mykickcloud" name="updateSchoolUser">
	update school_user
	set is_active = '1'
	where id = '#url.id#'
</cfquery>


<cflocation url="School_User_list.cfm">