


<cfquery name="get_Player" datasource="mykickcloud">
  select *
  from player
  inner join division_map
  where player.code = '#url.code#' 
        and player.game_id = '#url.gid#' 
        and division_map.code = '#url.code#'
</cfquery>

              

<cfif #get_Player.division_type# EQ 1>

  <cfset queryName = "getForm_Player">
  <cfset playerTotal = "#get_Player.RecordCount#">
  <cfset formName = "form_final">
  
<cfelseif  #get_Player.division_type# EQ 2>

  <cfset queryName = "getSparring_Player">
  <cfset playerTotal = "#get_Player.RecordCount#">
  <cfset formName = "sparring_final">
  
<cfelseif  #get_Player.division_type# EQ 3>

  <cfset queryName = "getCform_Player">
  <cfset playerTotal = "#get_Player.RecordCount#">
  <cfset formName = "cform_final">
  
<cfelseif  #get_Player.division_type# EQ 4>

  <cfset queryName = "getBreaking_Player">
  <cfset playerTotal = "#get_Player.RecordCount#">
  <cfset formName = "breaking_final">
 
<cfelseif  #get_Player.division_type# EQ 5>

  <cfset queryName = "getWeapon_Player">
  <cfset playerTotal = "#get_Player.RecordCount#">
  <cfset formName = "weapon_final">
 
</cfif>


<cfquery name="ringStatus" datasource="mykickcloud">
  select *
  from game
  where game_id = '#url.gid#'
</cfquery>

<cfquery name="ringSchedule" datasource="mykickcloud">
  select *
  from ring_status
  where game_id = '#url.gid#'
</cfquery>

<cfquery name="ringExist" datasource="mykickcloud">
  select *
  from ring_status
  where game_id = '#url.gid#' and code = '#url.code#'
</cfquery>

<cfquery name="getCode" datasource="mykickcloud">
  select *
  from division_map
  where code = '#url.code#'
</cfquery>

<cfquery name="division_age_group" datasource="mykickcloud">
  select *
  from division_age_group
  where game_size = '#get_player.game_size#' 
        and division_type = '#get_Player.division_type#' 
        and id = '#get_Player.division_age_group#'
</cfquery>

<cfquery name="division_belt" datasource="mykickcloud">
  select *
  from division_belt
  where game_size = '#get_player.game_size#' 
        and division_type = '#get_Player.division_type#' 
        and id = '#get_Player.division_belt#'
</cfquery>

<cfquery name="division_weight" datasource="mykickcloud">
  select *
  from division_weight_group
  where game_size = '#get_player.game_size#' 
        and id = '#get_Player.division_weight#'
</cfquery>




