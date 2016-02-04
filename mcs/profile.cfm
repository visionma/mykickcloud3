<cfinclude template="header.cfm" >
<cfinclude template="sidebar.cfm" >

		
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
			<li class="active">Profile</li>
			
		</ul>
			
			<div class="nav-search" id="nav-search">
				<form class="form-search">
					<span class="input-icon">
						<input type="text" placeholder="Search ..." 
						class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
						<i class="icon-search nav-search-icon"></i>
					</span>
				</form>
			</div><!--#nav-search-->
	</div><!--.breadcrumb-->
	
	
	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				Profile
					
			</h1>
		</div><!--/.page-header-->

		<div class="row">
		<div class="col-xs-12">

			<!--PAGE CONTENT BEGINS-->
				
			
				<cfset memberAge = DateDiff("yyyy", #getUser.birthday#, now())>
					
				<cfoutput>
					
				
						<div id="user-profile-1" class="user-profile row">
							<div class="col-xs-12 col-sm-3 center">
								<div>
									<span class="profile-picture">
										<cfif #getUser.avatar_filename# is "">
											<img id="avatar" class="editable img-responsive"  src="assets/avatars/avatar2.png" />
										<cfelse>
											<img id="avatar" class="editable img-responsive"  src="assets/avatars/#getUser.avatar_filename#" />
										</cfif>
									</span>
									<div class="space-4"></div>

									<div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
										<div class="inline position-relative">
											<span class="white"> #getUser.firstname# #getUser.middlename# #getUser.lastname#</span>
												
										</div><!---inline position-relative--->
									</div><!---width-80--->
								</div>

								<div class="space-6"></div>

								<div class="profile-contact-info">
									<div class="clearfix">
										<span>Nickname : #getUser.nick_name#</span>
									</div>
								</div><!---profile-contact-info--->

								<div class="hr hr12 dotted"></div>

									<div class="clearfix">
										
											<a href="profile_edit.cfm?uid=#getUser.members_id#" class="btn btn-app btn-primary btn-xs">
												<i class="icon-edit bigger-230"></i>
												Edit
											</a>

											<a href="profile_print.cfm?uid=#getUser.members_id#" class="btn btn-app btn-warning btn-xs">
												<i class="icon-print bigger-230"></i>
												Print
											</a>
										
									</div>


									<div class="hr hr16 dotted"></div>
								</div><!---hr--->

								<div class="col-xs-12 col-sm-9">
									<div class="profile-user-info profile-user-info-striped">
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Member ID
											</div>
											<div class="profile-info-value">
												<span class="editable" id="member_number"><strong class="text-success">#getUser.member_number#</strong>&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Member Name 
											</div>
											<div class="profile-info-value">
												<span class="editable" id="username">#getUser.firstname# #getUser.lastname#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Member Type
											</div>
											<div class="profile-info-value">
												<span class="editable" id="member_type">#getUser.member_role#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												School Name 
											</div>
											<div class="profile-info-value">
													<span class="editable" id="username">#getUser.school_name#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Email 
											</div>
											<div class="profile-info-value">
												<span class="editable" id="username">#getUser.email_address#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Gender 
											</div>
											<div class="profile-info-value">
												<span class="editable" id="username">#getUser.member_gender#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Age 
											</div>
											<div class="profile-info-value">
												<span class="editable" id="age">#memberAge#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Weight 
											</div>
											<div class="profile-info-value">
												<span class="editable" id="username">#getUser.member_weight#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Location 
											</div>
											<div class="profile-info-value">
												<i class="icon-map-marker light-orange bigger-110"></i>
												<span class="editable" id="country">#getUser.member_state#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Joined 
											</div>
											<div class="profile-info-value">
												<span class="editable" id="signup">#getUser.register_date#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->
										<div class="profile-info-row">
											<div class="profile-info-name"> 
												Last Online 
											</div>
											<div class="profile-info-value">
												<span class="editable" id="login">#getUser.last_login#&nbsp;</span>
											</div>
										</div><!---profile-infor-row--->

									</div><!---profile user info--->
								</div><!---col xs 12--->
							</div><!---col xs 12--->
						</div><!---user profile 1--->

				



</cfoutput>













<!--PAGE CONTENT ENDS-->
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->

			</div><!--/.main-content-->




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
		