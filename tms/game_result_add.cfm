

<cfset game_id = '#url.gid#'>
<cfset school_id = '#url.sid#'>
<cfset member_id = '#url.mid#'>
<cfset code = '#url.code#'>
<cfset date = '#session.today#'>
<cfset score = '#url.sc#'>
<cfset point = '1'>



<cfquery name="check_member_result" datasource="mykickcloud">
	select *
	from game_result
	where game_id = '#url.gid#' and school_id = '#url.sid#' and member_id = '#url.mid#' and code = '#url.code#'
</cfquery>


<cfif check_member_result.RecordCount GT 0>
	
	<cfset scoreExist = '1'>
	<cflocation url="game_match.cfm?gid=#url.gid#&sid=#url.sid#&code=#url.code#">
	<cfabort>


<cfelse>

<cfquery datasource="mykickcloud" name="addGameResult">
		insert into game_result(game_id,
								school_id,
								member_id,
								code,
								date,
								score,
								point)
		values ('#game_id#',
				'#school_id#',
				'#member_id#',
				'#code#',
				'#date#',
				'#score#',
				'#point#')
</cfquery>


<cflocation url="game_match.cfm?gid=#url.gid#&code=#url.code#">

</cfif>