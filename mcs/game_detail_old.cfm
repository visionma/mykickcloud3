<cfinclude template="header.cfm">
<cfinclude template="sidebar.cfm">
	<!-- inline styles related to this page -->



<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i>
				<a href="#">Home</a>
				<span class="divider"><i class="icon-angle-right arrow-icon"></i></span>
			</li>
			<li class="active">Game Detail Info</li>
		</ul><!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon">
					<input type="text" placeholder="Search ..." 
					class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div>
	<div class="page-content">
		<div class="page-header position-relative">
			<h1>Game Detail</h1>
		</div><!--/.page-header-->

		<div class="row">
			<div class="col-xs-12">
						
<!--PAGE CONTENT BEGINS-->

				

<!--- get game --->
	<cfquery name="getGame" datasource="mykickcloud">
		select *
		from game
		where game_id = '#url.gid#' and school_id = '#url.sid#'
	</cfquery>

	<cfoutput query="getGame">
		
		<cfform name="game_apply" action="game_apply.cfm">

<!--- query to check if the player has already applied for this game --->

		<cfquery name="getPlayer" datasource="mykickcloud">
			select *
			from player
			where game_id = '#getGame.game_id#' and members_id = '#session.user_id#'
		</cfquery>


		<cfif getPlayer.RecordCount GT 0>
			<cfset is_forms = '#getPlayer.is_forms#'>
			<cfset is_sparring = '#getPlayer.is_sparring#'>
			<cfset is_cforms = '#getPlayer.is_cforms#'>
			<cfset is_breaking = '#getPlayer.is_breaking#'>
			<cfset is_weapon = '#getPlayer.is_weapon#'>
		<cfelse>
			<cfset is_forms = "">
			<cfset is_sparring = "">
			<cfset is_cforms = "">
			<cfset is_breaking = "">
			<cfset is_weapon = "">
		</cfif>
		
		<cfquery name="getSchool" datasource="mykickcloud">
			select *
			from school
			where school_id = '#getGame.school_id#'
		</cfquery>
		
		<cfquery datasource="mykickcloud" name="getUser" > 
			select * 
			from members 
			where members_id = '#session.user_id#'
		</cfquery>

		<cfif #getUser.member_gender# eq 'male'>
			<cfset gender_group = '1'>
		<cfelse>
			<cfset gender_group = '2'>
		</cfif>
		
