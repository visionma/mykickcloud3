<cfinclude template="header.cfm">
<cfinclude template="sidebar.cfm">
	
	
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i>
				<a href="#">Home</a>
			</li>
		</ul><!-- .breadcrumb -->
	</div>

	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->


				<cfquery name="getState" datasource="mykickcloud">
					select *
					from state
					order by short
				</cfquery>	


				<div class="col-sm-6">
					<h3 class="lighter block blue"><strong class="orange">Referee :</strong> Enter the following information</h3>

						<cfif structKeyExists(session,'email_match') and trim(session.email_match) eq "1">
							
							<div class="alert alert-danger">
								<button type="button" class="close" data-dismiss="alert">
									<i class="icon-remove"></i>
								</button>

								<strong>
									<i class="icon-remove"></i>
									Oh snap!
								</strong>
								Email you entered already exists in our system.
								<br />
							</div>

						</cfif>


						<cfform action="membership_referee2.cfm" class="form-horizontal">
								
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>Name :</small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">		

									<cfinput name="firstname" type="text" placeholder="Firstname" 
									required="yes" message="You must enter a Firstname" class="col-xs-4"/>

									<cfinput name="middlename" type="text" placeholder="Middle" 
									required="yes" message="You must enter a Middlename" class="col-xs-4"/>

									<cfinput name="lastname" type="text" placeholder="Lastname" 
									required="yes" message="You must enter a Lastname" class="col-xs-4"/>

									</div>
								</div>
							</div>
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>Address :</small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
									<cfinput name="school_address1" type="text" placeholder="Address 1" 
									required="yes" message="You must enter a address" class="col-xs-12"/>
									</div>
								</div>
							</div>
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>City :</small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
									
									<cfinput name="school_city" type="text" placeholder="City" 
									required="yes" message="You must enter a city"/>
									</div>
								</div>
							</div>
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>State :</small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
									<cfselect name="school_state" query="getState" display="full" value="short" 
									required="yes" message="You have to select state" queryPosition="below">
										<option value="" selected>Select State</option>
									</cfselect>
									</div>
								</div>
							</div>
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>Zip :</small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
									<cfinput name="school_zip" type="text" placeholder="Zip" mask="99999" 
									required="yes" message="You must enter a zip code"/>
									</div>
								</div>
							</div>
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>Homepage :</small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
									<cfinput name="school_homepage" type="text" placeholder="http://" class="col-xs-12"/>
									</div>
								</div>
							</div>
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>Email :</small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
				                    <cfinput name="school_email" type="text" placeholder="Email" 
									required="yes" message="You must enter a email address" class="col-xs-12"/>
									</div>
								</div>
							</div>
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>Password :</small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
				                    <cfinput name="school_password" type="password" placeholder="Password" 
									required="yes" message="You must enter a password"/>
									</div>
								</div>
							</div>
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>Password2 :</small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
				                    <cfinput name="school_password2" type="password" placeholder="Password2" 
									required="yes" message="You must enter a password2"/>
									</div>
								</div>
							</div>
							<div class="form-group">
				                <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small> </small></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">

									<cfinput name="reset" type="reset" class="btn btn-warning" value="Reset"/>

				                    <cfinput name="submit" type="submit" class="btn btn-primary" value="Sign up"/>
									</div>
								</div>
							</div>

						</cfform>


						<div class="form-group">
				            <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small> </small></label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<p class="already">
										Already have an account?<a href="login.cfm">Sign in</a>
									</p>
								</div>
							</div>
						</div>
				</div>

				<div class="col-sm-6">
					<h3 class="header smaller lighter blue">Instruction</h3>
					

					<div class="well">
						
							<p class="grey lighter">
							Floor access for non-competitors will be restricted to Referees, Masters, Instructors and Coaches with proper identification pass.</p>
							<p class="grey lighter">
							Coaches may accompany competitors onto the gym floor, 
							and must leave the floor immediately
							after the competitor’s match.</p>
						
						
					</div>
				</div>

<!-- PAGE CONTENT ENDS -->
			</div><!-- /.col -->
		</div><!-- /.row -->
	</div><!-- /.page-content -->
</div><!-- /.main-content -->


<cfinclude template="footer.cfm">