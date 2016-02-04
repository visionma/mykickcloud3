
<cfquery datasource="mykickcloud" name="getSchool">
	select *
	from school
	where school_id = '#session.school_id#'
</cfquery>


<cfquery datasource="mykickcloud" name="post">
	insert into board_school(subject,
							memo,
							num,
							email,
							name,
							reg_date
							)
	values ('#form.subject#',
			'#form.memo#',
			'#form.num#',
			'#form.email#',
			'#form.name#',
			'#form.reg_date#')
</cfquery>






<cflocation url="forum.cfm">