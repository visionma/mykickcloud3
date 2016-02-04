<cfinclude template="header.cfm">
<cfinclude template="sidebar.cfm">



<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i>
				<a href="">Home</a>

				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">Member List</li>
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
		<div class="row">
			<div class="col-xs-12">
								
			<!--PAGE CONTENT BEGINS-->

								
			<cfquery datasource="mykickcloud" name="getDivision" > 
				select * 
				from game_size
				where id = '#url.id#'
			</cfquery>

			<cfquery name="getDivType" datasource="mykickcloud">
				select *
				from division_type
			</cfquery>

			<cfquery name="getDivWeight" datasource="mykickcloud">
				select *
				from division_weight_group
				where game_size = '#url.id#'
			</cfquery>


			<h2 class="header smaller lighter blue"><cfoutput query="getDivision">#size# : #detail#</cfoutput></h2>
	

				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" width="10%">
									Category
								</th>
								<th>Belt Group</th>
							</tr>
						</thead>

						<tbody>
							
						<cfoutput query="getDivType">


							<tr>
								<td class="right">
									<a name="age#getDivtype.id#"></a>
									<button class="btn btn-primary disabled pull-right">#name#</button>
								</td>
								<td>
									<cfquery name="getBeltGroup" datasource="mykickcloud">
										select *
										from division_belt
										where game_size = '#getDivision.id#' and division_type = #id#
									</cfquery>

									<cfquery name="getAgeGroup" datasource="mykickcloud">
										select *
										from division_age_group
										where game_size = '#getDivision.id#' and division_type = #id#
									</cfquery>

									<cfquery name="getGenderGroup" datasource="mykickcloud">
										select *
										from division_gender_group
									</cfquery>
									

									<cfif #getBeltGroup.RecordCount# eq 0>
										<cfset col = 2>
									<cfelse>
										<cfset col = #getBeltGroup.RecordCount# + 1>
									</cfif>

									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<td colspan="#col#">
													<cfform name="belt_group#id#" action="division_belt_add2.cfm">
														1. Add Belt Group : <cfinput type="text" name="belt" placeholder="add belt group">
														<cfinput type="hidden" name="game_size" value="#url.id#">
														<cfinput type="hidden" name="division_type" value="#id#">

														<button class="btn btn-xs btn-danger">Submit</button>
													</cfform>
												</td>
											</tr>
											<tr>
												<th class="center danger" width="20%">
													
													<a href="division_belt_add.cfm?id=#url.id#&input=age&##age#getDivtype.id#" class="btn btn-xs btn-warning">2. Add Age Group</a>
												</th>
												<cfif getBeltGroup.RecordCount eq 0>
													<th>No data</th>
												</cfif>
												<cfloop query="getBeltGroup">
												<th width="20%" class="danger"><strong>#belt#</strong></th>
												</cfloop>
											</tr>

											<cfif structKeyExists(url,'input') and trim(url.input) eq 'age'>

											
											<tr>
												<td colspan="#col#">

													<cfform name="addAge#id#" action="division_age_add.cfm">
														2. <cfselect name="gender_group" query="getGenderGroup" value="id" display="gender">
															
														</cfselect>

														<cfinput type="text" name="age_min" placeholder="minimum age">
														<cfinput type="text" name="age_max" placeholder="maximum age">
														<cfinput type="text" name="age_group" placeholder="age group name">
														

														<cfinput type="hidden" name="division_type" value="#getDivtype.id#">
														<cfinput type="hidden" name="game_size" value="#url.id#">
														<button class="btn btn-minier btn-success">submit</button>
													</cfform>
												</td>
											</tr>
											</cfif>

											<cfloop query="getAgeGroup" group="division_gender_group">

											<tr>
												<td colspan="#col#" class="success">
													<cfif #Division_Gender_group# eq '1'>
														MALE
													<cfelseif #Division_Gender_group# eq '2'>
														FEMALE
													<cfelseif #Division_Gender_group# eq '3'>
														MALE / FEMALE
													<cfelse>
														No Data Yet
													</cfif>
													
													
												</td>
											</tr>	
												
											
											<cfloop>
											<tr>
												<td align="right" class="warning">#age_group#</td>
												<cfloop query="getBeltGroup">
												<td bgcolor="white">

													<cfset codeName = "#url.id##getDivtype.id##getAgeGroup.Division_Gender_group##getbeltgroup.id##getAgeGroup.id#">
													
													<cfquery name="myMap" datasource="mykickcloud">
														select *
														from division_map
														where game_size = #url.id# and division_type = #getDivtype.id# and gender_group = #getAgeGroup.Division_Gender_group# and division_belt = #getbeltgroup.id# and division_age_group = #getAgeGroup.id#
													</cfquery>

													<cfif #myMap.recordcount# gt 0>
														<cfloop query="myMap">

															<cfquery name="getW" datasource="mykickcloud">
																select *
																from division_weight_group
																where id = #myMap.division_weight# and game_size = #url.id#
															</cfquery>

															<strong class="purple">#getW.weight#</strong>,  #code# &nbsp;<a href="division_weight_delete.cfm?code=#code#">[X]</a><br>
														</cfloop>
															
													</cfif>
												
													
													<cfform name="#url.id##getDivtype.id##getAgeGroup.Division_Gender_group##getbeltgroup.id##getAgeGroup.id#" action="division_weight_add.cfm">
														<cfselect name="weight" query="getDivWeight" value="id" display="weight"></cfselect>

														<input type="hidden" name="game_size" value="#url.id#">
														<input type="hidden" name="division_type" value="#getDivtype.id#">
														<input type="hidden" name="gender_group" value="#getAgeGroup.Division_Gender_group#">
														<input type="hidden" name="division_belt" value="#getbeltgroup.id#">
														<input type="hidden" name="division_age_group" value="#getAgeGroup.id#">

														<button class="btn btn-minier btn-default">Add</button>
													</cfform>
													
													
												</td>
												</cfloop>
											</tr>
											</cfloop>
											</cfloop>
										</thead>
									</table>



									


								</td>
							</tr>
							
						</cfoutput>
								
						</tbody>
					</table>
				</div>


			</div>
		</div>
<!--PAGE CONTENT ENDS-->
	</div>

<!-- /.main-container -->

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

		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>

		<!-- ace scripts -->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			jQuery(function($) {
				var oTable1 = $('#member_table').dataTable( {
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
		