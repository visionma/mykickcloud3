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
					<div class="page-header position-relative">
						<h1>
							Dashboard
							<small>
								<i class="icon-double-angle-right"></i>
								manage member
								<i class="icon-double-angle-right"></i>
								member list
							</small>
						</h1>
					</div><!--/.page-header-->

				<div class="row">
					<div class="col-xs-12">
								
<!--PAGE CONTENT BEGINS-->





<cfif structKeyExists(session,'admin_id') and trim(session.admin_id) neq "">

					
<cfquery datasource="mykickcloud" name="getMember" > 
	select * 
	from members 
	where is_admin = 'N'
	order by members_id desc
</cfquery>




		<h3 class="header smaller lighter blue">Member List</h3>
	

		<div class="table-responsive">
			<table id="member_table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label>
								
								<span class="lbl"></span>
							</label>
						</th>
						<th>NAME</th>
						<th>NICKNAME</th>
						<th><i class="icon-envelope bigger-110 hidden-480"></i> EMAIL</th>
						<th>SCHOOL</th>
						<th>STATE</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
					
					<cfloop query="getMember">
					<cfoutput>
					<tr>
						<td class="center">
							<label>
								<cfif #member_gender# eq 'Male'>
								<i class="icon-male bigger-130 green"></i>
								<cfelse>
								<i class="icon-female bigger-130 red"></i>
								</cfif>
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="member_edit.cfm?uid=#members_id#">#firstname# #lastname#</a>
						</td>
						<td>#nick_name#</td>
						<td>#email_address#</td>
						<td>#school_name#</td>
						<td>#member_state#</td>

						

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								

								<a class="green" href="member_edit.cfm?uid=#members_id#">
									<i class="icon-edit bigger-130"></i>
								</a>

								<a class="red" href="">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="member_edit.cfm?uid=#members_id#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
					
					</cfoutput>
					</cfloop>

						
				</tbody>
			</table>
		</div>
	</div>
</div>





<cfelse>
	session time out
</cfif>


<!--PAGE CONTENT ENDS-->









<!--cfinclude template="footer.cfm"-->

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
		