<!--- calculate member age using Birthdate --->
		<cfset memberAge = DateDiff("yyyy", #getUser.birthday#, now())>
			
			
<!--- set belt group --->
<!--- member needs to update their belt info in their profile to show right result--->		
		<cfif #getUser.member_belt# EQ 'white' OR #getUser.member_belt# EQ 'yellow' OR #getUser.member_belt# EQ 'orange'>
			<cfset fp_sg_belt_group = 'yellow'>
			<cfset cf_bb_belt_group = 'yellow'>
		<cfelseif #getUser.member_belt# EQ 'green' OR #getUser.member_belt# EQ 'blue' OR #getUser.member_belt# EQ 'purple'>
			<cfset fp_sg_belt_group = 'blue'>
			<cfset cf_bb_belt_group = 'yellow'>
		<cfelseif #getUser.member_belt# EQ 'red' OR #getUser.member_belt# EQ 'brown'>
			<cfset fp_sg_belt_group = 'red'>
			<cfset cf_bb_belt_group = 'red'>
		<cfelseif #getUser.member_belt# EQ 'black'>
			<cfset fp_sg_belt_group = 'black'>
			<cfset cf_bb_belt_group = 'black'>
		</cfif>
			

		<div class="profile-user-info profile-user-info-striped">
			<div class="profile-info-row">
				<div class="profile-info-name"> Game Title </div>
				<div class="profile-info-value"> <span>#game_title#</span> </div>
			</div>
			<div class="profile-info-row">
				<div class="profile-info-name"> School </div>
				<div class="profile-info-value"> <span>#getSchool.school_name#</span></div>
			</div>

			<div class="profile-info-row">
				<div class="profile-info-name"> Location </div>
				<div class="profile-info-value">
					<i class="icon-map-marker light-orange bigger-110"></i>
					<span>#place_name# : #game_address# #game_city#, #game_state# #game_zip#</span>
				</div>
			</div>

			<div class="profile-info-row">
				<div class="profile-info-name"> Date / Time </div>
				<div class="profile-info-value"> <span>#start_date# ~ #end_date# / #start_time#</span> </div>
			</div>

			<div class="profile-info-row">
				<div class="profile-info-name"> Contact </div>
				<div class="profile-info-value"> <span>#person# | #phone# | #email#</span> </div>
			</div>

			<div class="profile-info-row">
				<div class="profile-info-name"> YOUR INFO </div>
				<div class="profile-info-value">
					<span>Name : <strong>#getUser.firstname# #getUser.lastname#</strong> | 
						  Age : <strong>#memberAge#</strong> | 
						  Gender : <strong>#getUser.member_gender#</strong> | 
						  Belt : <strong>#getUser.member_belt#</strong> | 
						  Weight : <strong>#getUser.member_weight#</strong>lb</span>
					&nbsp;&nbsp;
					<a href="profile_edit.cfm?uid=#getUser.members_id#" class="btn btn-xs btn-success">
						EDIT MY INFO
					</a>
				</div>
			</div>
		</div>
		
<div class="space-20"></div>
		
		
<!---- division start--->

<cfif isDefined("session.is_error")>
	<cfif #session.is_error# EQ 'form_error'>
	
		<div class="alert alert-block alert-danger">
			<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
			<p><strong><i class="icon-bell-alt"></i> ERROR </strong><br>
				You must select at least one division to apply game</p>
		</div>
	</cfif>
</cfif>


<script type="text/javascript">
<!--
    function check_only(chk){
        var obj = document.getElementsByName("chkbox");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }
//-->
</script>

<h3 class="header smaller red">Forms / Poomse </h3>

<!--check if the player has applied already : NEED to be Done -->
<cfif #is_forms# neq "">
	<div class="alert alert-block alert-success">
	<i class="icon-ok"></i>
	Applied
	</div>
<cfelse>

	<cfquery name="getDivGroup" datasource="mykickcloud">
		select *
		from division_age_group
		where game_size = #getGame.game_size# and division_type = 1 and age_group <= #memberAge# and age_group >= #memberAge#
	</cfquery>

<div class="row">
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">
				<h5 class="bigger lighter">Male/Female</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<cfif #memberAge# LTE 5>
							<li>5 and under </li>
						<cfelseif #memberAge# GTE 6 && #memberAge# LTE 7>
							<li>6 to 7 </li>
						<cfelseif #memberAge# GTE 8 && #memberAge# LTE 10>
							<li>8 to 10 </li>
						<cfelseif #memberAge# GTE 11 && #memberAge# LTE 13>
							<li>11 to 13 </li>
						<cfelseif #memberAge# GTE 14 && #memberAge# LTE 16>
							<li>14 to 16 </li>
						<cfelseif #memberAge# GTE 17 && #memberAge# LTE 35>
							<li>17 and Above </li>
						<cfelseif #memberAge# GTE 35>
							<li>35 and Above </li>
						</cfif>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		
		
			
		<cfif #fp_sg_belt_group# EQ 'yellow'>
		
		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-orange">
					<h5 class="bigger lighter">White/Yel/Orange</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# LTE 5>
							<li>
								Light <cfinput name="chkbox" type="checkbox" value="p5L_yellow" onclick="check_only(this)"> |
								Heavy <cfinput name="chkbox" type="checkbox" value="p5H_yellow" onclick="check_only(this)">
							</li>
							<cfelseif #memberAge# GTE 6 && #memberAge# LTE 7>
							<li> 
								Light <cfinput name="chkbox" type="checkbox" value="p6-7L_yellow" onclick="check_only(this)"> |
								Heavy <cfinput name="chkbox" type="checkbox" value="p6-7H_yellow" onclick="check_only(this)">
							</li>
							<cfelseif #memberAge# GTE 8 && #memberAge# LTE 10>
							<li> 
								Light <cfinput name="chkbox" type="checkbox" value="p8-10L_yellow" onclick="check_only(this)"> |
								Heavy <cfinput name="chkbox" type="checkbox" value="p8-10H_yellow" onclick="check_only(this)">
							</li>
							<cfelseif #memberAge# GTE 11 && #memberAge# LTE 13>
							<li> 
								Light <cfinput name="chkbox" type="checkbox" value="p11-13L_yellow" onclick="check_only(this)"> |
								Heavy <cfinput name="chkbox" type="checkbox" value="p11-13H_yellow" onclick="check_only(this)">
							</li>
							<cfelseif #memberAge# GTE 14 && #memberAge# LTE 16>
							<li>
								Light <cfinput name="chkbox" type="checkbox" value="p14-16L_yellow" onclick="check_only(this)"> |
								Heavy <cfinput name="chkbox" type="checkbox" value="p14-16H_yellow" onclick="check_only(this)">
							</li>
							<cfelseif #memberAge# GTE 17 && #memberAge# LTE 35>
							<li>
								Light <cfinput name="chkbox" type="checkbox" value="p17L_yellow" onclick="check_only(this)"> |
								Heavy <cfinput name="chkbox" type="checkbox" value="p17H_yellow" onclick="check_only(this)">
							</li>
							<cfelseif #memberAge# GTE 35>
							<li>
								Light <cfinput name="chkbox" type="checkbox" value="p35L_yellow" onclick="check_only(this)"> |
								Heavy <cfinput name="chkbox" type="checkbox" value="p35H_yellow" onclick="check_only(this)">
							</li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		</cfif>
		<cfif #fp_sg_belt_group# EQ 'blue'>
		
		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-blue">
					<h5 class="bigger lighter">Green/Blue</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# LTE 5>
							<li> 
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p5L_blue" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p5H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 6 && #memberAge# LTE 7>
							<li> 
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p6-7L_blue" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p6-7H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 8 && #memberAge# LTE 10>
							<li> 
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p8-10L_blue" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p9-10H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 11 && #memberAge# LTE 13>
							<li> 
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p11-13L_blue" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p11-13H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 14 && #memberAge# LTE 16>
							<li>
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p14-16L_blue" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p14-16H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 17 && #memberAge# LTE 35>
							<li>
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p17L_blue" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p17H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 35>
							<li>
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p35L_blue" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p35H_blue" type="checkbox">
							</li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		</cfif>
		<cfif #fp_sg_belt_group# EQ 'red'>
		
		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-red3">
					<h5 class="bigger lighter">Red/Brown</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# LTE 5>
							<li> 
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p5L_red" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p5H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 6 && #memberAge# LTE 7>
							<li> 
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p6-7L_red" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p6-7H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 8 && #memberAge# LTE 10>
							<li> 
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p8-10L_red" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p9-10H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 11 && #memberAge# LTE 13>
							<li> 
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p11-13L_red" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p11-13H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 14 && #memberAge# LTE 16>
							<li>
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p14-16L_red" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p14-16H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 17 && #memberAge# LTE 35>
							<li>
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p17L_red" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p17H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 35>
							<li>
								Light <cfinput name="chkbox" onclick="check_only(this)" value="p35L_red" type="checkbox"> |
								Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p35H_red" type="checkbox">
							</li>
						</cfif>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	</cfif>
	<cfif #fp_sg_belt_group# EQ 'black'>
	
	<div class="pricing-span">
		<div class="widget-box pricing-box-small">
			<div class="widget-header header-color-grey">
				<h5 class="bigger lighter">Black</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table">
						<cfif #memberAge# LTE 5>
						<li> 
							Light <cfinput name="chkbox" onclick="check_only(this)" value="p5L_black" type="checkbox"> |
							Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p5H_black" type="checkbox">
						</li>
						<cfelseif #memberAge# GTE 6 && #memberAge# LTE 7>
						<li> 
							Light <cfinput name="chkbox" onclick="check_only(this)" value="p6-7L_black" type="checkbox"> |
							Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p6-7H_black" type="checkbox">
						</li>
						<cfelseif #memberAge# GTE 8 && #memberAge# LTE 10>
						<li> 
							Light <cfinput name="chkbox" onclick="check_only(this)" value="p8-10L_black" type="checkbox"> |
							Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p9-10H_black" type="checkbox">
						</li>
						<cfelseif #memberAge# GTE 11 && #memberAge# LTE 13>
						<li> 
							Light <cfinput name="chkbox" onclick="check_only(this)" value="p11-13L_black" type="checkbox"> |
							Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p11-13H_black" type="checkbox">
						</li>
						<cfelseif #memberAge# GTE 14 && #memberAge# LTE 16>
						<li>
							Light <cfinput name="chkbox" onclick="check_only(this)" value="p14-16L_black" type="checkbox"> |
							Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p14-16H_black" type="checkbox">
						</li>
						<cfelseif #memberAge# GTE 17 && #memberAge# LTE 35>
						<li>
							Light <cfinput name="chkbox" onclick="check_only(this)" value="p17L_black" type="checkbox"> |
							Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p17H_black" type="checkbox">
						</li>
						<cfelseif #memberAge# GTE 35>
						<li>
							Light <cfinput name="chkbox" onclick="check_only(this)" value="p35L_black" type="checkbox"> |
							Heavy <cfinput name="chkbox" onclick="check_only(this)" value="p35H_black" type="checkbox">
						</li>
						</cfif>
					</ul>
					
				</div>
			</div>
		</div>
	</div>
	
	</cfif>
	
</div>
</div>
</cfif>
	
<!------------------------------->
<!------------------------------->
<div class="space-24"></div>
<!------------------------------->
<!------------------------------->


	<script type="text/javascript">
	<!--
	    function check_sg(sg){
	        var obj = document.getElementsByName("sgbox");
	        for(var i=0; i<obj.length; i++){
	            if(obj[i] != sg){
	                obj[i].checked = false;
	            }
	        }
	    }
	//-->
	</script>


<h3 class="header smaller red">Sparring / Gyroogi </h3> 	

<cfif #is_sparring# neq "">
	<div class="alert alert-block alert-success">
	<i class="icon-ok"></i>
	Applied
	</div>
<cfelse>

<div class="row">
		
	<cfif #memberAge# LTE 6>
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
					<div class="widget-header header-color-green">
						<h5 class="bigger lighter">Division</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<ul class="list-unstyled list-striped pricing-table">
								<li> G6 </li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		
<cfif #fp_sg_belt_group# EQ 'yellow'>
	
			<div class="pricing-span">
				<div class="widget-box pricing-box-small">
					<div class="widget-header header-color-orange">
						<h5 class="bigger lighter">White/Yel/Orange</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<ul class="list-unstyled list-striped pricing-table">
								<li>
									Light <cfinput name="sgbox" onclick="check_sg(this)" value="g6L_yellow" type="checkbox"> |
									Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g6H_yellow" type="checkbox">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
</cfif>
<cfif #fp_sg_belt_group# EQ 'blue'>

			<div class="pricing-span">
				<div class="widget-box pricing-box-small">
					<div class="widget-header header-color-blue">
						<h5 class="bigger lighter">Green/Blue</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<ul class="list-unstyled list-striped pricing-table">
								<li>
									Light <cfinput name="sgbox" onclick="check_sg(this)" value="g6L_blue" type="checkbox"> |
									Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g6H_blue" type="checkbox">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
</cfif>
<cfif #fp_sg_belt_group# EQ 'red'>
	
			<div class="pricing-span">
				<div class="widget-box pricing-box-small">
					<div class="widget-header header-color-red3">
						<h5 class="bigger lighter">Red/Brown</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<ul class="list-unstyled list-striped pricing-table">
								<li>
									Light <cfinput name="sgbox" onclick="check_sg(this)" value="g6L_red" type="checkbox"> |
									Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g6H_red" type="checkbox">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
</cfif>
<cfif #fp_sg_belt_group# EQ 'black'>
	
			<div class="pricing-span">

				<div class="widget-box pricing-box-small">

					<div class="widget-header header-color-grey">
						<h5 class="bigger lighter">Black</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<ul class="list-unstyled list-striped pricing-table">
								<li>
									Light <cfinput name="sgbox" onclick="check_sg(this)" value="g6L_black" type="checkbox"> |
									Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g6H_black" type="checkbox">
								</li>
							</ul>
							
						</div>
					</div>
				</div>
			</div>
</cfif>
		</div>

<!------------------------------->
<!------------------------------->
<div class="space-24"></div>
<!------------------------------->
<!------------------------------->
		
</cfif>
	
<cfif #getUser.member_gender# EQ 'female' && #memberAge# LTE 16>
	
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">
				<h5 class="bigger lighter">Girls</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<cfif #memberAge# GTE 5 && #memberAge# LTE 8>
							<li>7 to 8 </li>
						<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
							<li>9 to 10 </li>
						<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
							<li>11 to 12 </li>
						<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
							<li>13 to 14 </li>
						<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
							<li>15 to 16 </li>
						</cfif>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		

<cfif #fp_sg_belt_group# EQ 'yellow'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-orange">
					<h5 class="bigger lighter">White/Yel/Orange</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# GTE 7 && #memberAge# LTE 8>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g7-8L_yellow" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g7-8H_yellow" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g9-10L_yellow" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g9-10H_yellow" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g11-12L_yellow" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g11-12H_yellow" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g13-14L_yellow" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g13-14H_yellow" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
							<li>
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g15-16L_yellow" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g15-16H_yellow" type="checkbox">
							</li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'blue'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-blue">
					<h5 class="bigger lighter">Green/Blue</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# GTE 7 && #memberAge# LTE 8>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g7-8L_blue" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g7-8H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g9-10L_blue" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g9-10H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g11-12L_blue" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g11-12H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g13-14L_blue" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g13-14H_blue" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
							<li>
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g15-16L_blue" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g14-16H_blue" type="checkbox">
							</li>
							</cfif>
						</ul>

					</div>
				</div>
			</div>
		</div>
		
</cfif>
<cfif #fp_sg_belt_group# EQ 'red'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-red3">
					<h5 class="bigger lighter">Red/Brown</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# GTE 7 && #memberAge# LTE 8>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g7-8L_red" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g7-8H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g9-10L_red" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g9-10H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g11-12L_red" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g11-12H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g13-14L_red" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g13-14H_red" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
							<li>
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g15-16L_red" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g14-16H_red" type="checkbox">
							</li>
							</cfif>
						</ul>

					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'black'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-grey">
					<h5 class="bigger lighter">Black</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# GTE 7 && #memberAge# LTE 8>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g7-8L_black" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g7-8H_black" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g9-10L_black" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g9-10H_black" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g11-12L_black" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g11-12H_black" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
							<li> 
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g13-14L_black" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g13-14H_black" type="checkbox">
							</li>
							<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
							<li>
							Light <cfinput name="sgbox" onclick="check_sg(this)" value="g15-16L_black" type="checkbox"> |
							Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="g14-16H_black" type="checkbox">
							</li>
							</cfif>
						</ul>

					</div>
				</div>
			</div>
		</div>
</cfif>		
	</div>

<!------------------------------->
<!------------------------------->
<div class="space-24"></div>
<!------------------------------->
<!------------------------------->

	</cfif>	

	<cfif #getUser.member_gender# EQ 'male' && #memberAge# GTE 7 && #memberAge# LTE 16>
		
		<div class="col-xs-4 col-sm-3 pricing-span-header">
			<div class="widget-box transparent">
				<div class="widget-header">
					<h5 class="bigger lighter">Boys</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table-header">
							<cfif #memberAge# GTE 7 && #memberAge# LTE 8>
							<li>7 to 8 </li>
							<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
							<li>9 to 10 </li>
							<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
							<li>11 to 12 </li>
							<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
							<li>13 to 14 </li>
							<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
							<li>15 to 16 </li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xs-8 col-sm-9 pricing-span-body">
			

<cfif #fp_sg_belt_group# EQ 'yellow'>

			<div class="pricing-span">
				<div class="widget-box pricing-box-small">
					<div class="widget-header header-color-orange">
						<h5 class="bigger lighter">White/Yel/Orange</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<ul class="list-unstyled list-striped pricing-table">
								<cfif #memberAge# GTE 7 && #memberAge# LTE 8>
								<li>
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg7-8L_yellow" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg7-8H_yellow" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg9-10L_yellow" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg9-10H_yellow" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg11-12L_yellow" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg11-12H_yellow" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg13-14L_yellow" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg13-14H_yellow" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
								<li>
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg15-16L_yellow" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg14-16H_yellow" type="checkbox">
								</li>
								</cfif>
							</ul>
						</div>
					</div>
				</div>
			</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'blue'>

			<div class="pricing-span">
				<div class="widget-box pricing-box-small">
					<div class="widget-header header-color-blue">
						<h5 class="bigger lighter">Green/Blue</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<ul class="list-unstyled list-striped pricing-table">
								<cfif #memberAge# GTE 7 && #memberAge# LTE 8>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg7-8L_blue" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg7-8H_blue" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg9-10L_blue" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg9-10H_blue" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg11-12L_blue" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg11-12H_blue" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg13-14L_blue" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg13-14H_blue" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
								<li>
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg15-16L_blue" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg14-16H_blue" type="checkbox">
								</li>
								</cfif>
							</ul>
						</div>
					</div>
				</div>
			</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'red'>

			<div class="pricing-span">
				<div class="widget-box pricing-box-small">
					<div class="widget-header header-color-red3">
						<h5 class="bigger lighter">Red/Brown</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<ul class="list-unstyled list-striped pricing-table">
								<cfif #memberAge# GTE 7 && #memberAge# LTE 8>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg7-8L_red" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg7-8H_red" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg9-10L_red" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg9-10H_red" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg11-12L_red" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg11-12H_red" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg13-14L_red" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg13-14H_red" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
								<li>
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg15-16L_red" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg14-16H_red" type="checkbox">
								</li>
								</cfif>
							</ul>
						</div>
					</div>
				</div>
			</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'black'>

			<div class="pricing-span">
				<div class="widget-box pricing-box-small">
					<div class="widget-header header-color-grey">
						<h5 class="bigger lighter">Black</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main no-padding">
							<ul class="list-unstyled list-striped pricing-table">
								<cfif #memberAge# GTE 7 && #memberAge# LTE 8>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg7-8L_black" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg7-8H_black" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 9 && #memberAge# LTE 10>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg9-10L_black" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg9-10H_black" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 11 && #memberAge# LTE 12>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg11-12L_black" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg11-12H_black" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 13 && #memberAge# LTE 14>
								<li> 
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg13-14L_black" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg13-14H_black" type="checkbox">
								</li>
								<cfelseif #memberAge# GTE 15 && #memberAge# LTE 16>
								<li>
								Light <cfinput name="sgbox" onclick="check_sg(this)" value="bg15-16L_black" type="checkbox"> |
								Heavy <cfinput name="sgbox" onclick="check_sg(this)" value="bg14-16H_black" type="checkbox">
								</li>
								</cfif>
							</ul>
							
						</div>
					</div>
				</div>
			</div>
</cfif>
		</div>
<!------------------------------->
<!------------------------------->
<div class="space-24"></div>
<!------------------------------->
<!------------------------------->
					
	</cfif>	
			
	<cfif #memberAge# GTE 17 && #memberAge# LTE 34>	
		
		
<cfif #getUser.member_gender# EQ 'male' && #getUser.member_weight# LTE '129.9'>
	<cfset game_weight = 'FINFLY'>
<cfelseif #getUser.member_gender# EQ 'female' && #getUser.member_weight# LTE '108'>
	<cfset game_weight = 'FINFLY'>
<cfelseif #getUser.member_gender# EQ 'male' && #getUser.member_weight# GTE '128' && #getUser.member_weight# LTE '149.9'>
	<cfset game_weight = 'BANFEA'>
<cfelseif #getUser.member_gender# EQ 'female' && #getUser.member_weight# GTE '109' && #getUser.member_weight# LTE '125.7'>
	<cfset game_weight = 'BANFEA'>
<cfelseif #getUser.member_gender# EQ 'male' && #getUser.member_weight# GTE '150' && #getUser.member_weight# LTE '176.4'>
	<cfset game_weight = 'LTWELT'>
<cfelseif #getUser.member_gender# EQ 'female' && #getUser.member_weight# GTE '125.8' && #getUser.member_weight# LTE '147.7'>
	<cfset game_weight = 'LTWELT'>
<cfelseif #getUser.member_gender# EQ 'male' && #getUser.member_weight# GTE '176.5'>
	<cfset game_weight = 'MIDHEAVY'>
<cfelseif #getUser.member_gender# EQ 'female' && #getUser.member_weight# GTE '147.8'>
	<cfset game_weight = 'MIDHEAVY'>
</cfif>		

	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">
				<h5 class="bigger lighter">Men & Women 17 & Above</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<cfif #game_weight# EQ 'FINFLY'>
						<li>FIN/FLY </li>
						<cfelseif #game_weight# EQ 'BANFEA'>
						<li>BAN/FEA </li>
						<cfelseif #game_weight# EQ 'LTWELT'>
						<li>LT/WELT </li>
						<cfelseif #game_weight# EQ 'MIDHEAVY'>
						<li>MID/HEAVY </li>
						</cfif>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		

<cfif #fp_sg_belt_group# EQ 'yellow'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-orange">
					<h5 class="bigger lighter">White/Yel/Orange</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #game_weight# EQ 'FINFLY'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17f_yellow" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'BANFEA'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17b_yellow" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'LTWELT'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17lw_yellow" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'MIDHEAVY'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17mh_yellow" type="checkbox"></li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'blue'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-blue">
					<h5 class="bigger lighter">Green/Blue</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #game_weight# EQ 'FINFLY'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17f_blue" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'BANFEA'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17b_blue" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'LTWELT'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17lw_blue" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'MIDHEAVY'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17mh_blue" type="checkbox"></li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'red'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-red3">
					<h5 class="bigger lighter">Red/Brown</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #game_weight# EQ 'FINFLY'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17f_red" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'BANFEA'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17b_red" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'LTWELT'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17lw_red" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'MIDHEAVY'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17mh_red" type="checkbox"></li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'black'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-grey">
					<h5 class="bigger lighter">Black</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #game_weight# EQ 'FINFLY'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17f_black" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'BANFEA'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17b_black" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'LTWELT'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17lw_black" type="checkbox"></li>
							<cfelseif #game_weight# EQ 'MIDHEAVY'>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g17mh_black" type="checkbox"></li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>
</cfif>
	</div>

							
<!------------------------------->
<!------------------------------->
<div class="space-24"></div>
<!------------------------------->
<!------------------------------->
</cfif>		

			
<cfif #memberAge# GTE 35>

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
		

<cfif #fp_sg_belt_group# EQ 'yellow'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-orange">
					<h5 class="bigger lighter">White/Yel/Orange</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">

							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g35L_yellow" type="checkbox"></li>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g35H_yellow" type="checkbox"></li>

						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'blue'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-blue">
					<h5 class="bigger lighter">Green/Blue</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g35L_blue" type="checkbox"></li>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g35H_blue" type="checkbox"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'red'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-red3">
					<h5 class="bigger lighter">Red/Brown</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g35L_red" type="checkbox"></li>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g35H_red" type="checkbox"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #fp_sg_belt_group# EQ 'black'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-grey">
					<h5 class="bigger lighter">Black</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g35L_black" type="checkbox"></li>
							<li><cfinput name="sgbox" onclick="check_sg(this)" value="g35H_black" type="checkbox"></li>
						</ul>
						
					</div>
				</div>
			</div>
		</div>
</cfif>

	</div>
	
	
	</cfif>
</div>
</cfif>
	
<!------------------------------->
<!------------------------------->
<div class="space-24"></div>
<!------------------------------->
<!------------------------------->
	
	
		
<script type="text/javascript">
<!--
    function check_cf(cf){
        var obj = document.getElementsByName("cfbox");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != cf){
                obj[i].checked = false;
            }
        }
    }
