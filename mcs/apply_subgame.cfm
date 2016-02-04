

	<cfquery datasource="mykickcloud" name="apply_subgame">
		insert into player(school_id, game_id, members_id, sub_game_id, game_type, player_gender)
		values ('#url.sid#', '#url.gid#' ,'#url.uid#','#url.subid#','#url.gtype#','#url.gender#')
	</cfquery>
	
	<cflocation url="gameinfo.cfm">
	

