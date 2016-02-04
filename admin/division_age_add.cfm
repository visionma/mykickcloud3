
	
	
		
		<cfquery datasource="mykickcloud" name="addDivisionAgeGroup">
			insert into division_age_group(game_size,
									division_type,
									division_gender_group,
									age_min,
									age_max,
									age_group
									)
			values ('#form.game_size#', 
				'#form.division_type#',
				'#form.gender_group#',
				'#form.age_min#',
				'#form.age_max#',
				'#form.age_group#')
		</cfquery>
		
	
		<cflocation url="division_belt_add.cfm?id=#form.game_size#">
			
	