//-->
</script>
		

<h3 class="header smaller red">Creative forms </h3>

<cfif #is_cforms# neq "">
	<div class="alert alert-block alert-success">
	<i class="icon-ok"></i>
	Applied
	</div>
<cfelse>

<div class="row">
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">
				<h5 class="bigger lighter">Male/Female</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<cfif #memberAge# LTE 13>
						<li>13 and under </li>
						<cfelseif #memberAge# GTE 14>
						<li>14 and above </li>
						</cfif>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		

<cfif #cf_bb_belt_group# EQ 'yellow'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-orange">
					<h5 class="bigger lighter">Begin/Intermed</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# LTE 13>
							<li><cfinput name="cfbox" onclick="check_cf(this)" value="cp13_yellow" type="checkbox"></li>
							<cfelseif #memberAge# GTE 14>
							<li> <cfinput name="cfbox" onclick="check_cf(this)" value="cp14_yellow" type="checkbox"></li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #cf_bb_belt_group# EQ 'red'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-red3">
					<h5 class="bigger lighter">Red/Black</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# LTE 13>
							<li><cfinput name="cfbox" onclick="check_cf(this)" value="cp13_red" type="checkbox"></li>
							<cfelseif #memberAge# GTE 14>
							<li><cfinput name="cfbox" onclick="check_cf(this)" value="cp14_red" type="checkbox"></li>
							</cfif>
						</ul>
						
					</div>
				</div>
			</div>
		</div>
