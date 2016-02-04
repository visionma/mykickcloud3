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

		<cfquery name="checkForm" datasource="mykickcloud">
			select *
			from player
			where game_id = '#getGame.game_id#' and members_id = '#session.user_id#' and division_type = 1
		</cfquery>

		<cfquery name="checkSparring" datasource="mykickcloud">
			select *
			from player
			where game_id = '#getGame.game_id#' and members_id = '#session.user_id#' and division_type = 2
		</cfquery>

		<cfquery name="checkCF" datasource="mykickcloud">
			select *
			from player
			where game_id = '#getGame.game_id#' and members_id = '#session.user_id#' and division_type = 3
		</cfquery>

		<cfquery name="checkBreaking" datasource="mykickcloud">
			select *
			from player
			where game_id = '#getGame.game_id#' and members_id = '#session.user_id#' and division_type = 4
		</cfquery>

		<cfquery name="checkWeapon" datasource="mykickcloud">
			select *
			from player
			where game_id = '#getGame.game_id#' and members_id = '#session.user_id#' and division_type = 5
		</cfquery>


		<cfif checkForm.RecordCount GT 0>
			<cfset is_forms = 'yes'>
		<cfelse>
			<cfset is_forms = "">
		</cfif>

		<cfif checkSparring.RecordCount GT 0>
			<cfset is_sparring = 'yes'>
		<cfelse>
			<cfset is_sparring = "">
		</cfif>

		<cfif checkCF.RecordCount GT 0>
			<cfset is_cforms = 'yes'>
		<cfelse>
			<cfset is_cforms = "">
		</cfif>

		<cfif checkBreaking.RecordCount GT 0>
			<cfset is_breaking = 'yes'>
		<cfelse>
			<cfset is_breaking = "">
		</cfif>

		<cfif checkWeapon.RecordCount GT 0>
			<cfset is_weapon = 'yes'>
		<cfelse>
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

<!--- form 디비젼에 나이그룹을 조회 --->
	<cfquery name="getDivGroup" datasource="mykickcloud">
		select *
		from division_age_group
		where game_size = #getGame.game_size# and division_type = 1 and age_min <= #memberAge# and age_max >= #memberAge#
	</cfquery>

<div class="row">
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">

<!---- 나이그룹에 구분된 정보를 기반으로 성별정보 조회 --->
				<cfquery name="getGenderGroup" datasource="mykickcloud">
					select *
					from division_gender_group
					where id = #getDivGroup.division_gender_group#
				</cfquery>

				<h5 class="bigger lighter">#getGenderGroup.gender# [new data]</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<li>#getDivGroup.age_group# [new data]</li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		
		<cfquery name="getBeltGroup" datasource="mykickcloud">
			select *
			from division_belt
			where game_size = #getGame.game_size# and division_type = 1 and belt LIKE '%#getUser.member_belt#%'
		</cfquery>
			
	
		
		<div class="col-xs-6 col-sm-4 pricing-box">
			<div class="widget-box">
				<div class="widget-header">
					<h5 class="bigger lighter">#getBeltGroup.belt#</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">

						<ul class="list-unstyled list-striped pricing-table">

							<cfquery name="getDivWeight" datasource="mykickcloud">
								select *
								from division_map
								where game_size = #getGame.game_size# and division_type = 1 and division_belt = #getBeltGroup.id# and division_age_group = #getDivGroup.id#
							</cfquery>


							<cfloop query="getDivWeight">
								<cfoutput>

									<cfquery name="getWeightName" datasource="mykickcloud">
										select *
										from division_weight_group
										where game_size = #getGame.game_size# and id = #division_weight#
									</cfquery>

								<li>#getWeightName.weight# : #code# <cfinput name="chkbox" type="checkbox" value="#code#" onclick="check_only(this)"> </li>
								</cfoutput>
							</cfloop>

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
	<cfquery name="getDivGroup2" datasource="mykickcloud">
		select *
		from division_age_group
		where game_size = #getGame.game_size# and division_type = 2 and age_min <= #memberAge# and age_max >= #memberAge#
	</cfquery>




<div class="row">
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">

				<cfquery name="getGenderGroup2" datasource="mykickcloud">
					select *
					from division_gender_group
					where id = #getDivGroup2.division_gender_group#
				</cfquery>

				<h5 class="bigger lighter">#getGenderGroup2.gender# [new data]</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<li>#getDivGroup2.age_group# [new data]</li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		
		<cfquery name="getBeltGroup2" datasource="mykickcloud">
			select *
			from division_belt
			where game_size = #getGame.game_size# and division_type = 2 and belt LIKE '%#getUser.member_belt#%'
		</cfquery>
			
	
		
		<div class="col-xs-6 col-sm-4 pricing-box">
			<div class="widget-box">
				<div class="widget-header">
					<h5 class="bigger lighter">#getBeltGroup2.belt#</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">

						<ul class="list-unstyled list-striped pricing-table">

							<cfquery name="getDivWeight2" datasource="mykickcloud">
								select *
								from division_map
								where game_size = #getGame.game_size# and division_type = 2 and division_belt = #getBeltGroup2.id# and division_age_group = #getDivGroup2.id#
							</cfquery>


							<cfloop query="getDivWeight2">
								<cfoutput>

									<cfquery name="getWeightName2" datasource="mykickcloud">
										select *
										from division_weight_group
										where game_size = #getGame.game_size# and id = #division_weight#
									</cfquery>

								<li>#getWeightName2.weight# : #code# <cfinput name="sgbox" type="checkbox" value="#code#" onclick="check_sg(this)"> </li>
								</cfoutput>
							</cfloop>

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

