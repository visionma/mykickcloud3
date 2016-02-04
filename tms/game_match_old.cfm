<cfinclude template="header.cfm" >
<cfinclude template="sidebar.cfm" >


<div class="main-content">
  

  <div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="">Home</a>
        <span class="divider">
        <i class="icon-angle-right arrow-icon"></i>
        </span>
      </li>
      <li class="active">Player List</li>
    </ul>
  </div>


  <div class="page-content">
    <div class="row">
      <div class="col-xs-12">


        <div class="row">
          <div class="col-sm-6">


            <!--- PAGE CONTENT BEGINS --->


              <cfquery name="getForm_Player" datasource="mykickcloud">
                select *
                from player
                where is_forms = '#url.code#' and game_id = #url.gid#
              </cfquery>

              <cfquery name="getSparring_Player" datasource="mykickcloud">
                select *
                from player
                where is_sparring = '#url.code#' and game_id = #url.gid#
              </cfquery>

              <cfquery name="getCform_Player" datasource="mykickcloud">
                select *
                from player
                where is_cforms = '#url.code#' and game_id = #url.gid#
              </cfquery>

              <cfquery name="getBreaking_Player" datasource="mykickcloud">
                select *
                from player
                where is_breaking = '#url.code#' and game_id = #url.gid#
              </cfquery>

              <cfquery name="getWeapon_Player" datasource="mykickcloud">
                select *
                from player
                where is_weapon = '#url.code#' and game_id = #url.gid#
              </cfquery>

              <cfif #getForm_Player.RecordCount# GT 0>
                <cfset queryName = "getForm_Player">
                <cfset playerTotal = "#getForm_Player.RecordCount#">
                <cfset formName = "form_final">
                <cfset code_table_name = "division_local_form">
              <cfelseif #getSparring_Player.RecordCount# GT 0>
                <cfset queryName = "getSparring_Player">
                <cfset playerTotal = "#getSparring_Player.RecordCount#">
                <cfset formName = "sparring_final">
                <cfset code_table_name = "division_local_sparring">
              <cfelseif #getCform_Player.RecordCount# GT 0>
                <cfset queryName = "getCform_Player">
                <cfset playerTotal = "#getCForm_Player.RecordCount#">
                <cfset formName = "cform_final">
                <cfset code_table_name = "division_local_cform">
              <cfelseif #getBreaking_Player.RecordCount# GT 0>
                <cfset queryName = "getBreaking_Player">
                <cfset playerTotal = "#getBreaking_Player.RecordCount#">
                <cfset formName = "breaking_final">
                <cfset code_table_name = "division_local_breaking">
              <cfelseif #getWeapon_Player.RecordCount# GT 0>
                <cfset queryName = "getWeapon_Player">
                <cfset playerTotal = "#getWeapon_Player.RecordCount#">
                <cfset formName = "weapon_final">
                <cfset code_table_name = "division_local_weapon">
              </cfif>

              <cfquery name="ringStatus" datasource="mykickcloud">
                select *
                from game
                where game_id = #url.gid#
              </cfquery>

              <cfquery name="ringSchedule" datasource="mykickcloud">
                select *
                from ring_status
                where game_id = #url.gid#
              </cfquery>

              <cfquery name="ringExist" datasource="mykickcloud">
                select *
                from ring_status
                where game_id = '#url.gid#' and code = '#url.code#'
              </cfquery>

              <cfquery name="getCode" datasource="mykickcloud">
                select *
                from #code_table_name#
                where code = '#url.code#'
              </cfquery>

              <div>
                <cfoutput>
                <cfif #getSparring_Player.RecordCount# GT 0>

                  <h4><span class="text-danger"><strong>SPARRING</strong> #getCode.age_group#</span></h4>

                  <cfelseif #getForm_Player.RecordCount# GT 0>

                  <h4><span class="text-danger"><strong>FORM</strong> #getCode.age_group#</span></h4>

                  <cfelseif #getCForm_Player.RecordCount# GT 0>

                  <h4><span class="text-danger"><strong>CREATIVE FORM</strong> #getCode.age_group#</span></h4>

                  <cfelseif #getBreaking_Player.RecordCount# GT 0>

                  <h4><span class="text-danger"><strong>BREAKING</strong> #getCode.age_group#</span></h4>

                  <cfelseif #getWeapon_Player.RecordCount# GT 0>

                  <h4><span class="text-danger"><strong>WEAPON</strong> #getCode.age_group#</span></h4>

                </cfif>
                </cfoutput>

                <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                  <thead>
                  <tr>
                    <th><center>Ring</center></th>
                    <th><center>Today</center></th>
                    <th><center>Current Time</center></th>
                  <th><center>Start Time</center></th>
                  </tr>
                  </thead>
                <cfoutput>
                  <tr>
                    <td align="center"><span class="blue">
                          <cfif #ringSchedule.RecordCount# GT 0>
                          #ringSchedule.ring_number#
                          <cfelse>
                          Ring is not scheduled yet
                          </cfif>
                          </span></th>
                    <td align="center"><span class="orange">#DateFormat(Now(), "mm/dd/yyyy")#</span></td>
                    <td align="center"><span class="orange">#TimeFormat(Now())#</span></td>
                  <td align="center"><span class="green">
                      <cfif #ringSchedule.RecordCount# GT 0>
                        #TimeFormat(ringSchedule.start_time, "hh:mm tt")#
                       <cfelseif #ringSchedule.is_finish# EQ 1>
                        FINISHED

                     <cfelse>
                      N/A
                       </cfif>
                        </span>

                  </span></td>
                  </tr>
                </cfoutput>
                </table>
              </div>




              <cfoutput query="getCode">



                <h4>PLAYER LIST </h4>

                  <div class="well well-sm">

                  <!--- form start --->

                    <cfif #ringExist.RecordCount# EQ 0>
  
 
    
                        <cfform name="chooseRing" action="applyRing.cfm" class="form-inline">

                          SET: 
                          
                          <cfselect name="ring_number" class="input-small">
                            <option value="">Ring</option>
                            <cfif '#ringStatus.ring_size#' eq '4'>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <cfelseif '#ringStatus.ring_size#' eq '5'>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <cfelseif '#ringStatus.ring_size#' eq '6'>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <cfelseif '#ringStatus.ring_size#' eq '7'>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <cfelseif '#ringStatus.ring_size#' eq '8'>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <cfelseif '#ringStatus.ring_size#' eq '9'>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <cfelse>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            </cfif>
                          </cfselect>
                          
                          START:
                          
                          <cfinput id="timepicker1" type="text" name="start_time" class="input-small">
                         
                          END:
                          
                          <cfinput id="timepicker2"  type="text" name="end_time" class="input-small">
                          
                          <cfinput type="hidden" name="gid" value="#url.gid#">
                          <cfinput type="hidden" name="code" value="#url.code#">
                          <cfinput type="hidden" name="is_finish" value="0">
                          <button class="btn btn-sm btn-info">SET RING</button>
                          

                        </cfform>


                    <cfelse>
  
                        <cfif structKeyExists(url,'modify') and trim(url.modify) eq "yes">
                          <cfform name="chooseRing" action="update_Ring.cfm" class="form-inline">
                              SET :
                              <cfselect name="ring_number">
                                <option value="#ringStatus.ring_size#" selected>#ringStatus.ring_size#</option>
                                <cfif '#ringStatus.ring_size#' eq '4'>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <cfelseif '#ringStatus.ring_size#' eq '5'>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <cfelseif '#ringStatus.ring_size#' eq '6'>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <cfelseif '#ringStatus.ring_size#' eq '7'>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <cfelseif '#ringStatus.ring_size#' eq '8'>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <cfelseif '#ringStatus.ring_size#' eq '9'>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <cfelse>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                </cfif>
                              </cfselect>

                            START: <cfinput id="timepicker3" type="text" name="start_time" class="input-small"> 
                            END:
                          
                          <cfinput id="timepicker4" type="text" name="end_time" class="input-small">

                            <button class="btn btn-sm btn-info">UPDATE</button>
                            <a href="game_match.cfm?gid=#url.gid#&code=#url.code#" class="btn btn-sm btn-warning">CANCEL</a>

                          </cfform>


                        <cfelse>


                            <a href="game_match.cfm?gid=#url.gid#&code=#url.code#&modify=yes" class="btn btn-xs btn-warning">MODIFY RING/TIME</a>
                        </cfif>

                    </cfif>

                    
                  </div><!--- well well form end --->



                  <div class="well well-sm">
                    Age : <span class="blue">#age_group#</span> | Weight : <span class="blue">#weight_group#</span> | Belt : <span class="blue">#belt_group#</span>
                  </div>


              </cfoutput>






                <div class="dd" id="nestable">
                      <ol class="dd-list">
                         <cfoutput query="#queryName#">

                    <cfquery name="getMember" datasource="mykickcloud">
                      select *
                      from members
                      where members_id = #members_id#
                    </cfquery>
                    <cfloop query="getMember">
                        <li class="dd-item" data-id="#members_id#">
                          <div class="dd-handle widget-main no-padding">

             
                              <table class="table table-striped table-bordered table-hover">
                              <tr>
                                <td width="15%" align="center"><span class="green"><small>#school_name#</small></span></td>
                                <td width="35%"><span class="blue"><small>#firstname# #lastname#</small></span></td>
                                <td width="12%" align="center"><span class="red"><small>#member_weight# lb</small></span></td>
                                <td width="10%" align="center"><span class="orange"><small>#member_height# ft</small></span></td>
                                <td align="center">
                                 
                            

                               

                                  <cfquery name="getPlayerResult" datasource="mykickcloud">
                                    select *
                                    from game_result
                                    where game_id = '#url.gid#' and code = '#url.code#' and score = '1'
                                  </cfquery>

                                  <cfquery name="getPlayerResult2" datasource="mykickcloud">
                                    select *
                                    from game_result
                                    where game_id = '#url.gid#' and code = '#url.code#' and score = '2'
                                  </cfquery>

                                  <cfquery name="getPlayerResult3" datasource="mykickcloud">
                                    select *
                                    from game_result
                                    where game_id = '#url.gid#' and code = '#url.code#' and score = '3'
                                  </cfquery>

                                  <cfif #getPlayerResult.member_id# EQ #members_id#>
                                      
                                    <span data-rel="tooltip" data-placement="left"  class="badge badge-default radius-5 tooltip-info white no-hover-underline">1
                                    </span>&nbsp;

                                    <a data-rel="tooltip" data-placement="left" href="game_result_delete.cfm?gid=#url.gid#&sid=#session.school_id#&mid=#members_id#&code=#url.code#"  class="badge badge-danger radius-5 tooltip-info white no-hover-underline">Delete
                                    </a>&nbsp;


                                  <cfelseif #getPlayerResult2.member_id# EQ #members_id#>

                                    <span data-rel="tooltip" data-placement="left"  class="badge badge-default radius-5 tooltip-info white no-hover-underline">2
                                    </span>&nbsp;

                                    <a data-rel="tooltip" data-placement="left" href="game_result_delete.cfm?gid=#url.gid#&sid=#session.school_id#&mid=#members_id#&code=#url.code#"  class="badge badge-danger radius-5 tooltip-info white no-hover-underline">Delete
                                    </a>&nbsp;

                                  <cfelseif #getPlayerResult3.member_id# EQ #members_id#>

                                    <span data-rel="tooltip" data-placement="left"  class="badge badge-default radius-5 tooltip-info white no-hover-underline">3
                                    </span>&nbsp;

                                    <a data-rel="tooltip" data-placement="left" href="game_result_delete.cfm?gid=#url.gid#&sid=#session.school_id#&mid=#members_id#&code=#url.code#"  class="badge badge-danger radius-5 tooltip-info white no-hover-underline">Delete
                                    </a>&nbsp;

                                  <cfelse>

                                    <cfif #getPlayerResult.score# GT 0>
                                      &nbsp;
                                    <cfelse>
                                      <a data-rel="tooltip" data-placement="left" href="game_result_add.cfm?gid=#url.gid#&sid=#session.school_id#&mid=#members_id#&code=#url.code#&sc=1" class="badge badge-primary radius-5 tooltip-info white no-hover-underline">1
                                      </a>&nbsp;
                                    </cfif>

                                    <cfif #getPlayerResult2.score# GT 0>
                                      &nbsp;
                                    <cfelse>
                                    <a data-rel="tooltip" data-placement="left" href="game_result_add.cfm?gid=#url.gid#&sid=#session.school_id#&mid=#members_id#&code=#url.code#&sc=2" class="badge badge-primary radius-5 tooltip-info white no-hover-underline">2
                                    </a>&nbsp;
                                    </cfif>

                                    <cfif #getPlayerResult3.score# GT 0>
                                      &nbsp;
                                    <cfelse>
                                    <a data-rel="tooltip" data-placement="left" href="game_result_add.cfm?gid=#url.gid#&sid=#session.school_id#&mid=#members_id#&code=#url.code#&sc=3" class="badge badge-primary radius-5 tooltip-info white no-hover-underline">3
                                    </a>
                                    </cfif>

                                  </cfif>

                                </td>
                              </tr>
                            </table>
             
                           

                          </div>
                        </li>
                      </ol>
                       </cfloop>

                  </cfoutput>
                </div>




          </div><!--col-sm-6-->




          <div class="col-sm-6">

            <h3 class="header blue lighter smaller">
              <i class="icon-list smaller-90"></i>
              Ring Status
            </h3>

            <div id="accordion" class="accordion-style2">

              <!---------->
              <cfquery name="listRing" datasource="mykickcloud">
                select *
                from ring_status
                where game_id = '#url.gid#'
                group by ring_number
                order by ring_number
               </cfquery>

              <cfoutput query="listring">

                <cfquery name="listDivision" datasource="mykickcloud">
                  select *
                  from ring_status
                  where ring_number = '#listRing.ring_number#'
                </cfquery>


                <div class="group">
                  <h3 class="accordion-header">RING #ring_number#</h3>

                  <div class=" widget-main no-padding">
                      <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <th><center>Division</center></th>
                      <th><center>Start</center></th>
                      <th><center>End</center></th>
                    </tr>
                  </thead>
                      <cfloop query="listDivision">
                       <tr>
                          <td align="center"><span class="orange">#code#</span></th>
                          <td align="center"><span class="pink">#TimeFormat(start_time, "hh:mm tt")#</span></td>
                          <td align="center"><span class="purple">#TimeFormat(end_time, "hh:mm tt")#</span></td>
                    
                        </tr>
                      </cfloop>
                       </table>
                  </div>
                </div>
              </cfoutput>
               

            </div><!-- #accordion -->

          </div>

        </div><!--row end-->





<!--- PAGE CONTENT ENDS --->
      </div><!--col-sm-12-->
    </div><!--row-->
  </div><!--page-content-->
</div><!--main-content-->





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