</cfif>

	</div>
</div>
</cfif>

<!------------------------------->
<!------------------------------->
<div class="space-24"></div>
<!------------------------------->
<!------------------------------->
			
<script type="text/javascript">
<!--
    function check_bb(bb){
        var obj = document.getElementsByName("bbbox");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != bb){
                obj[i].checked = false;
            }
        }
    }
//-->
</script>

<h3 class="header smaller red">Board Breaking </h3>

<cfif #is_breaking# neq "">
	<div class="alert alert-block alert-success">
	<i class="icon-ok"></i>
	Applied
	</div>
<cfelse>

<div class="row">
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">
				<h5 class="bigger lighter">Male/Female</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<cfif #memberAge# LTE 9>
						<li>9 and under </li>
						<cfelseif #memberAge# GTE 10 && #memberAge# LTE 14>
						<li>10 to 14</li>
						<cfelseif #memberAge# GTE 15>
						<li>15 and above</li>
						</cfif>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		

<cfif #cf_bb_belt_group# EQ 'yellow'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-orange">
					<h5 class="bigger lighter">Begin./Intermed.</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# LTE 9>
							<li><cfinput name="bbbox" onclick="check_bb(this)" value="b9_yellow" type="checkbox"></li>
							<cfelseif #memberAge# GTE 10 && #memberAge# LTE 14>
							<li><cfinput name="bbbox" onclick="check_bb(this)" value="b10-14_yellow" type="checkbox"></li>
							<cfelseif #memberAge# GTE 15>
							<li><cfinput name="bbbox" onclick="check_bb(this)" value="b15_yellow" type="checkbox"></li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #cf_bb_belt_group# EQ 'red'>

		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-red3">
					<h5 class="bigger lighter">Red/Brown</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# LTE 9>
							<li><cfinput name="bbbox" onclick="check_bb(this)" value="b9_red" type="checkbox"></li>
							<cfelseif #memberAge# GTE 10 && #memberAge# LTE 14>
							<li><cfinput name="bbbox" onclick="check_bb(this)" value="b10-14_red" type="checkbox"></li>
							<cfelseif #memberAge# GTE 15>
							<li><cfinput name="bbbox" onclick="check_bb(this)" value="b15_red" type="checkbox"></li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>

