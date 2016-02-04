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
			<li class="active">Notice</li>
		</ul>
	<!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon">
					<input type="text" placeholder="Search ..." class="input-small nav-search-input" 
					id="nav-search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div>
	</div>
	<!--#nav-search-->
				
	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				Dashboard 
				<small>
					<i class="icon-double-angle-right"></i>
					Notice
				</small>
			</h1>
		</div>
		<!--/.page-header-->
		<div class="row">
			<div class="col-xs-12">
			
			<!--PAGE CONTENT BEGINS-->
				<cfif structKeyExists(session,'admin_id') and trim(session.admin_id) neq "">

					<cfquery datasource="mykickcloud" name="getMember">
						select *
						from members
						where members_id = #session.admin_id#
					</cfquery>
					
					<cfquery datasource="mykickcloud" name="getGame">
						select *
						from board_notice
						where num > 0
						order by num desc
					</cfquery>
					
					<!--get list of num-->
					
					
					<cfquery datasource="mykickcloud" name="getNum">
						select max(num) as count
						from board_notice
					</cfquery>
					
					
							<div class="table">
								<cfoutput>
							
								<strong class="smaller lighter green">MEMBER FORUM > </strong>  
								<strong class="smaller lighter orange"> TOTAL : #getNum.count#</strong>
								</cfoutput>
							</div>

							<div class="table-responsive">
								<table id="forum_table"  class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center">
												<label>
													
													<span class="lbl"></span>
												</label>
											</th>
											<th class="center">
												NO.
											</th>
											
											<th>Subject</th>
											<th>Name</th>
											<th>Date</th>
											<th>Views</th>
											<th></th>
										</tr>
									</thead>

									<tbody>
									<cfloop query="getGame">
										<cfoutput>
											<cfquery datasource="mykickcloud" name="getReply">
												select count(is_reply) as count
												from board_notice
												where father = #getGame.id#
											</cfquery>
										<tr>
											<td class="center">
												<label>
													<i class="icon-caret-right bigger-130 green"></i>
													<span class="lbl"></span>
												</label>
											</td>
											<td class="center">
												#num#
											</td>
											
											<td><a href="notice_view.cfm?vid=#num#">#subject#</a> 
									<!--reply count-->
											<cfif #getReply.count# gt 0>
											&nbsp;&nbsp;
											<span class="badge badge-green">
												<i class="icon-comment"></i>  #getReply.count# 
											</span>
											</cfif>
									<!--reply count end-->
											</td>
											<td>#name#</td>
											<td class="center">#reg_date#</td>
											<td class="center">#hit#</td>
											<td>
												<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">


													<a class="green" href="notice_edit.cfm?id=#getGame.id#">
														<i class="icon-edit bigger-130"></i>
													</a>

													<a class="red" href="notice_delete.cfm?id=#getGame.id#">
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
																<a href="notice_edit.cfm?id=#getGame.id#" class="tooltip-success" data-rel="tooltip" title="Edit">
																	<span class="green">
																		<i class="icon-edit bigger-120"></i>
																	</span>
																</a>
															</li>

															<li>
																<a href="notice_delete.cfm?id=#getGame.id#" class="tooltip-error" data-rel="tooltip" title="Delete">
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
					
						<br>
								
								<div class="no-margin-top center">
									<a href="notice_write.cfm">
									<button class="btn btn-sm btn-write center">
										<i class="icon-pencil"></i>
										WRITE
									</button>
									</a>
								</div>
					
								

					
					
					
					
					

				
				

				<cfelse>
					session time out
				</cfif>


			<!--PAGE CONTENT ENDS-->
			</div><!--/.span-->
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->

	
	</div><!--/.main-content-->
</div><!--/.main-container-->

		

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
