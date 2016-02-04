

<cfquery datasource="mykickcloud" name="Checkreferee" >
	select * 
	from referee
	where email = '#form.email#'
</cfquery>



<cfif Checkreferee.RecordCount GTE 1>
	
	<cfset Session.user_id = "">
	<cfset Session.email = "">
	<cfset Session.password = "">
	<cfset Session.email_match = "1">
	<cflocation url="membership_referee.cfm">
		
<cfelse>
	<cfquery datasource="mykickcloud" name="addreferee">
		insert into referee(name, address1, city, state, zip, homepage, email, password, password2)
		values ('#form.name#', '#form.address1#', 
				 '#form.city#', '#form.state#',
				'#form.zip#', '#form.homepage#', '#form.email#',
				'#form.password#', '#form.password2#')
	</cfquery>



	<cfset is_active = '1'>

	<cfset Session.justsignup = '1'>
	<cflocation url="login.cfm">
		
</cfif>