</cfif>
<cfif #cf_bb_belt_group# EQ 'black'>
						
		<div class="pricing-span">
			<div class="widget-box pricing-box-small">
				<div class="widget-header header-color-grey">
					<h5 class="bigger lighter">Black</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<ul class="list-unstyled list-striped pricing-table">
							<cfif #memberAge# LTE 9>
							<li><cfinput name="bbbox" onclick="check_bb(this)" value="b9_black" type="checkbox"></li>
							<cfelseif #memberAge# GTE 10 && #memberAge# LTE 14>
							<li><cfinput name="bbbox" onclick="check_bb(this)" value="b10-14_black" type="checkbox"></li>
							<cfelseif #memberAge# GTE 15>
							<li><cfinput name="bbbox" onclick="check_bb(this)" value="b15_black" type="checkbox"></li>
							</cfif>
						</ul>
						
					</div>
				</div>
			</div>
		</div>
</cfif>

	</div>
</div>

</cfif>

<!------------------------------->
<!------------------------------->
<div class="space-24"></div>
<!------------------------------->
<!------------------------------->
					
<script type="text/javascript">
<!--
    function check_w(wp){
        var obj = document.getElementsByName("wpbox");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != wp){
                obj[i].checked = false;
            }
        }
    }
//-->
</script>
					