<cfdocument format="PDF" filename="div/#url.gid##url.code#.pdf" overwrite="Yes" orientation = "landscape">

  <div>
    <font face="arial">
    <table border="0" cellpadding="0" cellspacing="3" width="20%">
    <cfoutput>
    <cfif #get_Player.division_type# EQ 1>
        <tr>
          <td colspan="2">
            <h4 class="header blue lighter smaller">
              <span class="text-danger">FORM</span>
            </h4>
          </td>
        </tr>
        <tr>
          <Td><font size="2">Age : </font></td>
          <td><font size="2">#division_age_group.age_group#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Weight : </font></td>
          <td><font size="2">#division_weight.weight#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Belt : </font></td>
          <td><font size="2">#division_belt.belt#</font></td>
        </tr>
        <tr>
          <td><font size="2">Ring: </font></td>
          <td><font size="2">#ringSchedule.ring_number#</font></td>
        </tr>
        <tr>
          <td><font size="2">Today: </font></td>
          <td><font size="2">#DateFormat(Now(), "mm/dd/yyyy")#</font></td>
        </tr>
        <tr>
          <td><font size="2">Current Time: </font></td>
          <td><font size="2">#TimeFormat(Now())#</font></td>
        </tr>
        <tr>
          <td><font size="2">Start Time: </font></td>
          <td><font size="2">#TimeFormat(ringSchedule.start_time, "hh:mm tt")#</font></td>
        </tr>
      

    <cfelseif #get_Player.division_type# EQ 2>

  
        <tr>
          <td colspan="2">
            <h4 class="header blue lighter smaller">
              <span class="text-danger">SPARRING</span>
            </h4>
          </td>
        </tr>
        <tr>
          <Td><font size="2">Age : </font></td>
          <td><font size="2">#division_age_group.age_group#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Weight : </font></td>
          <td><font size="2">#division_weight.weight#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Belt : </font></td>
          <td><font size="2">#division_belt.belt#</font></td>
        </tr>
        <tr>
          <td><font size="2">Ring: </font></td>
          <td><font size="2">#ringSchedule.ring_number#</font></td>
        </tr>
        <tr>
          <td><font size="2">Today: </font></td>
          <td><font size="2">#DateFormat(Now(), "mm/dd/yyyy")#</font></td>
        </tr>
        <tr>
          <td><font size="2">Current Time: </font></td>
          <td><font size="2">#TimeFormat(Now())#</font></td>
        </tr>
        <tr>
          <td><font size="2">Start Time: </font></td>
          <td><font size="2">#TimeFormat(ringSchedule.start_time, "hh:mm tt")#</font></td>
        </tr>

    <cfelseif #get_Player.division_type# EQ 3>

      
        <tr>
          <td colspan="2">
            <h4 class="header blue lighter smaller">
              <span class="text-danger">CREATIVE FORM</span>
            </h4>
          </td>
        </tr>
        <tr>
          <Td><font size="2">Age : </font></td>
          <td><font size="2">#division_age_group.age_group#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Weight : </font></td>
          <td><font size="2">#division_weight.weight#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Belt : </font></td>
          <td><font size="2">#division_belt.belt#</font></td>
        </tr>
        <tr>
          <td><font size="2">Ring: </font></td>
          <td><font size="2">#ringSchedule.ring_number#</font></td>
        </tr>
        <tr>
          <td><font size="2">Today: </font></td>
          <td><font size="2">#DateFormat(Now(), "mm/dd/yyyy")#</font></td>
        </tr>
        <tr>
          <td><font size="2">Current Time: </font></td>
          <td><font size="2">#TimeFormat(Now())#</font></td>
        </tr>
        <tr>
          <td><font size="2">Start Time: </font></td>
          <td><font size="2">#TimeFormat(ringSchedule.start_time, "hh:mm tt")#</font></td>
        </tr>

    <cfelseif #get_Player.division_type# EQ 4>

     
        <tr>
          <td colspan="2">
            <h4 class="header blue lighter smaller">
              <span class="text-danger">BREAKING</span>
            </h4>
          </td>
        </tr>
        <tr>
          <Td><font size="2">Age : </font></td>
          <td><font size="2">#division_age_group.age_group#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Weight : </font></td>
          <td><font size="2">#division_weight.weight#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Belt : </font></td>
          <td><font size="2">#division_belt.belt#</font></td>
        </tr>
        <tr>
          <td><font size="2">Ring: </font></td>
          <td><font size="2">#ringSchedule.ring_number#</font></td>
        </tr>
        <tr>
          <td><font size="2">Today: </font></td>
          <td><font size="2">#DateFormat(Now(), "mm/dd/yyyy")#</font></td>
        </tr>
        <tr>
          <td><font size="2">Current Time: </font></td>
          <td><font size="2">#TimeFormat(Now())#</font></td>
        </tr>
        <tr>
          <td><font size="2">Start Time: </font></td>
          <td><font size="2">#TimeFormat(ringSchedule.start_time, "hh:mm tt")#</font></td>
        </tr>

    <cfelseif #get_Player.division_type# EQ 5>

     
        <tr>
          <td colspan="2">
            <h4 class="header blue lighter smaller">
              <span class="text-danger">WEAPON</span>
            </h4>
          </td>
        </tr>
        <tr>
          <Td><font size="2">Age : </font></td>
          <td><font size="2">#division_age_group.age_group#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Weight : </font></td>
          <td><font size="2">#division_weight.weight#</font></td>
        </tr>
        <tr>
          <Td><font size="2">Belt : </font></td>
          <td><font size="2">#division_belt.belt#</font></td>
        </tr>
        <tr>
          <td><font size="2">Ring: </font></td>
          <td><font size="2">#ringSchedule.ring_number#</font></td>
        </tr>
        <tr>
          <td><font size="2">Today: </font></td>
          <td><font size="2">#DateFormat(Now(), "mm/dd/yyyy")#</font></td>
        </tr>
        <tr>
          <td><font size="2">Current Time: </font></td>
          <td><font size="2">#TimeFormat(Now())#</font></td>
        </tr>
        <tr>
          <td><font size="2">Start Time: </font></td>
          <td><font size="2">#TimeFormat(ringSchedule.start_time, "hh:mm tt")#</font></td>
        </tr>
      
    </cfif>
    </cfoutput>
    </table>
    </font>
  </div>
