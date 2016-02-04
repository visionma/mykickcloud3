<cfif structKeyExists(session,'user_id') and trim(session.user_id) neq "">

	<cfquery name="getMember" datasource="mykickcloud">
		select *
		from members
		where members_id = '#session.user_id#'
	</cfquery>
	<cfquery name="getSchool" datasource="mykickcloud">
		select *
		from school
		where school_id = '#form.sid#'
	</cfquery>
	<cfquery name="getGame" datasource="mykickcloud">
		select *
		from game
		where game_id = '#form.gid#'
	</cfquery>
		
	<cfif isDefined("form.chkbox")>
		

		<!---Mapping info --->
		<cfquery name="getFormDetail" datasource="mykickcloud">
			select *
			from division_map
			where division_map.code = '#form.chkbox#'
		</cfquery>

		<!---based on mapping info get belt info --->

		<cfquery name="f_getBeltDetail" datasource="mykickcloud">
			select *
			from division_belt
			where id = '#getFormDetail.division_belt#'
		</cfquery>

		<!--- based on mapping info get age group info --->

		<cfquery name="f_getAgeDetail" datasource="mykickcloud">
			select *
			from division_age_group
			where division_type = 1 and game_size = '#form.game_size#' and id = '#getFormDetail.division_age_group#'
		</cfquery>

		<!--- based on mapping info get weight group info --->

		<cfquery name="f_getWeightDetail" datasource="mykickcloud">
			select *
			from division_weight_group
			where game_size = '#getFormDetail.game_size#' and id = '#getFormDetail.division_weight#'
		</cfquery>

		<!--- set parameters --->

		<cfif #getFormDetail.gender_group# eq 1>
			<cfset f_gender = 'Male'>
		<cfelseif  #getFormDetail.gender_group# eq 2>
			<cfset f_gender = 'Female'>
		<cfelse>
			<cfset f_gender = 'Mail/Female'>
		</cfif>

		<cfset f_belt = '#f_getBeltDetail.belt#'>
		<cfset f_age = '#f_getAgeDetail.age_group#'>
		<cfset f_weight = '#f_getWeightDetail.weight#'>

		<cfset session.is_error = ''>
		<cfset is_forms = 'yes'>
		<cfset form_price = '#getGame.1_price#'>


			<!----------------------------->
	<cfelse>
		<cfset form_price = 0>
		<cfset is_forms = 'no'>
	</cfif>
		
	<cfif isDefined("form.sgbox")>
		
		<!---Mapping info --->
		<cfquery name="getSgDetail" datasource="mykickcloud">
			select *
			from division_map
			where division_map.code = '#form.sgbox#'
		</cfquery>

		<!---based on mapping info get belt info --->

		<cfquery name="sg_getBeltDetail" datasource="mykickcloud">
			select *
			from division_belt
			where id = '#getSgDetail.division_belt#'
		</cfquery>

		<!--- based on mapping info get age group info --->

		<cfquery name="sg_getAgeDetail" datasource="mykickcloud">
			select *
			from division_age_group
			where division_type = 2 and game_size = '#form.game_size#' and id = '#getSgDetail.division_age_group#'
		</cfquery>

		<!--- based on mapping info get weight group info --->

		<cfquery name="sg_getWeightDetail" datasource="mykickcloud">
			select *
			from division_weight_group
			where game_size = '#getSgDetail.game_size#' and id = '#getSgDetail.division_weight#'
		</cfquery>

		<!--- set parameters --->

		<cfif #getSgDetail.gender_group# eq 1>
			<cfset sg_gender = 'Male'>
		<cfelseif  #getSgDetail.gender_group# eq 2>
			<cfset sg_gender = 'Female'>
		<cfelse>
			<cfset sg_gender = 'Mail/Female'>
		</cfif>

		<cfset sg_belt = '#sg_getBeltDetail.belt#'>
		<cfset sg_age = '#sg_getAgeDetail.age_group#'>
		<cfset sg_weight = '#sg_getWeightDetail.weight#'>

		<cfset session.is_error = ''>
		<cfset is_sparring = 'yes'>
		<cfset sparring_price = '#getGame.2_price#'>

			<!----------------------------->
	<cfelse>		
		<cfset sparring_price = 0>
		<cfset is_sparring = 'no'>
	</cfif>
	
	<cfif isDefined("form.cfbox")>
			
		<!---Mapping info --->
		<cfquery name="getCfDetail" datasource="mykickcloud">
			select *
			from division_map
			where division_map.code = '#form.cfbox#'
		</cfquery>

		<!---based on mapping info get belt info --->

		<cfquery name="cf_getBeltDetail" datasource="mykickcloud">
			select *
			from division_belt
			where id = '#getCfDetail.division_belt#'
		</cfquery>

		<!--- based on mapping info get age group info --->

		<cfquery name="cf_getAgeDetail" datasource="mykickcloud">
			select *
			from division_age_group
			where division_type = 3 and game_size = '#form.game_size#' and id = '#getCfDetail.division_age_group#'
		</cfquery>

		<!--- based on mapping info get weight group info --->

		<cfquery name="cf_getWeightDetail" datasource="mykickcloud">
			select *
			from division_weight_group
			where game_size = '#getCfDetail.game_size#' and id = '#getCfDetail.division_weight#'
		</cfquery>

		<!--- set parameters --->

		<cfif #getCfDetail.gender_group# eq 1>
			<cfset cf_gender = 'Male'>
		<cfelseif  #getCfDetail.gender_group# eq 2>
			<cfset cf_gender = 'Female'>
		<cfelse>
			<cfset cf_gender = 'Mail/Female'>
		</cfif>

		<cfset cf_belt = '#cf_getBeltDetail.belt#'>
		<cfset cf_age = '#cf_getAgeDetail.age_group#'>
		<cfset cf_weight = '#cf_getWeightDetail.weight#'>

		<cfset session.is_error = ''>
		<cfset is_cfforms = 'yes'>
		<cfset creative_form_price = '#getGame.3_price#'>



			<!----------------------------->
	<cfelse>
		<cfset creative_form_price = 0>	
		<cfset is_cfforms = 'no'>	
	</cfif>
	
	<cfif isDefined("form.bbbox")>
		
			

		<!---Mapping info --->
		<cfquery name="getbbDetail" datasource="mykickcloud">
			select *
			from division_map
			where division_map.code = '#form.bbbox#'
		</cfquery>

		<!---based on mapping info get belt info --->

		<cfquery name="bb_getBeltDetail" datasource="mykickcloud">
			select *
			from division_belt
			where id = '#getbbDetail.division_belt#'
		</cfquery>

		<!--- based on mapping info get age group info --->

		<cfquery name="bb_getAgeDetail" datasource="mykickcloud">
			select *
			from division_age_group
			where division_type = 4 and game_size = '#form.game_size#' and id = '#getbbDetail.division_age_group#'
		</cfquery>

		<!--- based on mapping info get weight group info --->

		<cfquery name="bb_getWeightDetail" datasource="mykickcloud">
			select *
			from division_weight_group
			where game_size = '#getbbDetail.game_size#' and id = '#getbbDetail.division_weight#'
		</cfquery>

		<!--- set parameters --->

		<cfif #getbbDetail.gender_group# eq 1>
			<cfset bb_gender = 'Male'>
		<cfelseif  #getbbDetail.gender_group# eq 2>
			<cfset bb_gender = 'Female'>
		<cfelse>
			<cfset bb_gender = 'Mail/Female'>
		</cfif>

		<cfset bb_belt = '#bb_getBeltDetail.belt#'>
		<cfset bb_age = '#bb_getAgeDetail.age_group#'>
		<cfset bb_weight = '#bb_getWeightDetail.weight#'>

		<cfset session.is_error = ''>
		<cfset is_breaking = 'yes'>
		<cfset breaking_price = '#getGame.4_price#'>




			<!----------------------------->
	<cfelse>
		<cfset breaking_price = 0>
		<cfset is_breaking = 'no'>
	</cfif>
			
	<cfif isDefined("form.wbox")>


		<!---Mapping info --->
		<cfquery name="getwDetail" datasource="mykickcloud">
			select *
			from division_map
			where division_map.code = '#form.wbox#'
		</cfquery>

		<!---based on mapping info get belt info --->

		<cfquery name="w_getBeltDetail" datasource="mykickcloud">
			select *
			from division_belt
			where id = '#getwDetail.division_belt#'
		</cfquery>

		<!--- based on mapping info get age group info --->

		<cfquery name="w_getAgeDetail" datasource="mykickcloud">
			select *
			from division_age_group
			where division_type = 5 and game_size = '#form.game_size#' and id = '#getwDetail.division_age_group#'
		</cfquery>

		<!--- based on mapping info get weight group info --->

		<cfquery name="w_getWeightDetail" datasource="mykickcloud">
			select *
			from division_weight_group
			where game_size = '#getwDetail.game_size#' and id = '#getwDetail.division_weight#'
		</cfquery>

		<!--- set parameters --->

		<cfif #getwDetail.gender_group# eq 1>
			<cfset w_gender = 'Male'>
		<cfelseif  #getwDetail.gender_group# eq 2>
			<cfset w_gender = 'Female'>
		<cfelse>
			<cfset w_gender = 'Mail/Female'>
		</cfif>

		<cfset w_belt = '#w_getBeltDetail.belt#'>
		<cfset w_age = '#w_getAgeDetail.age_group#'>
		<cfset w_weight = '#w_getWeightDetail.weight#'>

		<cfset session.is_error = ''>
		<cfset is_weapon = 'yes'>
		<cfset weapon_price = '#getGame.5_price#'>


			<!----------------------------->
	<cfelse>
		<cfset weapon_price = 0>
		<cfset is_weapon = 'no'>
	</cfif>
	
	
			
	<!---check if nothing has applied, if nothing has applied throw error message --->
	<cfset total_price =  #form_price# + #sparring_price# + #creative_form_price# + #breaking_price# + #weapon_price#>
	

		


