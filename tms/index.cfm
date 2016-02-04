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
      <li class="active">Dashboard</li>
    </ul>


  </div>

<div class="page-content">

    <div class="page-header position-relative">
      <h1>
      Dashboard
      <small>
      <i class="icon-double-angle-right"></i>
      overview &amp; stats
      </small>
      </h1>
    </div>

    <div class="row">
      <div class="col-xs-12">
    <!--- PAGE CONTENT BEGINS --->



  <div class="row">

      <div class="col-xs-12 col-sm-6 widget-container-span">

        <div class="widget-box">

          <div class="widget-header">
            <h5 class="bigger lighter">Game Information</h5>
              <div class="widget-toolbar">
                <a href="#" data-action="reload"><i class="icon-refresh"></i></a>
                <a href="#" data-action="collapse"><i class="icon-chevron-up"></i></a>
              </div>
          </div>


          <div class="widget-body">
            <div class="widget-main">
              <cfquery datasource="mykickcloud" name="getGame">
                select *
                from game
                where is_active = 'on'
              </cfquery>
              <cfquery datasource="mykickcloud" name="getSchool">
                select *
                from school
                where school_id = '#getGame.school_id#'
              </cfquery>
              <cfloop query="getGame">
                <cfoutput>
              <p class="lighter">
              <strong>#game_title# :</strong> #getSchool.school_name#<br>
              <strong>Location :</strong> #place_name#, #game_state#<br>
              <strong>Contact :</strong> #email#, #phone#<br>
              <strong>Date / Time :</strong> #start_date#~#end_date#, #start_time#
              </p>
              <hr>
                </cfoutput>
              </cfloop>

            </div>
          </div>

        </div>

      </div>





      <div class="col-xs-12 col-sm-6 widget-container-span">
        <div class="widget-box">

          <div class="widget-header">
            <h5 class="bigger lighter">
              <i class="icon-table"></i>
              NOTICE
            </h5>
          </div>

          <div class="widget-body">
            <div class="widget-main no-padding">
              <table class="table table-striped table-bordered table-hover">
                <tbody>
                <cfquery datasource="mykickcloud" name="getNotice">
                  select *
                  from board_notice
                </cfquery>
                <cfquery datasource="mykickcloud" name="getNum">
                  select max(num) as count
                  from board_notice
                </cfquery>
                <cfloop query="getNotice">
                  <cfoutput>
                    <cfquery datasource="mykickcloud" name="getReply">
                      select count(is_reply) as count
                      from board_notice
                      where father = #getNotice.id#
                    </cfquery>
                    <tr>
                      <td class="">#num#</td>
                      <td>
                        <a href="notice_view.cfm?vid=#num#">#subject#</a>
                          <cfif #getReply.count# gt 0>
                            &nbsp;&nbsp;
                            <span class="badge badge-green">
                              <i class="icon-comment"></i>  #getReply.count#
                            </span>
                          </cfif>
                      </td>
                      <td class="hidden-480">
                        #reg_date#
                      </td>
                    </tr>
                  </cfoutput>
                </cfloop>
                </tbody>
              </table>
            </div>
          </div>

      </div>
    </div>

  </div>



    <div class="space-24"></div>


<!--- PAGE CONTENT ENDS --->
      </div>
    </div>
  </div>
</div>


<cfinclude template="footer.cfm">