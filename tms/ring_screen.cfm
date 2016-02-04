<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>TMS ::: Tournament Management System</title>
    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />


    <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
    <link rel="stylesheet" href="assets/css/chosen.css" />
    <link rel="stylesheet" href="assets/css/datepicker.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" href="assets/css/daterangepicker.css" />
    <link rel="stylesheet" href="assets/css/colorpicker.css" />
    <link rel="stylesheet" href="assets/css/prettify.css" />
    <link rel="stylesheet" href="assets/css/colorbox.css" />



    <link rel="stylesheet" href="assets/css/ace-fonts.css" />


    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/ace-responsive.min.css" />
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />


    <script src="../assets/js/ace-extra.min.js"></script>

  
  </head>

  <body>

    <div class="navbar navbar-default" id="navbar">
      <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
      </script>

      <div class="navbar-container" id="navbar-container">

          <div class="navbar-header pull-left">
            <a href="index.cfm" class="navbar-brand">
              <small><small>
                <i class="icon-cloud-upload"></i>
                <strong>MyKick</strong><span class="lighter">CLOUD</span> <small><small>: Tournament Management System</small></small>
              </small></small>
            </a>
          </div>

          <div class="navbar-header pull-right">
            RING STATUS [Need to add auto refresh & full screen button]
          </div>

      </div>
    </div>
<!---header end--->    


<div>
  <div class="page-content">
    <div class="row">
      <div class="col-xs-12">


<!--- PAGE CONTENT BEGINS --->
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

                <div class="col-xs-4 col-sm-2 pricing-box">
                  <div class="widget-box">
                    <div class="widget-header header-color-dark">
                      <h5 class="bigger lighter">RING #ring_number#</h5>
                    </div>

                    <div class="widget-body">
                      <div class="widget-main">
                        <ul class="list-unstyled spaced2">
                          <cfloop query="listDivision">
                          <li>
                            <span class="orange">#code#</span> | <span class="pink">#TimeFormat(start_time, "hh:mm tt")#
                          </li>
                          </cfloop>
                         
                      </div>

                   
                    </div>
                  </div>
                </div>

             </cfoutput>




<!--- PAGE CONTENT ENDS --->
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
