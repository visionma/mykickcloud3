

<cfquery datasource="mykickcloud" name="CheckCoach" >
	select * 
	from coach
	where email = '#form.email#'
</cfquery>



<cfif CheckCoach.RecordCount GTE 1>
	
	<cfset Session.user_id = "">
	<cfset Session.email = "">
	<cfset Session.password = "">
	<cfset Session.email_match = "1">
	<cflocation url="membership_coach.cfm">
		
<cfelse>
	<cfquery datasource="mykickcloud" name="addCoach">
		insert into coach(name, address1, city, state, zip, homepage, email, password, password2)
		values ('#form.name#', '#form.address1#', 
				 '#form.city#', '#form.state#',
				'#form.zip#', '#form.homepage#', '#form.email#',
				'#form.password#', '#form.password2#')
	</cfquery>



	<cfset is_active = '1'>

	<cfset Session.justsignup = '1'>
	<cflocation url="login.cfm">
		
</cfif>