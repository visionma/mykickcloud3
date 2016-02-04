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
                game detail
              </small>
            </h1>
          </div>

          <div class="row">
              <div class="col-xs-12">


<!--- PAGE CONTENT BEGINS --->


<cfquery name="getGame" datasource="mykickcloud">
  select *
  from game
  where game_id = '#url.gid#' and school_id = '#url.sid#'
</cfquery>




<cfoutput query="getGame">

  <cfquery name="getPlayer" datasource="mykickcloud">
    select *
    from player
    where game_id = '#getGame.game_id#' and school_id = '#getGame.school_id#'
  </cfquery>

<!--- count player for Form division --->

<cfinclude template="query_form.cfm">

<!--- count player for Sparring division --->

<cfinclude template="query_sparring.cfm">

<!--- count player for Creative Form division --->

<cfinclude template="query_cform.cfm">

<!--- count player for Board Breaking division --->

<cfinclude template="query_breaking.cfm">

<!--- count player for Weapon division --->

<cfinclude template="query_weapon.cfm">


<h3 class="header smaller red">Forms / Poomse</h3>

<div class="row">
  <div class="col-xs-4 col-sm-3 pricing-span-header">
    <div class="widget-box transparent">
      <div class="widget-header">
        <h5 class="bigger lighter">Male/Female</h5>
      </div>

      <div class="widget-body">
        <div class="widget-main no-padding">
          <ul class="list-unstyled list-striped pricing-table-header">

            <li>5 and under </li>
            <li>6 to 7 </li>
            <li>8 to 10 </li>
            <li>11 to 13 </li>
            <li>14 to 16 </li>
            <li>17 and Above </li>
            <li>35 and Above </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <div class="col-xs-8 col-sm-9 pricing-span-body">
    

    <div class="pricing-span">
      <div class="widget-box pricing-box-small">
        <div class="widget-header header-color-orange">
          <h5 class="bigger lighter">White/Yel/Orange</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table">

              <li>
                <cfif #p5L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p5L_yellow">Light #p5L_yellow.RecordCount#</a>
                </cfif> |
                <cfif #p5H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p5H_yellow">Heavy #p5H_yellow.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p67L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p6-7L_yellow">Light #p67L_yellow.RecordCount#</a>
                </cfif> |
                <cfif #p67H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p6-7H_yellow">Heavy #p67H_yellow.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p810L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p8-10L_yellow">Light #p810L_yellow.RecordCount#</a>
                </cfif> |
                <cfif #p810H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p8-10H_yellow">Heavy #p810H_yellow.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p1113L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p11-13L_yellow">Light #p1113L_yellow.RecordCount#</a>
                 </cfif>|
                <cfif #p1113H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p11-13H_yellow">Heavy #p1113H_yellow.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p1416L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p14-16L_yellow">Light #p1416L_yellow.RecordCount#</a>
                </cfif> |
                <cfif #p1416H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p14-16H_yellow">Heavy #p1416H_yellow.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p17L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p17L_yellow">Light #p17L_yellow.RecordCount#</a>
                </cfif> |
                <cfif #p17H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p17H_yellow">Heavy #p17H_yellow.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p35L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p35L_yellow">Light #p35L_yellow.RecordCount#</a>
                </cfif> |
                <cfif #p35H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p35H_yellow">Heavy #p35H_yellow.RecordCount#</a>
                </cfif>
              </li>
            </ul>


          </div>


        </div>
      </div>
    </div>

    <div class="pricing-span">
      <div class="widget-box pricing-box-small">
        <div class="widget-header header-color-blue">
          <h5 class="bigger lighter">Green/Blue</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table">
              <li>
                <cfif #p5L_blue.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p5L_blue">Light #p5L_blue.RecordCount#</a>
                </cfif> |
                <cfif #p5H_blue.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p5H_blue">Heavy #p5H_blue.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p67L_blue.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p6-7L_blue">Light #p67L_blue.RecordCount#</a>
                </cfif> |
                <cfif #p67H_blue.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p6-7H_blue">Heavy #p67H_blue.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p810L_blue.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p8-10L_blue">Light #p810L_blue.RecordCount#</a>
                </cfif> |
                <cfif #p810H_blue.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p8-10H_blue">Heavy #p810H_blue.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p1113L_blue.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p11-13L_blue">Light #p1113L_blue.RecordCount#</a>
                 </cfif>|
                <cfif #p1113H_blue.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p11-13H_blue">Heavy #p1113H_blue.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p1416L_blue.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p14-16L_blue">Light #p1416L_blue.RecordCount#</a>
                </cfif> |
                <cfif #p1416H_blue.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p14-16H_blue">Heavy #p1416H_blue.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p17L_blue.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p17L_blue">Light #p17L_blue.RecordCount#</a>
                </cfif> |
                <cfif #p17H_blue.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p17H_blue">Heavy #p17H_blue.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p35L_blue.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p35L_blue">Light #p35L_blue.RecordCount#</a>
                </cfif> |
                <cfif #p35H_blue.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p35H_blue">Heavy #p35H_blue.RecordCount#</a>
                </cfif>
              </li>
            </ul>

          </div>

        </div>
      </div>
    </div>

    <div class="pricing-span">
      <div class="widget-box pricing-box-small">
        <div class="widget-header header-color-red3">
          <h5 class="bigger lighter">Red/Brown</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table">
              <li>
                <cfif #p5L_red.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p5L_red">Light #p5L_red.RecordCount#</a>
                </cfif> |
                <cfif #p5H_red.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p5H_red">Heavy #p5H_red.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p67L_red.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p6-7L_red">Light #p67L_red.RecordCount#</a>
                </cfif> |
                <cfif #p67H_red.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p6-7H_red">Heavy #p67H_red.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p810L_red.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p8-10L_red">Light #p810L_red.RecordCount#</a>
                </cfif> |
                <cfif #p810H_red.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p8-10H_red">Heavy #p810H_red.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p1113L_red.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p11-13L_red">Light #p1113L_red.RecordCount#</a>
                 </cfif>|
                <cfif #p1113H_red.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p11-13H_red">Heavy #p1113H_red.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p1416L_red.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p14-16L_red">Light #p1416L_red.RecordCount#</a>
                </cfif> |
                <cfif #p1416H_red.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p14-16H_red">Heavy #p1416H_red.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p17L_red.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p17L_red">Light #p17L_red.RecordCount#</a>
                </cfif> |
                <cfif #p17H_red.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p17H_red">Heavy #p17H_red.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p35L_red.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p35L_red">Light #p35L_red.RecordCount#</a>
                </cfif> |
                <cfif #p35H_red.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p35H_red">Heavy #p35H_red.RecordCount#</a>
                </cfif>
              </li>
            </ul>

          </div>


        </div>
      </div>
    </div>

    <div class="pricing-span">
      <div class="widget-box pricing-box-small">
        <div class="widget-header header-color-grey">
          <h5 class="bigger lighter">Black</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table">
              <li>
                <cfif #p5L_black.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p5L_black">Light #p5L_black.RecordCount#</a>
                </cfif> |
                <cfif #p5H_black.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p5H_black">Heavy #p5H_black.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p67L_black.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p6-7L_black">Light #p67L_black.RecordCount#</a>
                </cfif> |
                <cfif #p67H_black.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p6-7H_black">Heavy #p67H_black.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p810L_black.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p8-10L_black">Light #p810L_black.RecordCount#</a>
                </cfif> |
                <cfif #p810H_black.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p8-10H_black">Heavy #p810H_black.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p1113L_black.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p11-13L_black">Light #p1113L_black.RecordCount#</a>
                 </cfif>|
                <cfif #p1113H_black.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p11-13H_black">Heavy #p1113H_black.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p1416L_black.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p14-16L_black">Light #p1416L_black.RecordCount#</a>
                </cfif> |
                <cfif #p1416H_black.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p14-16H_black">Heavy #p1416H_black.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p17L_black.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p17L_black">Light #p17L_black.RecordCount#</a>
                </cfif> |
                <cfif #p17H_black.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p17H_black">Heavy #p17H_black.RecordCount#</a>
                </cfif>
              </li>
              <li>
                <cfif #p35L_black.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p35L_black">Light #p35L_black.RecordCount#</a>
                </cfif> |
                <cfif #p35H_black.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=p35H_black">Heavy #p35H_black.RecordCount#</a>
                </cfif>
              </li>
            </ul>


          </div>


        </div>
      </div>
    </div>
  </div>
  </div>
