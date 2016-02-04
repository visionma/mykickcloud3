

<cfset is_active = '1'>


<cfquery datasource="mykickcloud" name="addSchoolUser">
		insert into school_user(school_id,
								school_user_type_id,
								password,
								password2,
								email,
								is_active,
								register_date,
								name)
		values ('#form.school_id#',
				'#form.school_user_type#',
				'#form.password#',
				'#form.password2#',
				'#form.email#',
				'#is_active#',
				'#DateFormat(Session.today, "mm/dd/yyyy")#',
				'#form.name#')
</cfquery>


<cflocation url="School_User_list.cfm">