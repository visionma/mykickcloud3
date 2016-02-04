

<cfquery datasource="mykickcloud" name="CheckSchool" >
	select * 
	from school 
	where school_email = '#form.school_email#'
</cfquery>



<cfif CheckSchool.RecordCount GTE 1>
	
	<cfset Session.user_id = "">
	<cfset Session.email = "">
	<cfset Session.password = "">
	<cfset Session.email_match = "1">
	<cflocation url="school_signup.cfm">
		
<cfelse>
	<cfquery datasource="mykickcloud" name="addSchool">
		insert into school(school_name, master_name, school_address1, 
							school_city, school_state, school_zip, school_homepage,
							school_email, school_password, school_password2)
		values ('#form.school_name#', '#form.master_name#', '#form.school_address1#', 
				 '#form.school_city#', '#form.school_state#',
				'#form.school_zip#', '#form.school_homepage#', '#form.school_email#',
				'#form.school_password#', '#form.school_password2#')
	</cfquery>


	<cfquery name="getNewSchool" datasource="mykickcloud">
		select *
		from school
		where school_email = '#form.school_email#'
	</cfquery>

	<cfset user_type_id = '1'>
	<cfset is_active = '1'>


	<!-- 초기 학교등록 시 Super User 자동 등록 -->
	<!-- 향후 Super User가 다른 유져를 등록 할 수 있다 -->

	<cfquery datasource="mykickcloud" name="addSchoolUser">
		insert into school_user(school_id,
								school_user_type_id,
								password,
								password2,
								email,
								is_active,
								register_date,
								name)
		values ('#getNewSchool.school_id#',
				'#user_type_id#',
				'#form.school_password#',
				'#form.school_password2#',
				'#form.school_email#',
				'#is_active#',
				'#DateFormat(Session.today, "mm/dd/yyyy")#',
				'#form.master_name#')
	</cfquery>


	<cfset Session.justsignup = '1'>
	<cflocation url="index.cfm">
		
</cfif>