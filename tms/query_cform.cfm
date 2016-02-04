<cfquery name="cp13_yellow" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_cforms = 'cp13_yellow'
</cfquery>
<cfquery name="cp14_yellow" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_cforms = 'cp14_yellow'
</cfquery>

<cfquery name="cp13_red" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_cforms = 'cp13_red'
</cfquery>
<cfquery name="cp14_red" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_cforms = 'cp14_red'
</cfquery>