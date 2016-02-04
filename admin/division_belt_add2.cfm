
	
	
		
		<cfquery datasource="mykickcloud" name="addDivisionBeltGroup">
			insert into division_belt(game_size,
									division_type,
									belt)
			values ('#form.game_size#', 
				'#form.division_type#',
				'#form.belt#')
		</cfquery>
		
	
		<cflocation url="division_belt_add.cfm?id=#form.game_size#">
			
	
