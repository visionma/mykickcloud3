<cfquery name="w9_yellow" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_weapon = 'b9_yellow'
</cfquery>
<cfquery name="w1014_yellow" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_weapon = 'w10-14_yellow'
</cfquery>
<cfquery name="w15_yellow" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_weapon = 'w15_yellow'
</cfquery>