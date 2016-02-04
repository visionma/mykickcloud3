

<cfquery datasource="mykickcloud" name="CheckUser" >
	select * 
	from members 
	where email_address = '#form.email#' 
			or firstname = '#form.firstname#'
			or lastname = '#form.lastname#' 
			or nick_name = '#form.nick_name#'
</cfquery>



<cfif '(#form.password#)' NEQ '(#form.password2#)'>
<cfset Session.email_match = "1">
<cflocation url = "signup.cfm">
</cfif>


<cfif CheckUser.RecordCount EQ 1>
	<cfset Session.user_id = "">
	<cfset Session.email = "">
	<cfset Session.password = "">
	<cfset Session.email_match = "1">
	<cflocation url="signin.cfm">
	<cfelse>
		<cfset register_date = #DateFormat(now(), "mm/dd/yyyy")#>
	<cfquery datasource="mykickcloud" name="addlogin">
		insert into members(email_address, 
							password, 
							register_date,
							firstname,
							lastname,
							nick_name,
							member_gender,
							member_address1,
							member_address2,
							member_city,
							member_state,
							member_zip,
							school_name,
							school_id,
							birthday,
							member_belt,
							member_weight,
							member_height,
							member_phone,
							is_active,
							member_type)
		values ('#form.Email#', 
				'#form.password#', 
				'#register_date#',
				'#form.firstname#',
				'#form.lastname#',
				'#form.nick_name#',
				'#form.member_gender#',
				'#form.member_address#',
				'#form.member_address2#',
				'#form.member_city#',
				'#form.member_state#',
				'#form.member_zip#',
				'#form.school_name#',
				'#form.school_id#',
				'#form.birthday#',
				'#form.member_belt#',
				'#form.member_weight#',
				'#form.member_height#',
				'#form.member_phone#',
				'#form.is_active#',
				'#form.member_type#')
	</cfquery>
	<cfset Session.justsignup = '1'>
	<cflocation url="signin.cfm">
</cfif>