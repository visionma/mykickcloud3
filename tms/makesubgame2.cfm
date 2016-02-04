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
<option value="Form">Form</option>
		<option value="Sparing">Sparing</option>
		<option value="Breaking">Breaking</option>
		<option value="Group_Form">Group Form</option>
		<option value="Group_Breaking">Group Breaking</option>

<cfif '#form.game_type#' eq 'Form'>
	<cfset game_type_id = '1'>
<cfelseif '#form.game_type#' eq 'Sparing'>
	<cfset game_type_id = '2'>	
<cfelseif '#form.game_type#' eq 'Breaking'>
	<cfset game_type_id = '3'>
<cfelseif '#form.game_type#' eq 'Group_Form'>
	<cfset game_type_id = '4'>
<cfelse>
	<cfset game_type_id = '5'>
</cfif>	
		
		
	<cfquery datasource="mykickcloud" name="addsubgame">
		insert into sub_game(school_id, 
							game_id, 
							is_active,   
							start_time, 
							game_type, 
							game_gender, 
							game_weight, 
							game_belt,
							game_age,
							game_ring,
							game_type_id)
		values ('#form.sid#', 
				'#form.gid#',
				'#form.is_active#',  
				'#form.start_time#',
				'#form.game_type#', 
				'#form.gender#',
				'#form.weight#', 
				'#form.game_belt#',
				'#form.game_age#',
				'#form.game_ring#',
				'#game_type_id#')
	</cfquery>
	
	<cfquery datasource="mykickcloud" name="getSchool" >
	select * 
	from school 
	where school_id = '#session.school_id#'
	</cfquery>

	<cfquery datasource="mykickcloud"name="getGame">
		select * 
		from game 
		where school_id = '#session.school_id#' and game_id ='#form.gid#'
	</cfquery>
	
	<cfoutput>#getSchool.school_name# | #getGame.game_title#'s new subgame has added </cfoutput>
	
	<cfelse>
	Session Time out
</cfif>


<!--- PAGE CONTENT ENDS --->
						</div>
					</div>
				</div>

</div>

		
<cfinclude template="footer.cfm" >