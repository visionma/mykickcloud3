<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>TMS ::: Tournament Management System</title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />


		<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
		<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
		<link rel="stylesheet" href="assets/css/chosen.css" />
		<link rel="stylesheet" href="assets/css/datepicker.css" />
		<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css" />
		<link rel="stylesheet" href="assets/css/daterangepicker.css" />
		<link rel="stylesheet" href="assets/css/colorpicker.css" />
		<link rel="stylesheet" href="assets/css/prettify.css" />
		<link rel="stylesheet" href="assets/css/colorbox.css" />



		<link href="//fonts.googleapis.com/css?family=Open+Sans:300italic,300,400italic,400,600italic,600,700italic,700,800italic,800" rel="stylesheet" type="text/css">


		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />


		<script src="../assets/js/ace-extra.min.js"></script>

	
	</head>

	<body>

		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				
				<a href="index.cfm" class="navbar-brand">
					<small><small>
						<i class="icon-cloud-upload"></i>
						<strong>MyKick</strong><span class="lighter">Cloud</span> <small><small>: TMS</small></small>
					</small></small>
				</a>
		

			
				<ul class="nav ace-nav pull-right">
					<li class="light-blue">
						<a data-toggle="dropdown" href="#" class="dropdown-toggle">
							<img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo" />
							<span class="user-info">
								<cfif structKeyExists(session,'school_id') and trim(session.school_id) neq "">
									<cfoutput>
										<small>Welcome,</small>#getschool.school_name#
									</cfoutput>
								<cfelse>
									<cflocation url="../login/index.cfm">
								</cfif>	
							</span>
							<i class="icon-caret-down"></i>
						</a>
						<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li>
								<a href="profile.cfm">
									<i class="icon-user"></i>
									Profile
								</a>
							</li>
							<li>
								<a href="../login/logout.cfm">
									<i class="icon-off"></i>
									Logout
								</a>
							</li>
						</ul>
					</li>
				</ul>
				
			</div>
		</div>