<!------------------------------->
<!------------------------------->
<div class="space-24"></div>
<!------------------------------->
<!------------------------------->


<h3 class="header smaller red">Sparring / Gyroogi</h3>

<div class="row">

  <div class="col-xs-4 col-sm-3 pricing-span-header">
    <div class="widget-box transparent">
      <div class="widget-header">
        <h5 class="bigger lighter">Boy/Girls</h5>
      </div>

      <div class="widget-body">
        <div class="widget-main no-padding">
          <ul class="list-unstyled list-striped pricing-table-header">

            <li>6 and under </li>

          </ul>
        </div>
      </div>

    </div>
  </div>

  <div class="col-xs-8 col-sm-9 pricing-span-body">
    

    <div class="pricing-span">
      <div class="widget-box pricing-box-small">
        <div class="widget-header header-color-orange">
          <h5 class="bigger lighter">White/Yel/Orange</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table">

              <li>
                <cfif #g6L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g6L_yellow">Light #g6L_yellow.RecordCount#</a>
                </cfif> |
                <cfif #g6H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g6H_yellow">Heavy #g6H_yellow.RecordCount#</a>
                </cfif>
              </li>

            </ul>


          </div>


        </div>
      </div>
    </div>

    <div class="pricing-span">
      <div class="widget-box pricing-box-small">
        <div class="widget-header header-color-blue">
          <h5 class="bigger lighter">Green/Blue</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table">

              <li>
                <cfif #g6L_blue.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g6L_blue">Light #g6L_blue.RecordCount#</a>
                </cfif> |
                <cfif #g6H_blue.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g6H_blue">Heavy #g6H_blue.RecordCount#</a>
                </cfif>
              </li>

            </ul>

          </div>

        </div>
      </div>
    </div>

    <div class="pricing-span">
      <div class="widget-box pricing-box-small">
        <div class="widget-header header-color-red3">
          <h5 class="bigger lighter">Red/Brown</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table">

              <li>
                <cfif #g6L_red.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g6L_red">Light #g6L_red.RecordCount#</a>
                </cfif> |
                <cfif #g6H_red.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g6H_red">Heavy #g6H_red.RecordCount#</a>
                </cfif>
              </li>

            </ul>

          </div>


        </div>
      </div>
    </div>

    <div class="pricing-span">

      <div class="widget-box pricing-box-small">

        <div class="widget-header header-color-grey">
          <h5 class="bigger lighter">Black</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table">

              <li>
                <cfif #g6L_black.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g6L_black">Light #g6L_black.RecordCount#</a>
                </cfif> |
                <cfif #g6H_black.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g6H_black">Heavy #g6H_black.RecordCount#</a>
                </cfif>
              </li>

            </ul>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!------------------------------->
  <!------------------------------->
  <div class="space-24"></div>
  <!------------------------------->
  <!------------------------------->

    <div class="col-xs-4 col-sm-3 pricing-span-header">
      <div class="widget-box transparent">
        <div class="widget-header">
          <h5 class="bigger lighter">Girls</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table-header">

              <li>7 to 8 </li>
              <li>9 to 10 </li>
              <li>11 to 12 </li>
              <li>13 to 14 </li>
              <li>15 to 16 </li>

            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="col-xs-8 col-sm-9 pricing-span-body">
      

      <div class="pricing-span">
        <div class="widget-box pricing-box-small">
          <div class="widget-header header-color-orange">
            <h5 class="bigger lighter">White/Yel/Orange</h5>
          </div>

          <div class="widget-body">
            <div class="widget-main no-padding">
              <ul class="list-unstyled list-striped pricing-table">

              <li>
                <cfif #g78L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g7-8L_yellow">
                  Light #g78L_yellow.RecordCount#
                </a>
                </cfif> |
                <cfif #g78H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g7-8H_yellow">
                  Heavy #g78H_yellow.RecordCount#
                </a>
                </cfif>
              </li>
              <li>
                <cfif #g910L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g9-10L_yellow">
                  Light #g910L_yellow.RecordCount#
                </a>
                </cfif> |
                <cfif #g910H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g9-10H_yellow">
                  Heavy #g910H_yellow.RecordCount#
                </a>
                </cfif>
              </li>
              <li>
                <cfif #g1112L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g11-12L_yellow">
                  Light #g1112L_yellow.RecordCount#
                </a>
                 </cfif>|
                <cfif #g1112H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g11-12H_yellow">
                  Heavy #g1112H_yellow.RecordCount#
                </a>
                </cfif>
              </li>
              <li>
                <cfif #g1314L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g13-14L_yellow">
                  Light #g1314L_yellow.RecordCount#
                </a>
                </cfif> |
                <cfif #g1314H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g13-14H_yellow">
                  Heavy #g1314H_yellow.RecordCount#
                </a>
                </cfif>
              </li>
              <li>
                <cfif #g1516L_yellow.RecordCount# eq 0>
                  Light 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g15-16L_yellow">
                  Light #g1516L_yellow.RecordCount#
                </a>
                </cfif> |
                <cfif #g1516H_yellow.RecordCount# eq 0>
                  Heavy 0
                <cfelse>
                <a href="game_match.cfm?gid=#getGame.game_id#&code=g15-16H_yellow">
                  Heavy #g1516H_yellow.RecordCount#
                </a>
                </cfif>
              </li>

              </ul>


            </div>


          </div>
        </div>
      </div>

      <div class="pricing-span">
        <div class="widget-box pricing-box-small">
          <div class="widget-header header-color-blue">
            <h5 class="bigger lighter">Green/Blue</h5>
          </div>

          <div class="widget-body">
            <div class="widget-main no-padding">
              <ul class="list-unstyled list-striped pricing-table">
                <li>
                  <cfif #g78L_blue.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g7-8L_blue">Light #g78L_blue.RecordCount#</a>
                  </cfif> |
                  <cfif #g78H_blue.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g7-8H_blue">Heavy #g78H_blue.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g910L_blue.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g9-10L_blue">Light #g910L_blue.RecordCount#</a>
                  </cfif> |
                  <cfif #g910H_blue.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g9-10H_blue">Heavy #g910H_blue.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g1112L_blue.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g11-12L_blue">Light #g1112L_blue.RecordCount#</a>
                   </cfif>|
                  <cfif #g1112H_blue.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g11-12H_blue">Heavy #g1112H_blue.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g1314L_blue.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g13-14L_blue">Light #g1314L_blue.RecordCount#</a>
                  </cfif> |
                  <cfif #g1314H_blue.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g13-14H_blue">Heavy #g1314H_blue.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g1516L_blue.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g15-16L_blue">Light #g1516L_blue.RecordCount#</a>
                  </cfif> |
                  <cfif #g1516H_blue.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g15-16H_blue">Heavy #g1516H_blue.RecordCount#</a>
                  </cfif>
                </li>

              </ul>

            </div>

          </div>
        </div>
      </div>

      <div class="pricing-span">
        <div class="widget-box pricing-box-small">
          <div class="widget-header header-color-red3">
            <h5 class="bigger lighter">Red/Brown</h5>
          </div>

          <div class="widget-body">
            <div class="widget-main no-padding">
              <ul class="list-unstyled list-striped pricing-table">
                <li>
                  <cfif #g78L_red.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g7-8L_red">Light #g78L_red.RecordCount#</a>
                  </cfif> |
                  <cfif #g78H_red.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g7-8H_red">Heavy #g78H_red.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g910L_red.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g9-10L_red">Light #g910L_red.RecordCount#</a>
                  </cfif> |
                  <cfif #g910H_red.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g9-10H_red">Heavy #g910H_red.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g1112L_red.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g11-12L_red">Light #g1112L_red.RecordCount#</a>
                   </cfif>|
                  <cfif #g1112H_red.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g11-12H_red">Heavy #g1112H_red.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g1314L_red.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g13-14L_red">Light #g1314L_red.RecordCount#</a>
                  </cfif> |
                  <cfif #g1314H_red.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g13-14H_red">Heavy #g1314H_red.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g1516L_red.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g15-16L_red">Light #g1516L_red.RecordCount#</a>
                  </cfif> |
                  <cfif #g1516H_red.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g15-16H_red">Heavy #g1516H_red.RecordCount#</a>
                  </cfif>
                </li>

              </ul>

            </div>


          </div>
        </div>
      </div>

      <div class="pricing-span">
        <div class="widget-box pricing-box-small">
          <div class="widget-header header-color-grey">
            <h5 class="bigger lighter">Black</h5>
          </div>

          <div class="widget-body">
            <div class="widget-main no-padding">
              <ul class="list-unstyled list-striped pricing-table">
                <li>
                  <cfif #g78L_black.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g7-8L_black">Light #g78L_black.RecordCount#</a>
                  </cfif> |
                  <cfif #g78H_black.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g7-8H_black">Heavy #g78H_black.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g910L_black.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g9-10L_black">Light #g910L_black.RecordCount#</a>
                  </cfif> |
                  <cfif #g910H_black.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g9-10H_black">Heavy #g910H_black.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g1112L_black.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g11-12L_black">Light #g1112L_black.RecordCount#</a>
                   </cfif>|
                  <cfif #g1112H_black.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g11-12H_black">Heavy #g1112H_black.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g1314L_black.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g13-14L_black">Light #g1314L_black.RecordCount#</a>
                  </cfif> |
                  <cfif #g1314H_black.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g13-14H_black">Heavy #g1314H_black.RecordCount#</a>
                  </cfif>
                </li>
                <li>
                  <cfif #g1516L_black.RecordCount# eq 0>
                    Light 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g15-16L_black">Light #g1516L_black.RecordCount#</a>
                  </cfif> |
                  <cfif #g1516H_black.RecordCount# eq 0>
                    Heavy 0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=g15-16H_black">Heavy #g1516H_black.RecordCount#</a>
                  </cfif>
                </li>
              </ul>


            </div>


          </div>
        </div>
      </div>
    </div>

    <!------------------------------->
    <!------------------------------->
    <div class="space-24"></div>
    <!------------------------------->
    <!------------------------------->

        <div class="col-xs-4 col-sm-3 pricing-span-header">
          <div class="widget-box transparent">
            <div class="widget-header">
              <h5 class="bigger lighter">Boys</h5>
            </div>

            <div class="widget-body">
              <div class="widget-main no-padding">
                <ul class="list-unstyled list-striped pricing-table-header">

                  <li>7 to 8 </li>
                  <li>9 to 10 </li>
                  <li>11 to 12 </li>
                  <li>13 to 14 </li>
                  <li>15 to 16 </li>

                </ul>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xs-8 col-sm-9 pricing-span-body">
          

          <div class="pricing-span">
            <div class="widget-box pricing-box-small">
              <div class="widget-header header-color-orange">
                <h5 class="bigger lighter">White/Yel/Orange</h5>
              </div>

              <div class="widget-body">
                <div class="widget-main no-padding">
                  <ul class="list-unstyled list-striped pricing-table">

                    <li>
                      <cfif #bg78L_yellow.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg7-8L_yellow">Light #bg78L_yellow.RecordCount#</a>
                      </cfif> |
                      <cfif #bg78H_yellow.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg7-8H_yellow">Heavy #bg78H_yellow.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg910L_yellow.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg9-10L_yellow">Light #bg910L_yellow.RecordCount#</a>
                      </cfif> |
                      <cfif #bg910H_yellow.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg9-10H_yellow">Heavy #bg910H_yellow.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1112L_yellow.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg11-12L_yellow">Light #bg1112L_yellow.RecordCount#</a>
                       </cfif>|
                      <cfif #bg1112H_yellow.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg11-12H_yellow">Heavy #bg1112H_yellow.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1314L_yellow.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg13-14L_yellow">Light #bg1314L_yellow.RecordCount#</a>
                      </cfif> |
                      <cfif #bg1314H_yellow.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg13-14H_yellow">Heavy #bg1314H_yellow.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1516L_yellow.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg15-16L_yellow">Light #bg1516L_yellow.RecordCount#</a>
                      </cfif> |
                      <cfif #bg1516H_yellow.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg15-16H_yellow">Heavy #bg1516H_yellow.RecordCount#</a>
                      </cfif>
                    </li>

                  </ul>


                </div>


              </div>
            </div>
          </div>

          <div class="pricing-span">
            <div class="widget-box pricing-box-small">
              <div class="widget-header header-color-blue">
                <h5 class="bigger lighter">Green/Blue</h5>
              </div>

              <div class="widget-body">
                <div class="widget-main no-padding">
                  <ul class="list-unstyled list-striped pricing-table">

                    <li>
                      <cfif #bg78L_blue.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg7-8L_blue">Light #bg78L_blue.RecordCount#</a>
                      </cfif> |
                      <cfif #bg78H_blue.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg7-8H_blue">Heavy #bg78H_blue.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg910L_blue.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg9-10L_blue">Light #bg910L_blue.RecordCount#</a>
                      </cfif> |
                      <cfif #bg910H_blue.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg9-10H_blue">Heavy #bg910H_blue.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1112L_blue.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg11-12L_blue">Light #bg1112L_blue.RecordCount#</a>
                       </cfif>|
                      <cfif #bg1112H_blue.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg11-12H_blue">Heavy #bg1112H_blue.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1314L_blue.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg13-14L_blue">Light #bg1314L_blue.RecordCount#</a>
                      </cfif> |
                      <cfif #bg1314H_blue.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg13-14H_blue">Heavy #bg1314H_blue.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1516L_blue.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg15-16L_blue">Light #bg1516L_blue.RecordCount#</a>
                      </cfif> |
                      <cfif #bg1516H_blue.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg15-16H_blue">Heavy #bg1516H_blue.RecordCount#</a>
                      </cfif>
                    </li>

                  </ul>

                </div>

              </div>
            </div>
          </div>

          <div class="pricing-span">
            <div class="widget-box pricing-box-small">
              <div class="widget-header header-color-red3">
                <h5 class="bigger lighter">Red/Brown</h5>
              </div>

              <div class="widget-body">
                <div class="widget-main no-padding">
                  <ul class="list-unstyled list-striped pricing-table">

                    <li>
                      <cfif #bg78L_red.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg7-8L_red">Light #bg78L_red.RecordCount#</a>
                      </cfif> |
                      <cfif #bg78H_red.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg7-8H_red">Heavy #bg78H_red.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg910L_red.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg9-10L_red">Light #bg910L_red.RecordCount#</a>
                      </cfif> |
                      <cfif #bg910H_red.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg9-10H_red">Heavy #bg910H_red.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1112L_red.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg11-12L_red">Light #bg1112L_red.RecordCount#</a>
                       </cfif>|
                      <cfif #bg1112H_red.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg11-12H_red">Heavy #bg1112H_red.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1314L_red.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg13-14L_red">Light #bg1314L_red.RecordCount#</a>
                      </cfif> |
                      <cfif #bg1314H_red.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg13-14H_red">Heavy #bg1314H_red.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1516L_red.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg15-16L_red">Light #bg1516L_red.RecordCount#</a>
                      </cfif> |
                      <cfif #bg1516H_red.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg15-16H_red">Heavy #bg1516H_red.RecordCount#</a>
                      </cfif>
                    </li>

                  </ul>

                </div>


              </div>
            </div>
          </div>

          <div class="pricing-span">
            <div class="widget-box pricing-box-small">
              <div class="widget-header header-color-grey">
                <h5 class="bigger lighter">Black</h5>
              </div>

              <div class="widget-body">
                <div class="widget-main no-padding">
                  <ul class="list-unstyled list-striped pricing-table">

                    <li>
                      <cfif #bg78L_black.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg7-8L_black">Light #bg78L_black.RecordCount#</a>
                      </cfif> |
                      <cfif #bg78H_black.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg7-8H_black">Heavy #bg78H_black.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg910L_black.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg9-10L_black">Light #bg910L_black.RecordCount#</a>
                      </cfif> |
                      <cfif #bg910H_black.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg9-10H_black">Heavy #bg910H_black.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1112L_black.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg11-12L_black">Light #bg1112L_black.RecordCount#</a>
                       </cfif>|
                      <cfif #bg1112H_black.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg11-12H_black">Heavy #bg1112H_black.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1314L_black.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg13-14L_black">Light #bg1314L_black.RecordCount#</a>
                      </cfif> |
                      <cfif #bg1314H_black.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg13-14H_black">Heavy #bg1314H_black.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #bg1516L_black.RecordCount# eq 0>
                        Light 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg15-16L_black">Light #bg1516L_black.RecordCount#</a>
                      </cfif> |
                      <cfif #bg1516H_black.RecordCount# eq 0>
                        Heavy 0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=bg15-16H_black">Heavy #bg1516H_black.RecordCount#</a>
                      </cfif>
                    </li>

                  </ul>


                </div>


              </div>
            </div>
          </div>
        </div>
        <!------------------------------->
        <!------------------------------->
        <div class="space-24"></div>
        <!------------------------------->
        <!------------------------------->

            <div class="col-xs-4 col-sm-3 pricing-span-header">
              <div class="widget-box transparent">
                <div class="widget-header">
                  <h5 class="bigger lighter">Men & Women 17 & Above</h5>
                </div>

                <div class="widget-body">
                  <div class="widget-main no-padding">
                    <ul class="list-unstyled list-striped pricing-table-header">

                      <li>FIN/FLY</li>
                      <li>BAN/FEA </li>
                      <li>LT/WELT </li>
                      <li>MID/HEAVY</li>


                    </ul>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-xs-8 col-sm-9 pricing-span-body">
              

              <div class="pricing-span">
                <div class="widget-box pricing-box-small">
                  <div class="widget-header header-color-orange">
                    <h5 class="bigger lighter">White/Yel/Orange</h5>
                  </div>

                  <div class="widget-body">
                    <div class="widget-main no-padding">
                      <ul class="list-unstyled list-striped pricing-table">

                        <li>
                          <cfif #g17f_yellow.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17f_yellow">#g17f_yellow.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17b_yellow.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17b_yellow">#g17b_yellow.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17lw_yellow.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17lw_yellow">#g17lw_yellow.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17mh_yellow.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17mh_yellow">#g17mh_yellow.RecordCount# </a>
                          </cfif>
                        </li>
                      </ul>


                    </div>


                  </div>
                </div>
              </div>

              <div class="pricing-span">
                <div class="widget-box pricing-box-small">
                  <div class="widget-header header-color-blue">
                    <h5 class="bigger lighter">Green/Blue</h5>
                  </div>

                  <div class="widget-body">
                    <div class="widget-main no-padding">
                      <ul class="list-unstyled list-striped pricing-table">
                        <li>
                          <cfif #g17f_blue.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17f_blue">#g17f_blue.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17b_blue.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17b_blue">#g17b_blue.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17lw_blue.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17lw_blue">#g17lw_blue.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17mh_blue.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17mh_blue">#g17mh_blue.RecordCount# </a>
                          </cfif>
                        </li>

                      </ul>

                    </div>

                  </div>
                </div>
              </div>

              <div class="pricing-span">
                <div class="widget-box pricing-box-small">
                  <div class="widget-header header-color-red3">
                    <h5 class="bigger lighter">Red/Brown</h5>
                  </div>

                  <div class="widget-body">
                    <div class="widget-main no-padding">
                      <ul class="list-unstyled list-striped pricing-table">
                        <li>
                          <cfif #g17f_red.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17f_red">#g17f_red.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17b_red.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17b_red">#g17b_red.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17lw_red.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17lw_red">#g17lw_red.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17mh_red.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17mh_red">#g17mh_red.RecordCount# </a>
                          </cfif>
                        </li>

                      </ul>

                    </div>


                  </div>
                </div>
              </div>

              <div class="pricing-span">
                <div class="widget-box pricing-box-small">
                  <div class="widget-header header-color-grey">
                    <h5 class="bigger lighter">Black</h5>
                  </div>

                  <div class="widget-body">
                    <div class="widget-main no-padding">
                      <ul class="list-unstyled list-striped pricing-table">
                        <li>
                          <cfif #g17f_black.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17f_black">#g17f_black.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17b_black.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17b_black">#g17b_black.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17lw_black.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17lw_black">#g17lw_black.RecordCount# </a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #g17mh_black.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=g17mh_black">#g17mh_black.RecordCount# </a>
                          </cfif>
                        </li>

                      </ul>


                    </div>


                  </div>
                </div>
              </div>
            </div>

            <!------------------------------->
            <!------------------------------->
            <div class="space-24"></div>
            <!------------------------------->
            <!------------------------------->

                <div class="col-xs-4 col-sm-3 pricing-span-header">
                  <div class="widget-box transparent">
                    <div class="widget-header">
                      <h5 class="bigger lighter">Men & Women 35 & Above</h5>
                    </div>

                    <div class="widget-body">
                      <div class="widget-main no-padding">
                        <ul class="list-unstyled list-striped pricing-table-header">

                          <li>LIGHT </li>
                          <li>HEAVY</li>


                        </ul>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-xs-8 col-sm-9 pricing-span-body">
                  

                  <div class="pricing-span">
                    <div class="widget-box pricing-box-small">
                      <div class="widget-header header-color-orange">
                        <h5 class="bigger lighter">White/Yel/Orange</h5>
                      </div>

                      <div class="widget-body">
                        <div class="widget-main no-padding">
                          <ul class="list-unstyled list-striped pricing-table">

                            <li>
                              <cfif #g35L_yellow.RecordCount# eq 0>
                                0
                              <cfelse>
                              <a href="game_match.cfm?gid=#getGame.game_id#&code=g35L_yellow">#g35L_yellow.RecordCount# </a>
                              </cfif>
                            </li>
                            <li>
                              <cfif #g35H_yellow.RecordCount# eq 0>
                                0
                              <cfelse>
                              <a href="game_match.cfm?gid=#getGame.game_id#&code=g35H_yellow">#g35H_yellow.RecordCount# </a>
                              </cfif>
                            </li>


                          </ul>


                        </div>


                      </div>
                    </div>
                  </div>

                  <div class="pricing-span">
                    <div class="widget-box pricing-box-small">
                      <div class="widget-header header-color-blue">
                        <h5 class="bigger lighter">Green/Blue</h5>
                      </div>

                      <div class="widget-body">
                        <div class="widget-main no-padding">
                          <ul class="list-unstyled list-striped pricing-table">
                            <li>
                              <cfif #g35L_blue.RecordCount# eq 0>
                                0
                              <cfelse>
                              <a href="game_match.cfm?gid=#getGame.game_id#&code=g35L_blue">#g35L_blue.RecordCount# </a>
                              </cfif>
                            </li>
                            <li>
                              <cfif #g35H_blue.RecordCount# eq 0>
                                0
                              <cfelse>
                              <a href="game_match.cfm?gid=#getGame.game_id#&code=g35H_blue">#g35H_blue.RecordCount# </a>
                              </cfif>
                            </li>

                          </ul>

                        </div>

                      </div>
                    </div>
                  </div>

                  <div class="pricing-span">
                    <div class="widget-box pricing-box-small">
                      <div class="widget-header header-color-red3">
                        <h5 class="bigger lighter">Red/Brown</h5>
                      </div>

                      <div class="widget-body">
                        <div class="widget-main no-padding">
                          <ul class="list-unstyled list-striped pricing-table">
                            <li>
                              <cfif #g35L_red.RecordCount# eq 0>
                                0
                              <cfelse>
                              <a href="game_match.cfm?gid=#getGame.game_id#&code=g35L_red">#g35L_red.RecordCount# </a>
                              </cfif>
                            </li>
                            <li>
                              <cfif #g35H_red.RecordCount# eq 0>
                                0
                              <cfelse>
                              <a href="game_match.cfm?gid=#getGame.game_id#&code=g35H_red">#g35H_red.RecordCount# </a>
                              </cfif>
                            </li>


                          </ul>

                        </div>


                      </div>
                    </div>
                  </div>

                  <div class="pricing-span">
                    <div class="widget-box pricing-box-small">
                      <div class="widget-header header-color-grey">
                        <h5 class="bigger lighter">Black</h5>
                      </div>

                      <div class="widget-body">
                        <div class="widget-main no-padding">
                          <ul class="list-unstyled list-striped pricing-table">
                            <li>
                              <cfif #g35L_black.RecordCount# eq 0>
                                0
                              <cfelse>
                              <a href="game_match.cfm?gid=#getGame.game_id#&code=g35L_black">#g35L_black.RecordCount# </a>
                              </cfif>
                            </li>
                            <li>
                              <cfif #g35H_black.RecordCount# eq 0>
                                0
                              <cfelse>
                              <a href="game_match.cfm?gid=#getGame.game_id#&code=g35H_black">#g35H_black.RecordCount# </a>
                              </cfif>
                            </li>


                          </ul>


                        </div>


                      </div>
                    </div>
                  </div>
                </div>
  </div>
  <!------------------------------->
  <!------------------------------->
  <div class="space-24"></div>
  <!------------------------------->
  <!------------------------------->

  <h3 class="header smaller red">Creative forms</h3>

  <div class="row">
    <div class="col-xs-4 col-sm-3 pricing-span-header">
      <div class="widget-box transparent">
        <div class="widget-header">
          <h5 class="bigger lighter">Male/Female</h5>
        </div>

        <div class="widget-body">
          <div class="widget-main no-padding">
            <ul class="list-unstyled list-striped pricing-table-header">

              <li>13 and under </li>
              <li>14 and above </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="col-xs-8 col-sm-9 pricing-span-body">
      

      <div class="pricing-span">
        <div class="widget-box pricing-box-small">
          <div class="widget-header header-color-orange">
            <h5 class="bigger lighter">Begin/Intermed</h5>
          </div>

          <div class="widget-body">
            <div class="widget-main no-padding">
              <ul class="list-unstyled list-striped pricing-table">

                <li>
                  <cfif #cp13_yellow.RecordCount# eq 0>
                    0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=cp13_yellow">
                  #cp13_yellow.RecordCount#
                  </a>
                  </cfif>
                </li>
                <li>
                  <cfif #cp14_yellow.RecordCount# eq 0>
                    0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=cp14_yellow">
                  #cp14_yellow.RecordCount#
                  </a>
                  </cfif>
                </li>
              </ul>


            </div>


          </div>
        </div>
      </div>

      <div class="pricing-span">
        <div class="widget-box pricing-box-small">
          <div class="widget-header header-color-red3">
            <h5 class="bigger lighter">Red/Black</h5>
          </div>

          <div class="widget-body">
            <div class="widget-main no-padding">
              <ul class="list-unstyled list-striped pricing-table">

                <li>
                  <cfif #cp13_red.RecordCount# eq 0>
                    0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=cp13_red">
                  #cp13_red.RecordCount#
                  </a>
                  </cfif>
                </li>
                <li>
                  <cfif #cp14_red.RecordCount# eq 0>
                    0
                  <cfelse>
                  <a href="game_match.cfm?gid=#getGame.game_id#&code=cp14_red">
                  #cp14_red.RecordCount#
                  </a>
                  </cfif>
                </li>
              </ul>

            </div>

          </div>
        </div>
      </div>

    </div>
    </div>

    <!------------------------------->
    <!------------------------------->
    <div class="space-24"></div>
    <!------------------------------->
    <!------------------------------->

      <h3 class="header smaller red">Board Breaking</h3>

      <div class="row">
        <div class="col-xs-4 col-sm-3 pricing-span-header">
          <div class="widget-box transparent">
            <div class="widget-header">
              <h5 class="bigger lighter">Male/Female</h5>
            </div>

            <div class="widget-body">
              <div class="widget-main no-padding">
                <ul class="list-unstyled list-striped pricing-table-header">

                  <li>9 and under </li>
                  <li>10 to 14</li>
                  <li>15 and above</li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xs-8 col-sm-9 pricing-span-body">
          

          <div class="pricing-span">
            <div class="widget-box pricing-box-small">
              <div class="widget-header header-color-orange">
                <h5 class="bigger lighter">Begin./Intermed.</h5>
              </div>

              <div class="widget-body">
                <div class="widget-main no-padding">
                  <ul class="list-unstyled list-striped pricing-table">

                    <li>
                      <cfif #b9_yellow.RecordCount# eq 0>
                        0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=b9_yellow">#b9_yellow.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #b1014_yellow.RecordCount# eq 0>
                        0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=b10-14_yellow">#b1014_yellow.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #b15_yellow.RecordCount# eq 0>
                        0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=b15_yellow">#b15_yellow.RecordCount#</a>
                      </cfif>
                    </li>
                  </ul>


                </div>


              </div>
            </div>
          </div>

          <div class="pricing-span">
            <div class="widget-box pricing-box-small">
              <div class="widget-header header-color-red3">
                <h5 class="bigger lighter">Red/Brown</h5>
              </div>

              <div class="widget-body">
                <div class="widget-main no-padding">
                  <ul class="list-unstyled list-striped pricing-table">

                    <li>
                      <cfif #b9_red.RecordCount# eq 0>
                        0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=b9_red">#b9_red.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #b1014_red.RecordCount# eq 0>
                        0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=b10-14_red">#b1014_red.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #b15_red.RecordCount# eq 0>
                        0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=b15_red">#b15_red.RecordCount#</a>
                      </cfif>
                    </li>
                  </ul>

                </div>

              </div>
            </div>
          </div>
          <div class="pricing-span">
            <div class="widget-box pricing-box-small">
              <div class="widget-header header-color-grey">
                <h5 class="bigger lighter">Black</h5>
              </div>

              <div class="widget-body">
                <div class="widget-main no-padding">
                  <ul class="list-unstyled list-striped pricing-table">
                    <li>
                      <cfif #b9_black.RecordCount# eq 0>
                        0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=b9_black">#b9_black.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #b1014_black.RecordCount# eq 0>
                        0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=b10-14_black">#b1014_black.RecordCount#</a>
                      </cfif>
                    </li>
                    <li>
                      <cfif #b15_black.RecordCount# eq 0>
                        0
                      <cfelse>
                      <a href="game_match.cfm?gid=#getGame.game_id#&code=b15_black">#b15_black.RecordCount#</a>
                      </cfif>
                    </li>

                  </ul>


                </div>


              </div>
            </div>
            </div>
        </div>
        </div>



        <!------------------------------->
        <!------------------------------->
        <div class="space-24"></div>
        <!------------------------------->
        <!------------------------------->

          <h3 class="header smaller red">Weapon</h3>

          <div class="row">
            <div class="col-xs-4 col-sm-3 pricing-span-header">
              <div class="widget-box transparent">
                <div class="widget-header">
                  <h5 class="bigger lighter">Male/Female</h5>
                </div>

                <div class="widget-body">
                  <div class="widget-main no-padding">
                    <ul class="list-unstyled list-striped pricing-table-header">

                      <li>9 and under </li>
                      <li>10 to 14</li>
                      <li>15 and above</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-xs-8 col-sm-9 pricing-span-body">
             

              <div class="pricing-span">
                <div class="widget-box pricing-box-small">
                  <div class="widget-header header-color-orange">
                    <h5 class="bigger lighter">&nbsp;</h5>
                  </div>

                  <div class="widget-body">
                    <div class="widget-main no-padding">
                      <ul class="list-unstyled list-striped pricing-table">

                        <li>
                          <cfif #w9_yellow.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=w9_yellow">#w9_yellow.RecordCount#</a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #w1014_yellow.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=w10-14_yellow">#w1014_yellow.RecordCount#</a>
                          </cfif>
                        </li>
                        <li>
                          <cfif #w15_yellow.RecordCount# eq 0>
                            0
                          <cfelse>
                          <a href="game_match.cfm?gid=#getGame.game_id#&code=w15_yellow">#w15_yellow.RecordCount#</a>
                          </cfif>
                        </li>
                      </ul>


                    </div>


                  </div>
                </div>
              </div>


            </div>
            </div>

</cfoutput>


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



