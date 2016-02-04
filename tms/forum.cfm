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
      <li class="active">Forum</li>
    </ul>



  </div>


  <div class="page-content">
    <div class="page-header position-relative">
      <h1>
        Dashboard
        <small>
          <i class="icon-double-angle-right"></i>
          Forum
        </small>
      </h1>
    </div>

    <div class="row">
      <div class="col-xs-12">

      <!--- PAGE CONTENT BEGINS --->
        <cfif structKeyExists(session,'school_id') and trim(session.school_id) neq "">

          <cfquery datasource="mykickcloud" name="getSchool">
            select *
            from school
            where school_id = #session.school_id#
          </cfquery>

          <cfquery datasource="mykickcloud" name="getGame">
            select *
            from board_school
            where num > 0
            order by num desc
          </cfquery>

          <cfquery datasource="mykickcloud" name="getNum">
            select max(num) as count
            from board_school
          </cfquery>


              <div class="table">
                <cfoutput>
                <strong class="smaller lighter green">SCHOOL FORUM > </strong>
                <strong class="smaller lighter orange"> TOTAL : #getNum.count#</strong>
                </cfoutput>
              </div>

              <div class="table-responsive">
                <table id="forum_table" class="table table-striped table-bordered table-hover">
                  <thead>
                    <th class="center">
                      <label>

                        <span class="lbl"></span>
                      </label>
                    </th>
                    <th class="center">
                      NO.
                    </th>

                    <th>Subject</th>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Views</th>
                    <th></th>
                  </thead>

                  <tbody>
                  <cfloop query="getGame">
                    <cfoutput>
                      <cfquery datasource="mykickcloud" name="getReply">
                        select count(is_reply) as count
                        from board_school
                        where father = #getGame.id#
                      </cfquery>
                    <tr>
                      <td class="center">
                        <label>
                          <i class="icon-caret-right bigger-130 green"></i>
                          <span class="lbl"></span>
                        </label>
                      </td>
                      <td class="center">#num#</td>
                      <td><a href="forum_view.cfm?vid=#num#">#subject#</a>

                      <cfif #getReply.count# gt 0>
                      &nbsp;&nbsp;
                      <span class="badge badge-green">
                        <i class="icon-comment"></i>  #getReply.count#
                      </span>
                      </cfif>

                      </td>
                      <td>#name#</td>
                      <td class="center">#reg_date#</td>
                      <td class="center">#hit#</td>
                      <td class="center">
                        <i class="icon-caret-left bigger-130 green">
                      </td>
                    </tr>
                    </cfoutput>
                  </cfloop>
                  </tbody>
                </table>
              </div>

            <br>

              <div class="no-margin-top center">
                <a href="forum_write.cfm">
                <button class="btn btn-sm btn-write center">
                  <i class="icon-pencil"></i>
                  WRITE
                </button>
                </a>
              </div>












        <cfelse>
          session time out
        </cfif>


      <!--- PAGE CONTENT ENDS --->
      </div>
    </div>
  </div>


  </div>
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
