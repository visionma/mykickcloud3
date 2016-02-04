
<!--check if the division is exist in the game -->

<cfquery name="checkRingStatus" datasource="mykickcloud">
  select *
  from ring_status
  where code = '#form.code#' and game_id = '#form.gid#'
</cfquery>

<cfif #checkRingStatus.RecordCount# EQ 0>

<!--check if time is reserved by different division already -->

  <cfquery name="checkTime" datasource="mykickcloud">
    select *
    from ring_status
    where game_id = '#form.gid#' and 
          start_time >= '#form.start_time#' and  < '#form.end_time#'
  </cfquery>

  <cfelseif #checkTime.RecordCount# EQ 0>
    
<!-- if no record both above, reserve seat --->

      <cfquery datasource="mykickcloud" name="addRingStatus">
        insert into ring_status(game_id,
                            ring_number,
                            code,
                            start_time,
                            end_time
                            )
        values ('#form.gid#',
              '#form.ring_number#',
              '#form.code#',
              '#timeformat(form.start_time, "hh:mm tt")#',
              '#timeformat(form.end_time, "hh:mm tt")#'
              )
      </cfquery>


      <cflocation url="game_match.cfm?gid=#form.gid#&code=#form.code#">



<cfelse>


<cfset game_exist = 'yes'>

<cflocation url="game_match.cfm?gid=#form.gid#&code=#form.code#">

</cfif>