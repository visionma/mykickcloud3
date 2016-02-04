<cfquery name="b9_yellow" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_breaking = 'b9_yellow'
</cfquery>
<cfquery name="b1014_yellow" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_breaking = 'b10-14_yellow'
</cfquery>
<cfquery name="b15_yellow" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_breaking = 'b15_yellow'
</cfquery>


<cfquery name="b9_red" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_breaking = 'b9_red'
</cfquery>
<cfquery name="b1014_red" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_breaking = 'b10-14_red'
</cfquery>
<cfquery name="b15_red" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_breaking = 'b15_red'
</cfquery>


<cfquery name="b9_black" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_breaking = 'b9_black'
</cfquery>
<cfquery name="b1014_black" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_breaking = 'b10-14_black'
</cfquery>
<cfquery name="b15_black" datasource="mykickcloud">
	select *
	from player
	where game_id = '#url.gid#' and is_breaking = 'b15_black'
</cfquery>