<h3 class="header smaller red">Weapon </h3>

<cfif #is_weapon# neq "">
	<div class="alert alert-block alert-success">
	<i class="icon-ok"></i>
	Applied
	</div>
<cfelse>

<div class="row">
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">
				<h5 class="bigger lighter">Male/Female</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<cfif #memberAge# LTE 9>
						<li>9 and under </li>
						<cfelseif #memberAge# GTE 10 && #memberAge# LTE 14>
						<li>10 to 14</li>
						<cfelseif #memberAge# GTE 15>
						<li>15 and above</li>
						</cfif>
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
							<cfif #memberAge# LTE 9>
							<li><cfinput name="wpbox" onclick="check_wp(this)" value="w9_yellow" type="checkbox"></li>
							<cfelseif #memberAge# GTE 10 && #memberAge# LTE 14>
							<li><cfinput name="wpbox" onclick="check_wp(this)" value="w10-14_yellow" type="checkbox"></li>
							<cfelseif #memberAge# GTE 15>
							<li><cfinput name="wpbox" onclick="check_wp(this)" value="w15_yellow" type="checkbox"></li>
							</cfif>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</cfif>
		<!------------------------------->
		<!------------------------------->
		<div class="space-24"></div>
		<!------------------------------->
		<!------------------------------->
