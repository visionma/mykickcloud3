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
                list game
              </small>
            </h1>
          </div>

          <div class="row">
              <div class="col-xs-12">


<!--- PAGE CONTENT BEGINS --->



<cfquery datasource="mykickcloud" name="getList" >
  select *
  from game
  where school_id = '#session.school_id#' and is_active = 'on'
  order by start_date desc
</cfquery>


<cfif getList.Recordcount eq 0>

  0 game has listed.

<cfelse>


  <div class="table-responsive">
    <table id="forum_table"  class="table table-striped table-bordered table-hover">
      <thead>
        <tr>
          <th class="center">
            Title
          </th>
          <th class="center">Date</th>
          <th class="center">Player</th>
          <th class="center">Coach</th>
          <th class="center">Referee</th>
          <th class="center">Valunteer</th>
          <th class="center">Ring Screen</th>
        </tr>
      </thead>

      <tbody>
      <cfloop query="getList">
        <cfoutput>

        <cfquery datasource="mykickcloud" name="getPlayer" >
          select *
          from player
          where game_id = '#getList.game_id#'
        </cfquery>


          <cfquery datasource="mykickcloud" name="getSchool">
            select *
            from school
            where school_id = '#getList.school_id#'
          </cfquery>
        <tr>
          <td class="center">
            <cfif '#is_active#' eq 'on'>
            <a href="game_detail.cfm?gid=#getList.game_id#&sid=#getList.school_id#&gsize=#getList.game_size#">
            <span class="green">
            #game_title#</span></a>
            <cfelse>
            <span class="lighter grey">
            #game_title#</span>
            </cfif>
            </a>
          </td>
          <td class="center">#start_date#~#end_date#</td>
          <td class="center">#getPlayer.recordcount#</td>
          <td class="center"></td>
          <td class="center"></td>
          <td class="center"></td>
          <td class="center"><a href="ring_screen.cfm?gid=#getList.game_id#&sid=#getList.school_id#" target="new" class="btn btn-minier">VIEW</a></td>
        </tr>
        </cfoutput>
      </cfloop>
      </tbody>
    </table>
  </div>


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



    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>



    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>



    <script type="text/javascript">
      jQuery(function($) {
        var oTable1 = $('#forum_table').dataTable( {
        "aoColumns": [
            { "bSortable": false },
            null, null,null, null, null,
          { "bSortable": false }
        ] } );


        $('table th input:checkbox').on('click' , function(){
          var that = this;
          $(this).closest('table').find('tr > td:first-child input:checkbox')
          .each(function(){
            this.checked = that.checked;
            $(this).closest('tr').toggleClass('selected');
          });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
          var $source = $(source);
          var $parent = $source.closest('table')
          var off1 = $parent.offset();
          var w1 = $parent.width();

          var off2 = $source.offset();
          var w2 = $source.width();

          if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
          return 'left';
        }
      })
    </script>
    </body>
    </html>
