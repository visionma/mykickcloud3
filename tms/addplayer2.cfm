

<cfif NOT isDefined("form.is_active")>
<cfset form.is_active = "off">
</cfif>

<cfquery datasource="mykickcloud" name="CheckUser" >
	select * 
	from members 
	where email_address = '#form.email_address#'  
			or nick_name = '#form.nick_name#'
</cfquery>


<cfif '(#form.password#)' NEQ '(#form.password2#)'>
<cfset Session.email_match = "1">
<cflocation url = "addplayer.cfm">
</cfif>


<cfif CheckUser.RecordCount EQ 1>
	
	<cflocation url="addplayer.cfm">
	<cfelse>


	<cfquery datasource="mykickcloud" name="addMember">
		insert into members(firstname,
						lastname,
						nick_name,
						email_address,
						password,
						school_name,
						member_address,
						member_address2,
						member_city,
						member_state,
						member_zip,
						member_phone,
						birthday,
						member_gender,
						member_weight,
						member_belt,
						is_active,
						is_player,
						school_id)
		values ('#form.firstname#', 
				'#form.lastname#', 
				'#form.nick_name#', 
				'#form.email_address#',  
				'#form.password#', 
				'#form.school_name#', 
				'#form.member_address#', 
				'#form.member_address2#', 
				'#form.member_city#', 
				'#form.member_state#', 
				'#form.member_zip#', 
				'#form.member_phone#', 
				'#form.birthday#', 
				'#form.gender#',
				'#form.member_weight#',
				'#form.member_belt#',
				'#form.is_active#',
				'#form.is_player#',
				'#form.school_id#')
	</cfquery>
	
	<cfquery datasource="mykickcloud" name="getMember" >
	select * 
	from members 
	where email_address = '#form.email_address#'
	</cfquery>

	<cfquery datasource="mykickcloud" name="addPlayer">
		insert into player(school_id,
						members_id,
						game_id,
						sub_game_id
						)
		values ('#form.school_id#', 
				'#getMember.members_id#', 
				'#form.game_id#', 
				'#form.sub_game_id#' 
				)
	</cfquery>
	
	<cflocation url="playerlist.cfm?sid=#form.school_id#&gid=#form.game_id#" >
	
</cfif>
	