<cfif #is_forms# neq "" OR #is_sparring# neq "" OR #is_cforms# neq "" OR #is_breaking# neq "" OR #is_weapon# neq "">
	&nbsp;
<cfelse>
		
<div class="row" align="center">
	
	<cfif getPlayer.RecordCount GT 0>
	<cfinput type="hidden" name="player_id" value="#getPlayer.player_id#">
	</cfif>
	<cfinput type="hidden" name="gid" value="#url.gid#">
	<cfinput type="hidden" name="sid" value="#url.sid#">
	
		
	<button class="btn btn-info" type="submit">
		<i class="icon-ok bigger-110"></i>
		Apply Game
	</button>
	&nbsp; &nbsp; &nbsp;
	<button class="btn" type="reset">
		<i class="icon-undo bigger-110"></i>
		Reset
	</button>
</div>

	
</cfif>


</cfform>

</cfoutput>









<!--PAGE CONTENT ENDS-->


						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->

			</div><!--/.main-content-->
		
		
		
	
		

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		<!--basic scripts-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

	<script type="text/javascript">
		if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>

			<!-- page specific plugin scripts -->

			<!--[if lte IE 8]>
			  <script src="assets/js/excanvas.min.js"></script>
			<![endif]-->

			<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
			<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
			<script src="assets/js/bootbox.min.js"></script>
			<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
			<script src="assets/js/jquery.gritter.min.js"></script>
			<script src="assets/js/spin.min.js"></script>

			<!-- ace scripts -->

			<script src="assets/js/ace-elements.min.js"></script>
			<script src="assets/js/ace.min.js"></script>

			<!-- inline scripts related to this page -->

			
		</body>
	</html>
		