<br>

<h4><font face="arial">PLAYER LIST</font></h4>

<table border="0" cellpadding="0" cellspacing="0" width="35%">
  <tr>
    <td bgcolor="black">
 <table border="0" cellpadding="1" cellspacing="3" width="100%">
      <tr>
        <td bgcolor="grey"><font size="2" face="arial" color="white">School</font></td>
        <td bgcolor="grey"><font size="2" face="arial" color="white">Name</font></td>
        <td bgcolor="grey"><font size="2" face="arial" color="white">Weight</font></td>
        <td bgcolor="grey"><font size="2" face="arial" color="white">Height</font></td>
      </tr>
<cfoutput query="get_player">

  <cfquery name="getMember" datasource="mykickcloud">
    select *
    from members
    where members_id = #members_id#
  </cfquery>
 
    <cfloop query="getMember">
      <tr>
        <td bgcolor="white"><font size="2" face="arial">#school_name#</font></td>
        <td bgcolor="white"><font size="2" face="arial">#firstname# #lastname#</font></td>
        <td bgcolor="white"><font size="2" face="arial">#member_weight# lb</font></td>
        <td bgcolor="white"><font size="2" face="arial">#member_height# ft</font></td>
      </tr>
    </cfloop>
  
  </cfoutput>
</table>
</td>
</tr>
</table>
    
</cfdocument>

<cfpdf action="read" name="myPDF" source="div/#url.gid##url.code#.pdf" />
  <cfcontent variable="#toBinary(myPDF)#" type="application/pdf" />



    <script type="text/javascript">
      window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>


    <script type="text/javascript">
      if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>


    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>


    <script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="assets/js/jquery-ui-1.10.3.full.min.js"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.sparkline.min.js"></script>
    <script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
    <script src="assets/js/date-time/bootstrap-timepicker.min.js"></script>
    <script src="assets/js/date-time/moment.min.js"></script>
    <script src="assets/js/date-time/daterangepicker.min.js"></script>
    <script src="assets/js/jquery.nestable.min.js"></script>
    <script src="assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
    <script src="assets/js/jquery.maskedinput.min.js"></script>
    


    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>


      <script type="text/javascript">
      jQuery(function($) {
        


        $('#timepicker1').timepicker({
          minuteStep: 1,
          showSeconds: true,
          showMeridian: false
        }).next().on(ace.click_event, function(){
          $(this).prev().focus();
        });


        $('#timepicker2').timepicker({
          minuteStep: 1,
          showSeconds: true,
          showMeridian: false
        }).next().on(ace.click_event, function(){
          $(this).prev().focus();
        });

        $('#timepicker3').timepicker({
          minuteStep: 1,
          showSeconds: true,
          showMeridian: false
        }).next().on(ace.click_event, function(){
          $(this).prev().focus();
        });

        $('#timepicker4').timepicker({
          minuteStep: 1,
          showSeconds: true,
          showMeridian: false
        }).next().on(ace.click_event, function(){
          $(this).prev().focus();
        });





        //jquery accordion
        $( "#accordion" ).accordion({
          collapsible: true ,
          heightStyle: "content",
          animate: 250,
          header: ".accordion-header"
        }).sortable({
          axis: "y",
          handle: ".accordion-header",
          stop: function( event, ui ) {
            // IE doesn't register the blur when sorting
            // so trigger focusout handlers to remove .ui-state-focus
            ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
          }
        });

        $('.dd').nestable();
      
        $('.dd-handle a').on('mousedown', function(e){
          e.stopPropagation();
        });
        
        $('[data-rel="tooltip"]').tooltip();



      });
    </script>
  </body>
</html>
