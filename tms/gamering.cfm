<cfinclude template="header.cfm" >
<cfinclude template="sidebar.cfm" >


<div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">
          <ul class="breadcrumb">
            <li>
              <i class="icon-home home-icon"></i>
              <a href="#">Home</a>

              <span class="divider">
                <i class="icon-angle-right arrow-icon"></i>
              </span>
            </li>
            <li class="active">Manage Games</li>
          </ul>


        </div>
          <div class="page-content">
          <div class="page-header position-relative">
            <h1>
              Dashboard
              <small>
                <i class="icon-double-angle-right"></i>
                manage game
                <i class="icon-double-angle-right"></i>
                view rings
              </small>
            </h1>
          </div>

          <div class="row">
              <div class="col-xs-12">


        <!--- PAGE CONTENT BEGINS --->
<cfif isDefined("session.school_id")>

<cfif '#url.r#' eq '4'>
  <cfset rings = [1,2,3,4]>
<cfelseif '#url.r#' eq '5'>
  <cfset rings = [1,2,3,4,5]>
<cfelseif '#url.r#' eq '6'>
  <cfset rings = [1,2,3,4,5,6]>
<cfelseif '#url.r#' eq '7'>
  <cfset rings = [1,2,3,4,5,6,7]>
<cfelseif '#url.r#' eq '8'>
  <cfset rings = [1,2,3,4,5,6,7,8]>
<cfelseif '#url.r#' eq '9'>
  <cfset rings = [1,2,3,4,5,6,7,8,9]>
<cfelse>
  <cfset rings = [1,2,3,4,5,6,7,8,9,10]>
</cfif>




  <cfloop array=#rings# index="i">

    <cfquery datasource="mykickcloud" name="getGame" >
      select *
      from game
      where school_id = '#session.school_id#'
    </cfquery>

    <cfquery datasource="mykickcloud" name="subgameList" >
      select *
      from sub_game
      where school_id = '#getGame.school_id#'
        and game_id = '#getGame.game_id#'
        and game_ring = '#rings[i]#'
      order by start_time
    </cfquery>

    <div class="col-xs-6 col-sm-3 pricing-box">
      <div class="widget-box">
        <cfif '#rings[i]#' eq '1'>
          <div class="widget-header header-color-orange">
        <cfelseif '#rings[i]#' eq '2'>
          <div class="widget-header header-color-green">
        <cfelseif '#rings[i]#' eq '3'>
          <div class="widget-header header-color-blue">
        <cfelseif '#rings[i]#' eq '4'>
          <div class="widget-header header-color-red">
        <cfelseif '#rings[i]#' eq '5'>
          <div class="widget-header header-color-orange">
        <cfelseif '#rings[i]#' eq '6'>
          <div class="widget-header header-color-green">
        <cfelseif '#rings[i]#' eq '7'>
          <div class="widget-header header-color-blue">
        <cfelseif '#rings[i]#' eq '8'>
          <div class="widget-header header-color-red">
        <cfelseif '#rings[i]#' eq '9'>
          <div class="widget-header header-color-orange">
        <cfelse>
          <div class="widget-header header-color-green">
        </cfif>

        <h5 class="bigger lighter"><cfoutput>RING #rings[i]#</cfoutput></h5>
          </div>
        <div class="widget-body">
          <div class="widget-main">

            <cfoutput query="subgameList">
              <cfquery datasource="mykickcloud" name="getPlayer">
                select *
                from player
                where sub_game_id = '#sub_game_id#'
              </cfquery>


            <div id="faq-list-2" class="panel-group accordion-style1 accordion-style2">

              <div class="panel panel-default">
                <div class="panel-heading">
                  <a href="##sub#sub_game_id#"  data-toggle="collapse" class="accordion-toggle collapsed">
                    <i class="icon-chevron-right smaller-80" data-icon-hide="icon-chevron-down align-top" data-icon-show="icon-chevron-right"></i>
                    &nbsp;
                    #game_type#<br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#game_belt# | Age: #game_age# | #TimeFormat(start_time, "HH:mm")#
                    </a>
                </div>
                <div class="panel-collapse collapse" id="sub#sub_game_id#">
                  <div class="panel-body">

                  <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                    <cfloop query="getPlayer">
                      <cfquery datasource="mykickcloud" name="getMember">
                        select *
                        from members
                        where members_id = '#getPlayer.members_id#'
                      </cfquery>
                      <tr>
                        <td>
                        <span class="dark">
                          #getMember.firstname# #getMember.lastname# <br>
                            <div class="pull-right action-buttons">
                              <button class="btn btn-minier">1</button>
                              <button class="btn btn-minier">2</button>
                              <button class="btn btn-minier">3</button>
                            </div>
                        </span>
                        </td>
                      </tr>

                    </cfloop>
                  </table>
                  </div>
                </div>
              </div>

            </div>
            <br>
            </cfoutput>


        </div>

      </div>
    </div>
  </div>

</cfloop>








<cfelse>
  session time out
</cfif>





<!--- PAGE CONTENT ENDS --->


</div>



    <script type="text/javascript">
      window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>



    <script type="text/javascript">
      if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>


    <script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>


    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>

    <script type="text/javascript">
      jQuery(function($) {
        $('.accordion').on('hide', function (e) {
          $(e.target).prev().children(0).addClass('collapsed');
        })
        $('.accordion').on('show', function (e) {
          $(e.target).prev().children(0).removeClass('collapsed');
        })
      });
    </script>
  </body>
</html>



