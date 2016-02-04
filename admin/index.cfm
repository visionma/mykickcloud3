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
								overview &amp; stats
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row">
						<div class="col-xs-12">
							<!--PAGE CONTENT BEGINS-->

								<div class="col-xs-12 col-sm-6 widget-container-span">
									<div class="widget-box">
										<div class="widget-header header-color-blue">
											<h5 class="bigger lighter">
												<i class="icon-table"></i>
												Tables & Colors
											</h5>

											<div class="widget-toolbar widget-toolbar-light no-border">
												<select id="simple-colorpicker-1" class="hide">
													<option selected="" data-class="blue" value="#307ECC">#307ECC</option>
													<option data-class="blue2" value="#5090C1">#5090C1</option>
													<option data-class="blue3" value="#6379AA">#6379AA</option>
													<option data-class="green" value="#82AF6F">#82AF6F</option>
													<option data-class="green2" value="#2E8965">#2E8965</option>
													<option data-class="green3" value="#5FBC47">#5FBC47</option>
													<option data-class="red" value="#E2755F">#E2755F</option>
													<option data-class="red2" value="#E04141">#E04141</option>
													<option data-class="red3" value="#D15B47">#D15B47</option>
													<option data-class="orange" value="#FFC657">#FFC657</option>
													<option data-class="purple" value="#7E6EB0">#7E6EB0</option>
													<option data-class="pink" value="#CE6F9E">#CE6F9E</option>
													<option data-class="dark" value="#404040">#404040</option>
													<option data-class="grey" value="#848484">#848484</option>
													<option data-class="default" value="#EEE">#EEE</option>
												</select>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<table class="table table-striped table-bordered table-hover">
													<thead class="thin-border-bottom">
														<tr>
															<th>
																<i class="icon-user"></i>
																User
															</th>

															<th>
																<i>@</i>
																Email
															</th>
															<th class="hidden-480">Status</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td class="">Alex</td>

															<td>
																<a href="#">alex@email.com</a>
															</td>

															<td class="hidden-480">
																<span class="label label-warning">Pending</span>
															</td>
														</tr>

														<tr>
															<td class="">Fred</td>

															<td>
																<a href="#">fred@email.com</a>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">Approved</span>
															</td>
														</tr>

														<tr>
															<td class="">Jack</td>

															<td>
																<a href="#">jack@email.com</a>
															</td>

															<td class="hidden-480">
																<span class="label label-warning">Pending</span>
															</td>
														</tr>

														<tr>
															<td class="">John</td>

															<td>
																<a href="#">john@email.com</a>
															</td>

															<td class="hidden-480">
																<span class="label label-inverse arrowed">Blocked</span>
															</td>
														</tr>

														<tr>
															<td class="">James</td>

															<td>
																<a href="#">james@email.com</a>
															</td>

															<td class="hidden-480">
																<span class="label label-info arrowed-in arrowed-in-right">Online</span>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								

							<div class="space-24"></div>




						

							<!--PAGE CONTENT ENDS-->
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->

				
			</div><!--/.main-content-->
		</div><!--/.main-container-->

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
		