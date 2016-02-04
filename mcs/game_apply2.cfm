
	
	
		
		<cfquery datasource="mykickcloud" name="addPlayer">
			insert into player(school_id, 
								members_id,
								game_id,
								player_gender,
								paid_amount,
								is_forms,
								is_sparring,
								is_cforms,
								is_breaking,
								is_weapon)
			values ('#form.school_id#', 
				'#form.members_id#',
				'#form.game_id#',
				'#form.player_gender#',
				'#form.paid_amount#',
				'#form.is_forms#',
				'#form.is_sparring#',
				'#form.is_cfforms#',
				'#form.is_breaking#',
				'#form.is_weapon#')
		</cfquery>
		
		<cfset newGame = '#form.game_id#'>
		<cfset is_update = 'no'>
		<cflocation url="gameinfo.cfm">
			
	
