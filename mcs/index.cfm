<cfinclude template="header.cfm">
<cfinclude template="sidebar.cfm">

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

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div><!--#nav-search-->
				</div><!--.breadcrumb-->

			<div class="page-content">
				
				<div class="page-header position-relative">
					<h1>Dashboard
						<small>
							<i class="icon-double-angle-right"></i>
							overview &amp; stats
						</small>
					</h1>
				</div><!--/.page-header-->

				<div class="row">
					<div class="col-xs-12">
							<!--PAGE CONTENT BEGINS-->

						
							<div class="row">
								<!--left right widget-->
								<div class="col-xs-12 col-sm-6 widget-container-span">
									<div class="widget-box">
										<div class="widget-header">
											<h5>Game Information</h5>

											<div class="widget-toolbar">
												
												<a href="#" data-action="reload"><i class="icon-refresh"></i></a>
												<a href="#" data-action="collapse"><i class="icon-chevron-up"></i></a>
											</div><!---widget-toolbar--->
										</div><!---widget-header--->
									

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
														<p class="alert alert-success">
															<strong>#game_title# :</strong> #getSchool.school_name#<br>
															<strong>Location :</strong> #place_name#, #game_state#<br>
															<strong>Contact :</strong> #email#, #phone#<br>
															Date / Time : #start_date#~#end_date#, #start_time#
														</p>
													</cfoutput>
												</cfloop>
											</div><!---widget-main--->
										</div><!---widget-body--->
									</div><!---widget-box--->
								</div><!---col-xs--->
							
							
								
								<!--right widget-->
							
							
						
								<div class="col-xs-12 col-sm-6 widget-container-span">
									<div class="widget-box">
										<div class="widget-header header-color-orange">
											<h5 class="bigger lighter">
												<i class="icon-table"></i>
												NOTICE
											</h5>
										</div><!---widget-header--->

										<div class="widget-body">
											<div class="widget-main no-padding">
												<cfquery datasource="mykickcloud" name="getNotice">
													select *
													from board_notice
												</cfquery>
												<cfquery datasource="mykickcloud" name="getNum">
													select max(num) as count
													from board_notice
												</cfquery>
												
												<table class="table table-striped table-bordered table-hover">
													<tbody>
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
																	<cfif #getReply.count# gt 0 >
																	&nbsp;&nbsp;
																	<span class="badge badge-green">
																		<i class="icon-comment"></i> #getReply.count# 
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
												
											</div><!---widget-main--->
										</div><!---widget-body--->
										
									</div><!---widget-box--->
								</div><!---col-xs--->
						</div><!---row--->

							<div class="space-24"></div>
						
						
						
						
						
						

							<!--PAGE CONTENT ENDS-->
						</div><!--/.co-xs-->
					</div><!--/.row-fluid-->
					
				</div><!--/.page-content-->
			</div><!--/.main-content-->
	

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

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

		<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/jquery.slimscroll.min.js"></script>

		<!-- ace scripts -->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			jQuery(function($) {
			
				$('#simple-colorpicker-1').ace_colorpicker({pull_right:true}).on('change', function(){
					var color_class = $(this).find('option:selected').data('class');
					var new_class = 'widget-header';
					if(color_class != 'default')  new_class += ' header-color-'+color_class;
					$(this).closest('.widget-header').attr('class', new_class);
				});
			
			
				// scrollables
				$('.slim-scroll').each(function () {
					var $this = $(this);
					$this.slimScroll({
						height: $this.data('height') || 100,
						railVisible:true
					});
				});
			
				/**$('.widget-box').on('ace.widget.settings' , function(e) {
					e.preventDefault();
				});*/
				  
				  
			
				// Portlets (boxes)
			    $('.widget-container-span').sortable({
			        connectWith: '.widget-container-span',
					items:'> .widget-box',
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'widget-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer'
			    });
			
			});
		</script>
	</body>
</html>
		