<cfinclude template="header.cfm">
<cfinclude template="sidebar.cfm">
<!-- inline styles related to this page -->



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
			<li class="active">Game Detail Info</li>
		</ul><!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon">
					<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div>
	<div class="page-content">
		<!--/.page-header-->

		<div class="row">
			<div class="col-xs-12">
			
<!-- PAGE CONTENT BEGINS -->

<cfoutput>

<div class="space-6"></div>

	<div class="row">
		<div class="col-sm-10 col-sm-offset-1">
			<div class="widget-box transparent invoice-box">
				<div class="widget-header widget-header-large">
					<h3 class="grey lighter pull-left position-relative">
						<i class="icon-leaf green"></i>
						Apply Game
					</h3>

					<div class="widget-toolbar no-border invoice-info">
					</div>

					<div class="widget-toolbar hidden-480">
					</div>
				</div>

				<div class="widget-body">
					<div class="widget-main padding-24">
						<div class="row">
							<div class="col-sm-6">
								<div class="row">
									<div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
										<b>School Info : #getSchool.school_name#</b>
									</div>
								</div>

								<div class="row">
									<ul class="list-unstyled spaced">
										<li><i class="icon-caret-right blue"></i> #getSchool.school_address1# </li>
										<li><i class="icon-caret-right blue"></i> #getSchool.school_city#, #getSchool.school_state# </li>
										<li><i class="icon-caret-right blue"></i> #getSchool.school_zip# </li>
										<li><i class="icon-caret-right blue"></i> Phone: <b class="red">#getSchool.school_phone#</b> </li>
									</ul>
								</div>
							</div><!-- /span -->

							<div class="col-sm-6">
								<div class="row">
									<div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
										<b>Customer : #getMember.firstname# #getMember.lastname#</b>
									</div>
								</div>

								<div>
									<ul class="list-unstyled  spaced">
										<li><i class="icon-caret-right green"></i>	#getMember.member_address# </li>
										<li><i class="icon-caret-right green"></i> #getMember.member_city#, #getMember.member_state# </li>
										<li><i class="icon-caret-right green"></i> #getMember.member_zip# </li>
									</ul>
								</div>
							</div><!-- /span -->
						</div><!-- row -->

						<div class="space"></div>
									
						<div>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Division</th>
										<th class="hidden-xs">Game Detail</th>
										
									</tr>
								</thead>

								<tbody>
								<cfif isDefined("form.chkbox")>
									<tr>
										<td>Form - Poomse</td>
										<td class="hidden-xs">#f_gender# , #f_age# . #f_belt# , #f_weight# weight</td>
										
									</tr>
								</cfif>
								<cfif isDefined("form.sgbox")>
									<tr>
										<td>Sparring - Gyroogi</td>
										<td class="hidden-xs">#sg_gender# , #sg_age# , #sg_belt# , #sg_weight# weight</td>
										
									</tr>
								</cfif>
								<cfif isDefined("form.cfbox")>
									<tr>
										<td>Creative Forms</td>
										<td class="hidden-xs">#cf_gender# , #cf_age# , #cf_belt# , #cf_weight# weight</td>
										
									</tr>
								</cfif>
								<cfif isDefined("form.bbbox")>
									<tr>
										<td>Board Breaking</td>
										<td class="hidden-xs">#bb_gender# , #bb_age# , #bb_belt# , #bb_weight# weight</td>
										
									</tr>
								</cfif>
								<cfif isDefined("form.wbox")>
									<tr>
										<td>Weapon</td>
										<td class="hidden-xs">#w_gender# , #w_age# , #w_belt# , #w_weight# weight</td>
										
									</tr>
								</cfif>
								</tbody>
							</table>
						</div>

						<div class="hr hr8 hr-double hr-dotted"></div>

							<div class="row">
								<div class="col-sm-5 pull-right">
									<h4 class="pull-right">
									Total amount :
									<span class="red">$#total_price#</span>
									</h4>
								</div>
								<div class="col-sm-7 pull-left"> Extra Information </div>
							</div>

							<div class="space-6"></div>
								<div class="well">
									
									<cfform action="game_apply2.cfm">
										<cfinput type="hidden" name="school_id" value="#getSchool.school_id#">
										<cfinput type="hidden" name="members_id" value="#getMember.members_id#">
										<cfinput type="hidden" name="game_id" value="#getGame.game_id#">
										<cfinput type="hidden" name="player_gender" value="#getMember.member_gender#">
										<cfinput type="hidden" name="paid_amount" value="#total_price#">
										
										
										
										<cfif #is_forms# EQ 'yes'>
											<cfinput type="hidden" name="forms" value="#form.chkbox#">
										<cfelse>
											<cfinput type="hidden" name="forms" value="">
										</cfif>
						
										<cfif #is_sparring# EQ 'yes'>
											<cfinput type="hidden" name="sparring" value="#form.sgbox#">
										<cfelse>
											<cfinput type="hidden" name="sparring" value="">
										</cfif>
						
										<cfif #is_cfforms# EQ 'yes'>
											<cfinput type="hidden" name="cfforms" value="#form.cfbox#">
										<cfelse>
											<cfinput type="hidden" name="cfforms" value="">
										</cfif>
						
										<cfif #is_breaking# EQ 'yes'>
											<cfinput type="hidden" name="breaking" value="#form.bbbox#">
										<cfelse>
											<cfinput type="hidden" name="breaking" value="">
										</cfif>
						
										<cfif #is_weapon# EQ 'yes'>
											<cfinput type="hidden" name="weapon" value="#form.wbox#">
										<cfelse>
											<cfinput type="hidden" name="weapon" value="">
										</cfif>
											
									
											
									<button class="btn btn-info" type="submit">
										<i class="icon-ok bigger-110"></i>
										Apply Game
									</button>
									</cfform>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</cfoutput>
				<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->

	
</div><!-- /.main-container-inner -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
	<i class="icon-double-angle-up icon-only bigger-110"></i>
</a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

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

<!-- ace scripts -->

<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
</body>
</html>
	
	
	


		

	<cfelse>
	Session Time out
</cfif>