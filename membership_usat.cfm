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


				

					<div class="hr hr-18 hr-double dotted"></div>

					<div class="row-fluid">
						<div class="span12">
							<div class="widget-box">
								<div class="widget-header widget-header-blue widget-header-flat">
									<h4 class="lighter">New Item Wizard</h4>
									<!---div class="widget-toolbar">
										<label>
											<small class="green">
												<b>Validation</b>
											</small>

											<input id="skip-validation" type="checkbox" class="ace ace-switch ace-switch-4" />
											<span class="lbl"></span>
										</label>
									</div--->
									
								</div>

								<div class="widget-body">
									<div class="widget-main">
										<div id="fuelux-wizard" class="row-fluid" data-target="#step-container">
											<ul class="wizard-steps">
												<li data-target="#step1" class="active">
													<span class="step">1</span>
													<span class="title">Account & Type</span>
												</li>

												<li data-target="#step2">
													<span class="step">2</span>
													<span class="title">Membership & Profile</span>
												</li>

												<li data-target="#step3">
													<span class="step">3</span>
													<span class="title">TKD Profile</span>
												</li>

												<li data-target="#step4">
													<span class="step">4</span>
													<span class="title">Confirmation</span>
												</li>
											</ul>
										</div>

										<hr />
								
										<div class="step-content row-fluid position-relative" id="step-container">
											
									<cfform name="membership" class="form-horizontal" id="validation-form" action="membership2.cfm" enctype="multipart/form-data">		
											
											<div class="step-pane active" id="step1">
												<h3 class="lighter block green">Enter the following information</h3>

												
											
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email"><small>Email Address:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfinput type="email" name="email_address" class="col-xs-12 col-sm-4" id="email_address"/>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email"><small>Confirm Email Address:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfinput type="email" name="email_address2" class="col-xs-12 col-sm-4" id="email_address2" />
															</div>
														</div>
													</div>

													<div class="space-2"></div>

													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password"><small>Password:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfinput type="password" name="m_password" class="col-xs-12 col-sm-4" id="m_password" />
															</div>
														</div>
													</div>

													<div class="space-2"></div>

													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password2"><small>Confirm Password:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfinput type="password" name="m_password2" class="col-xs-12 col-sm-4" id="m_password2" />
															</div>
														</div>
													</div>
													
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="question"><small>Secret Question:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfquery name="getQuestion" datasource="mykickcloud">
																	select *
																	from secret_questions
																</cfquery>
																<cfselect name="question" query="getQuestion" value="question">
																	<option value="" selected>Select secret question</option>
																</cfselect>
																
															</div>
														</div>
													</div>
													
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Your Answer:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfinput type="text" name="answer" class="col-xs-12 col-sm-4" id="answer"/>
															</div>
														</div>
													</div>
													
														<!---div class="form-group">
															<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Membership Type:</small></label>

															<div class="col-xs-12 col-sm-9">
																<div class="clearfix">
																	<cfquery name="getMembershipType" datasource="mykickcloud">
																		select *
																		from membership_type
																	</cfquery>
																	<cfoutput query="getMembershipType">
											<input name="membership_type" type="radio" value="#id#"/> <small class="lighter">#body#</small><br>
																	</cfoutput>
																</div>
															</div>
														</div--->

													<div class="hr hr-dotted"></div>

													
													<cfquery name="getPolicy" datasource="mykickcloud">
														select *
														from policy
														where id = '1'
													</cfquery>
												

													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer">.</label>
														<div class="col-xs-12 col-sm-9">
															<label>
																<textarea class="form-control" cols="150" rows="5">
																	<cfoutput>#getPolicy.body#</cfoutput>
																</textarea>
															</label>
															<label>
																<input name="agree" id="agree" type="checkbox" class="ace" required="yes"/>
																<span class="lbl"> <small  class="lighter blue">I accept the policy</small></span>
															</label>
														</div>
													</div>

												
										
											</div>

											<div class="step-pane" id="step2">
												<div class="alert alert-success">
													<strong>
														<i class="icon-check"></i>
														You do not have a current membership
													</strong>
														You will be assigned a new Membership ID once payment is complete.<br />
												</div>
										
												<!---div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right">
														<small>Renewing For:</small>
													</label>
													<label class="col-xs-12 col-sm-9">
														<small class="lighter">New Member</small>
													</label>
											
													<label class="control-label col-xs-12 col-sm-3 no-padding-right">
														<small>Membership ID:</small>
													</label>
													<label class="col-xs-12 col-sm-9">
														<small class="lighter">
															You will be assigned a new Membership ID once payment is complete.
														</small>
													</label>
													<label class="control-label col-xs-12 col-sm-3 no-padding-right">
														<small>Membership Type:</small>
													</label>
													<label class="col-xs-12 col-sm-9">
														<small class="lighter">
