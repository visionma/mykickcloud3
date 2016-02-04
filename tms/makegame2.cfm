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

          <div class="nav-search" id="nav-search">
            <form class="form-search">
              <span class="input-icon">
                <input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
                <i class="icon-search nav-search-icon"></i>
              </span>
            </form>
          </div>
        </div>
          <div class="page-content">
          <div class="page-header position-relative">
            <h1>
              Dashboard
              <small>
                <i class="icon-double-angle-right"></i>
                manage game
                <i class="icon-double-angle-right"></i>
                create game
              </small>
            </h1>
          </div>

          <div class="row-fluid">
            <div class="span12">
              <!--- PAGE CONTENT BEGINS --->

<cfif isDefined("session.school_id")>

<cfif NOT isDefined("form.is_active")>
<cfset form.is_active = "off">
</cfif>

<cfquery datasource="mykickcloud" name="CheckGame" >
  select *
  from game
  where school_id = '#session.school_ID#'
      and start_date = '#form.start_date#'
</cfquery>

<cfif CheckGame.RecordCount EQ 1>

  <cflocation url="makegame.cfm">
  <cfelse>

  <cfquery datasource="mykickcloud" name="addgame">
    insert into game(school_id,
            is_active,
            game_title,
            game_size,
            ring_size,

            start_date,
            end_date,
            start_time,
            is_fp,
            is_sg,
            is_cf,
            is_bb,
            is_w,

            1_price,
            2_price,
            3_price,
            4_price,
            5_price,
            coach_price,
            place_name,
            game_address,
            game_city,
            game_state,
            game_zip,
            phone,
            email,
            person)
    values ('#session.school_id#',
        '#form.is_active#',
        '#form.game_title#',
        '#form.game_size#',
        '#form.ring_size#',

        '#form.start_date#',
        '#form.end_date#',
        '#form.start_time#',
        '#form.is_fp#',
        '#form.is_sg#',
        '#form.is_cf#',
        '#form.is_bb#',
        '#form.is_w#',

        '#form.1_price#',
        '#form.2_price#',
        '#form.3_price#',
        '#form.4_price#',
        '#form.5_price#',
        '#form.coach_price#',
        '#form.place_name#',
        '#form.game_address#',
        '#form.game_city#',
        '#form.game_state#',
        '#form.game_zip#',
        '#form.phone#',
        '#form.email#',
        '#form.person#')
  </cfquery>

  <cfquery datasource="mykickcloud" name="getSchool" >
  select * from school where school_id = '#session.school_id#'
</cfquery>

<cfquery datasource="mykickcloud"name="getGame">
  select * from game where school_id = '#session.school_id#'
</cfquery>

  <cfoutput>#getSchool.school_name#'s new game [#form.game_title#] has added </cfoutput>
</cfif>

  <cfelse>
  Session Time out
</cfif>





<!--- PAGE CONTENT ENDS --->
            </div>
          </div>
        </div>

</div>


<cfinclude template="footer.cfm" >