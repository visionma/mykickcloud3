
<cfquery datasource="mykickcloud" name="getMember">
	select *
	from members
	where members_id = '#session.user_id#'
</cfquery>


<cfquery datasource="mykickcloud" name="post">
	insert into board_member(subject,
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