For a single membership fee you may register for as many memberships that apply to you. As a registered Athlete, Coach, and/or Referee Member, you are entitled to all benefits of a USA Taekwondo member, including secondary medical insurance.
<br>
All athlete, coach, and referee members may coach at a USAT National Event, beginning in 2006, as long as he/she meets event coaching requirements, which are as follows:<br><br>
<ul>
<li>National Qualifiers: An individual must complete an Associate Coach (AC) Seminar to coach at a National Qualifier.
Junior Olympics Elite Open Division: An individual must complete an AC Seminar to coach in the Elite Open Division of Junior Olympics.</li>

<li>Junior Olympics World Class Division: An individual must complete a Level I Seminar after taking an AC Seminar to coach in the World Class Division of Junior Olympics.</li>

<li>Senior Nationals Elite Open or Ultra Divisions: An individual must complete an AC Seminar to coach in the Elite Open or Ultra Divisions of Senior Nationals</li>

<li>Senior Nationals World Class Division: An individual must complete a Level I Seminar after taking an AC Seminar to coach in the World Class Division of Senior Nationals.</li>
</ul>
AC Seminars are held at all USAT National Events. Level I Seminars are held at the Junior Olympics and at Senior Nationals.
														</small>
													</label>
												</div>
												<hr--->
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Choose Role:</small></label>

													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfselect name="member_role" id="member_role">
																<option value="">Select Member Role</option>
																<option value="Athlete">Athlete</option>
																<option value="Coach">Coach</option>
																<option value="Referee">Referee</option>
																<option value="Instructor">Instructor and/or Club Owner</option>
															</cfselect>
														</div>
														<div class="clearfix">
															<small class="lighter blue"><strong>Athlete</strong>: Individuals who are competitive athletes and are eligible for competition in Taekwondo.</small>
														</div>
														<div class="clearfix">
															<small class="lighter blue"><strong>Coach</strong>: Individuals who wish to have their membership reflect them as a coach and who wish to vote in the USA Taekwondo Board of Directors Election pertaining to the position of Coach Director.</small>
														</div>
														<div class="clearfix">
															<small class="lighter blue"><strong>Referee</strong>: Individuals who are active referees and certified as referees by USA Taekwondo. Required to referee at ANY USAT sanctioned event.</small>
														</div>
														<div class="clearfix">
															<small class="lighter blue"><strong>Instructor and/or Club Owner</strong>: Individuals who wish to have their membership reflect them as a Instructor.</small>
														</div>
													</div>
												</div>
												<hr>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name"><small>Name:</small></label>
												
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="firstname" type="text" class="col-xs-3" placeholder="First" id="firstname"/>
															<cfinput name="middlename" type="text" class="col-xs-3" placeholder="Middle" id="middlename"/>
															<cfinput name="lastname" type="text" class="col-xs-3" placeholder="Last" id="lastname"/>
														</div>
													</div>
												</div>
												
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="address"><small>Address:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfinput name="member_address" type="text" class="col-xs-9" placeholder="Address" id="member_address"/>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="city"><small>City:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfinput name="member_city" type="text" class="col-xs-6" placeholder="City" id="member_city"/>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="state"><small>State:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfquery name="getState" datasource="mykickcloud">
																	select *
																	from state
																</cfquery>
																<cfselect name="member_state" query="getState" value="full" queryPosition="below" id="member_state">
																	<option value="" selected>Select State</option>
																</cfselect>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="zip"><small>Zip:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfinput name="member_zip" type="text" class="col-xs-2" placeholder="Zip" mask="99999" id="member_zip"/>
															</div>
														</div>
													</div>
												
												
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone"><small>Home Phone:</small></label>
												
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="member_phone" type="text" class="col-xs-3" placeholder="Home" id="phone"/>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Work Phone:</small></label>
												
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="member_day_phone" type="text" class="col-xs-3" placeholder="Work" id="phone"/>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Cell Phone:</small></label>
												
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="member_cell_phone" type="text" class="col-xs-3" placeholder="Cell" id="phone"/>
														</div>
													</div>
												</div>
												
												
												
												
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="gender"><small>Gender:</small></label>
												
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfselect name="gender" class="pull-left" id="gender">
																<option value="Male">Male</option>
																<option value="Female">Female</option>
															</cfselect>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="birthdate"><small>Birthdate:</small></label>

													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="birthdate" type="text" class="col-xs-3" placeholder="Birthdate" mask="99/99/9999" id="birthdate"/>
														</div>
													</div>
												</div>
												<hr>
													<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="school"><small>School / Club:</small></label>

														<div class="col-xs-12 col-sm-9">
															<div class="clearfix">
																<cfquery name="getSchool2" datasource="mykickcloud">
																	select *
																	from school
																</cfquery>
																<cfselect name="school_name" query="getSchool2" value="school_name" queryPosition="below" id="school_name">
																	<option value="" selected>Select School/Club</option>
																</cfselect>
															</div>

														</div>
													</div>
												
														<div class="form-group">
															<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="verify"><small>Verify School/Club:</small></label>

															<div class="col-xs-12 col-sm-9">
																<div class="clearfix">

																	<cfinput name="school_agree" type="checkbox" class="ace" id="school_agree"/>
																	<span class="lbl"><small class="lighter blue"> I verify that I belong to the club above.  I understand that by selecting this club, some of my personal information (membership numbers, DOB, & registration date) will be available to that club's instructor. </small></span>
																</div>
															</div>
														</div>
												
												
												
												<hr>
												
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Instructor Name:</small></label>

													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="instructor_name" type="text" class="col-xs-3" placeholder="Instructor Name"/>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Instructor Email:</small></label>

													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="instructor_email" type="text" class="col-xs-3" placeholder="Instructor Email" id="email"/>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Referred USAT:</small></label>

													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="Referred_USAT" type="text" class="col-xs-3" placeholder="Referred USAT Numbers"/>
														</div>
														<label class="lighter blue">
															<small>(If you were referred by another USAT member, please enter their USAT membership number here.)</small>
														</label>
													</div>
												</div>
												
												<hr>
												
												
												
												
												
												
												
												
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>* Waiver:</small></label>
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfquery name="getWaiver" datasource="mykickcloud">
																select *
																from policy
																where id = '2'
															</cfquery>
															<cftextarea name="waiver" class="form-control" cols="150" rows="7" html="yes">
																<cfoutput>#getWaiver.body#</cfoutput>
															</cftextarea>
														</div>
														<label>
															<cfinput name="w_agree" id="w_agree" type="checkbox" class="ace"/>
															<span class="lbl"> <small class="lighter blue">Indicates member acceptance of the above agreement.</small></span>
														</label>
													</div>
												</div>
												<hr>
												
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>* Code of Conduct:</small></label>
													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfquery name="getWaiver" datasource="mykickcloud">
																select *
																from policy
																where id = '3'
															</cfquery>
															<cftextarea name="waiver" class="form-control" cols="150" rows="7" html="yes">
																<cfoutput>#getWaiver.body#</cfoutput>
															</cftextarea>
														</div>
														<label>
															<cfinput name="c_agree" id="c_agree" type="checkbox" class="ace"/>
															<span class="lbl"> <small class="lighter blue">Indicates member acceptance of the above agreement.</small></span>
														</label>
													</div>
												</div>
												
												
												
												
												
												
												
											</div>
											
											

											<div class="step-pane" id="step3">
												
												
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Belt Color:</small></label>

													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															
															<cfquery name="getBelt2" datasource="mykickcloud">
																select *
																from belts
															</cfquery>
															<cfselect name="member_belt" query="getBelt2" value="color" queryPosition="below" id="member_belt">
																<option value="" selected>Select Belt Color</option>
															</cfselect>
															
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Weight:</small></label>

													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="member_weight" type="text" class="col-xs-2" mask="999" id="member_weight"/>
															<cfselect name="weight_type">
																<option value="lb">lb</option>
																<option value="lb">kg</option>
															</cfselect>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Height:</small></label>

													<div class="col-xs-12 col-sm-9">
														<div class="clearfix">
															<cfinput name="member_height" type="text" class="col-xs-2" id="member_height"/>
															<cfselect name="height_type">
																<option value="ft">ft</option>
																<option value="cm">cm</option>
															</cfselect>
														</div>
													</div>
												</div>
												<hr>
												
												
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Belt Certification:</small></label>

													<div class="col-xs-12 col-sm-4">
														<div class="clearfix">
															<cfinput type="file" name="belt_cert" id="id-input-file-2"/>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="answer"><small>Your Photo:</small></label>

													<div class="col-xs-12 col-sm-4">
														<div class="clearfix">
															<cfinput type="file" name="avatar" id="id-input-file-2"/>
														</div>
													</div>
												</div>
												
												
												
											</div>

											<div class="step-pane" id="step4">
												<div class="center">
													<h3 class="green">Congrats!</h3>
													Your application is ready to apply!<br>
													Click <strong class="red">'Finish'</strong> to continue to payment page!<br>
													
												
												</div>
											</div>
											
										</div>

										<hr />
										<div class="row-fluid wizard-actions">
											<cfoutput>
											<cfinput type="hidden" name="member_number" value="#randRange(0, 9999999)#">
											</cfoutput>
											<button class="btn btn-prev">
												<i class="icon-arrow-left"></i>
												Prev
											</button>

											<button class="btn btn-success btn-next" data-last="Finish ">
												Next
												<i class="icon-arrow-right icon-on-right"></i>
											</button>
										</div>
										
									</cfform>
									</div><!-- /widget-main -->
								
								</div><!-- /widget-body -->
									
							</div>
						</div>
					</div>

			
					
					</div><!-- PAGE CONTENT ENDS -->
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

		<script src="assets/js/fuelux/fuelux.wizard.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="assets/js/additional-methods.min.js"></script>
		<script src="assets/js/bootbox.min.js"></script>
		<script src="assets/js/jquery.maskedinput.min.js"></script>
		<script src="assets/js/select2.min.js"></script>

		<!-- ace scripts -->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			jQuery(function($) {
			
				$('[data-rel=tooltip]').tooltip();
			
				$(".select2").css('width','200px').select2({allowClear:true})
				.on('change', function(){
					$(this).closest('form').validate().element($(this));
				}); 
			
					var $validation = true;
					$('#fuelux-wizard').ace_wizard().on('change' , function(e, info){
						if(info.step == 1 && $validation) {
							if(!$('#validation-form').valid()) return false;
						}
					}).on('finished', function(e) {
						membership.submit();
					}).on('stepclick', function(e){
						//return false;//prevent clicking on steps
					});


				
			
					$('#id-input-file-1 , #id-input-file-2').ace_file_input({
						no_file:'No File ...',
						btn_choose:'Choose',
						btn_change:'Change',
						droppable:false,
						onchange:null,
						thumbnail:false //| true | large
						//whitelist:'gif|png|jpg|jpeg'
						//blacklist:'exe|php'
						//onchange:''
						//
					});
			
				//documentation : http://docs.jquery.com/Plugins/Validation/validate
			
			
				$.mask.definitions['~']='[+-]';
				$('#phone').mask('(999) 999-9999');
			
				jQuery.validator.addMethod("phone", function (value, element) {
					return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
				}, "Enter a valid phone number.");
			
				$('#validation-form').validate({
					errorElement: 'div',
					errorClass: 'help-block',
					focusInvalid: false,
					rules: {
						email_address: {
							required: true,
							email:true
						},
						email_address2: {
							required: true,
							email:true,
							equalTo:"#email_address"
							
						},
						m_password: {
							required: true,
							minlength: 5
						},
						m_password2: {
							required: true,
							minlength: 5,
							equalTo: "#m_password"
						},
						agree: 'required',
						question: 'required',
						answer: 'required',
						member_role: 'required',
						firstname: 'required',
						lastname: 'required',
						member_address: 'required',
						member_state: 'required',
						member_city: 'required',
						member_zip: 'required',
						gender: 'required',
						birthdate: 'required',
						school_name: 'required',
						school_agree: 'required',
						w_agree: 'required',
						c_agree: 'required'
					},
			
					messages: {
						email: {
							required: "Please provide a valid email.",
							email: "Please provide a valid email."
						},
						m_password: {
							required: "Please specify a password.",
							minlength: "Please specify a secure password."
						},
						//subscription: "Please choose at least one option",
						gender: "Please choose gender",
						agree: "Please accept our policy",
						answer: "Please enter your anwser"
					},
			
					invalidHandler: function (event, validator) { //display error alert on form submit   
						$('.alert-danger', $('.login-form')).show();
					},
			
					highlight: function (e) {
						$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
					},
			
					success: function (e) {
						$(e).closest('.form-group').removeClass('has-error').addClass('has-info');
						$(e).remove();
					},
			
					errorPlacement: function (error, element) {
						if(element.is(':checkbox') || element.is(':radio')) {
							var controls = element.closest('div[class*="col-"]');
							if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
							else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
						}
						else if(element.is('.select2')) {
							error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
						}
						else if(element.is('.chosen-select')) {
							error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
						}
						else error.insertAfter(element.parent());
					},
			
					submitHandler: function (form) {
					},
					invalidHandler: function (form) {
					}
				});
			
				
				
				
				$('#modal-wizard .modal-header').ace_wizard();
				$('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
			})
		</script>
	</body>
</html>