<cfquery name="getDivGroup3" datasource="mykickcloud">
		select *
		from division_age_group
		where game_size = #getGame.game_size# and division_type = 3 and age_min <= #memberAge# and age_max >= #memberAge#
	</cfquery>

<div class="row">
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">

				<cfquery name="getGenderGroup3" datasource="mykickcloud">
					select *
					from division_gender_group
					where id = #getDivGroup3.division_gender_group#
				</cfquery>

				<h5 class="bigger lighter">#getGenderGroup3.gender# [new data]</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<li>#getDivGroup3.age_group# [new data]</li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		
		<cfquery name="getBeltGroup3" datasource="mykickcloud">
			select *
			from division_belt
			where game_size = #getGame.game_size# and division_type = 3 
		</cfquery>
			
	
		
		<div class="col-xs-6 col-sm-4 pricing-box">
			<div class="widget-box">
				<div class="widget-header">
					<h5 class="bigger lighter">#getBeltGroup3.belt#</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">

						<ul class="list-unstyled list-striped pricing-table">

							<cfquery name="getDivWeight3" datasource="mykickcloud">
								select *
								from division_map
								where game_size = #getGame.game_size# and division_type = 3 and division_belt = #getBeltGroup3.id# and division_age_group = #getDivGroup3.id#
							</cfquery>


							<cfloop query="getDivWeight3">
								<cfoutput>

									<cfquery name="getWeightName3" datasource="mykickcloud">
										select *
										from division_weight_group
										where game_size = #getGame.game_size# and id = #division_weight#
									</cfquery>

								<li>#getWeightName3.weight# : #code# <cfinput name="cfbox" type="checkbox" value="#code#" onclick="check_cf(this)"> </li>
								</cfoutput>
							</cfloop>

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

<cfquery name="getDivGroup4" datasource="mykickcloud">
		select *
		from division_age_group
		where game_size = #getGame.game_size# and division_type = 4 and age_min <= #memberAge# and age_max >= #memberAge#
	</cfquery>

<div class="row">
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">

				<cfquery name="getGenderGroup4" datasource="mykickcloud">
					select *
					from division_gender_group
					where id = #getDivGroup4.division_gender_group#
				</cfquery>

				<h5 class="bigger lighter">#getGenderGroup4.gender# [new data]</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<li>#getDivGroup4.age_group# [new data]</li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		
		<cfquery name="getBeltGroup4" datasource="mykickcloud">
			select *
			from division_belt
			where game_size = #getGame.game_size# and division_type = 4 
		</cfquery>
			
	
		
		<div class="col-xs-6 col-sm-4 pricing-box">
			<div class="widget-box">
				<div class="widget-header">
					<h5 class="bigger lighter">#getBeltGroup4.belt#</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">

						<ul class="list-unstyled list-striped pricing-table">

							<cfquery name="getDivWeight4" datasource="mykickcloud">
								select *
								from division_map
								where game_size = #getGame.game_size# and division_type = 4 and division_belt = #getBeltGroup4.id# and division_age_group = #getDivGroup4.id#
							</cfquery>


							<cfloop query="getDivWeight4">
								<cfoutput>

									<cfquery name="getWeightName4" datasource="mykickcloud">
										select *
										from division_weight_group
										where game_size = #getGame.game_size# and id = #division_weight#
									</cfquery>

								<li>#getWeightName4.weight# : #code# <cfinput name="bbbox" type="checkbox" value="#code#" onclick="check_bb(this)"> </li>
								</cfoutput>
							</cfloop>

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

<cfquery name="getDivGroup5" datasource="mykickcloud">
		select *
		from division_age_group
		where game_size = #getGame.game_size# and division_type = 5 and age_min <= #memberAge# and age_max >= #memberAge#
	</cfquery>

<div class="row">
	<div class="col-xs-4 col-sm-3 pricing-span-header">
		<div class="widget-box transparent">
			<div class="widget-header">

				<cfquery name="getGenderGroup5" datasource="mykickcloud">
					select *
					from division_gender_group
					where id = #getDivGroup5.division_gender_group#
				</cfquery>

				<h5 class="bigger lighter">#getGenderGroup5.gender# [new data]</h5>
			</div>

			<div class="widget-body">
				<div class="widget-main no-padding">
					<ul class="list-unstyled list-striped pricing-table-header">
						<li>#getDivGroup5.age_group# [new data]</li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-8 col-sm-9 pricing-span-body">
		
		<cfquery name="getBeltGroup5" datasource="mykickcloud">
			select *
			from division_belt
			where game_size = #getGame.game_size# and division_type = 5 
		</cfquery>
			
	
		
		<div class="col-xs-6 col-sm-4 pricing-box">
			<div class="widget-box">
				<div class="widget-header">
					<h5 class="bigger lighter">#getBeltGroup5.belt#</h5>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">

						<ul class="list-unstyled list-striped pricing-table">

							<cfquery name="getDivWeight5" datasource="mykickcloud">
								select *
								from division_map
								where game_size = #getGame.game_size# and division_type = 5 and division_belt = #getBeltGroup5.id# and division_age_group = #getDivGroup5.id#
							</cfquery>


							<cfloop query="getDivWeight5">
								<cfoutput>

									<cfquery name="getWeightName5" datasource="mykickcloud">
										select *
										from division_weight_group
										where game_size = #getGame.game_size# and id = #division_weight#
									</cfquery>

								<li>#getWeightName5.weight# : #code# <cfinput name="wbox" type="checkbox" value="#code#" onclick="check_w(this)"> </li>
								</cfoutput>
							</cfloop>

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
	<cfinput type="hidden" name="game_size" value="#getGame.game_size#">
		
	</cfinput>
	
		
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
		