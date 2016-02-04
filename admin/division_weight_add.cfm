
<cfset newCode = "#form.game_size##form.division_type##form.gender_group##form.division_belt##form.division_age_group##form.weight#">



<cfquery datasource="mykickcloud" name="addDivisionMap">
	insert into division_map(game_size,
							division_type,
							gender_group,
							division_belt,
							division_age_group,
							division_weight,
							code)
		values ('#form.game_size#', 
				'#form.division_type#',
				'#form.gender_group#',
				'#form.division_belt#',
				'#form.division_age_group#',
				'#form.weight#',
				'#newCode#')
</cfquery>

<cflocation url="division_belt_add.cfm?id=#form.game_size#">