<cfset todayDate = Now()>

<cfquery name="membership_validate" datasource="mykickcloud">
	select *
	from members
	where email_address = '#form.email_address#'
</cfquery>
<cfquery name="getQuestion" datasource="mykickcloud">
	select *
	from secret_questions
	where question = '#form.question#'
</cfquery>
<cfquery name="getSchool" datasource="mykickcloud">
	select *
	from school
	where school_name = '#form.school_name#'
</cfquery>


<cfif membership_validate.RecordCount GT 0>
	<cfset email_error = 'yes'>
	<cflocation url="membership.cfm">
</cfif>



<cfset membership = StructNew()>
<cfset membership.email_address = "#form.email_address#">
<cfset membership.email_address2 = "#form.email_address2#">
<cfset membership.password = "#form.m_password#">
<cfset membership.password2 = "#form.m_password2#">
<cfset membership.question = "#form.question#">
<cfset membership.answer = "#form.answer#">
<cfset membership.agree = "#form.agree#">
<cfset membership.member_role = "#form.member_role#">
<cfset membership.firstname = "#form.firstname#">
<cfset membership.middlename = "#form.middlename#">
<cfset membership.lastname = "#form.lastname#">
<cfset membership.member_address = "#form.member_address#">
<cfset membership.member_city = "#form.member_city#">
<cfset membership.member_state = "#form.member_state#">
<cfset membership.member_zip = "#form.member_zip#">
<cfset membership.member_phone = "#form.member_phone#">
<cfset membership.member_day_phone = "#form.member_day_phone#">
<cfset membership.member_cell_phone = "#form.member_cell_phone#">
<cfset membership.gender = "#form.gender#">
<cfset membership.birthdate = "#form.birthdate#">
<cfset membership.school_name = "#form.school_name#">
<cfset membership.school_agree = "#form.school_agree#">
<cfset membership.instructor_name = "#form.instructor_name#">
<cfset membership.instructor_email = "#form.instructor_email#">
<cfset membership.referred_usat = "#form.referred_usat#">
<cfset membership.w_agree = "#form.w_agree#">
<cfset membership.c_agree = "#form.c_agree#">
<cfset membership.member_belt = "#form.member_belt#">
<cfset membership.member_weight = "#form.member_weight#">
<cfset membership.weight_type = "#form.weight_type#">
<cfset membership.member_height = "#form.member_height#">
<cfset membership.height_type = "#form.height_type#">
<cfset membership.member_number = "#form.member_number#">

<cfif #form.belt_cert# eq "">
	<cfset membership.belt_cert = "">
<cfelseif #form.avatar# eq "">
	<cfset membership.avatar = "">
<cfelseif #form.instructor_name# eq "">
	<cfset membership.instructor_name = "">
<cfelseif #form.instructor_email# eq "">
	<cfset membership.instructor_email = "">
</cfif>

<cfset membership.question_id = "#getQuestion.id#">
<cfset membership.school_id = "#getSchool.school_id#">
<cfset membership.is_active = "Y">
<cfset membership.is_admin = "N">
<cfset membership.register_date = "#DateFormat(todayDate, "mm/dd/yyyy")#">

<cfset session.membership = '#membership#'>



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
					<a href="index.cfm">Home</a>
				</li>
			</ul><!-- .breadcrumb -->
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					
					<div class="col-sm-6">
					<cfoutput>
					<div class="profile-user-info">
						<div class="profile-info-row">
							<div class="profile-info-name"> MEMBER TYPE </div>

							<div class="profile-info-value">
								<span class="red"><strong>#form.member_role#</strong></span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> MEMBER ID </div>

							<div class="profile-info-value">
								<cfquery name="getMember_number" datasource="mykickcloud">
									select member_number
									from members
									where member_number = #form.member_number#
								</cfquery>

								<cfif getMember_number.RecordCount GT 0>
									<cfset newNumber = '#randRange(0, 99999)#'>
											
								<cfelse>
									<cfset newNumber = '#form.member_number#'>
								</cfif>
								<span class="green"><strong>#newNumber#</strong></span>
								
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> NAME </div>

							<div class="profile-info-value">
								<span>#form.firstname# #form.middlename# #form.lastname#</span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name"> ADDRESS </div>

							<div class="profile-info-value">
								<i class="icon-map-marker light-orange bigger-110"></i>
								<span>#form.member_address#<br>
								&nbsp;&nbsp;&nbsp;&nbsp;#form.member_city#, #form.member_state# #form.member_zip#</span>
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name"> AGE </div>

							<div class="profile-info-value">
								<cfset birthdate = DateFormat(#form.birthdate#, "mm/dd/yyyy")>
								<cfset memberAge = DateDiff("yyyy", #birthdate#, now())>
								<span>#memberAge#</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> BIRTHDATE </div>

							<div class="profile-info-value">
								
								<span>#birthdate#</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> WEIGHT </div>

							<div class="profile-info-value">
								
								<span>#form.member_weight# #form.weight_type#</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> HEIGHT </div>

							<div class="profile-info-value">
								
								<span>#form.member_height# #form.height_type#</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> SCHOOL / CLUB </div>

							<div class="profile-info-value">
								
								<span>#form.school_name#</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> INSTRUCTOR </div>

							<div class="profile-info-value">
								
								<span>#form.instructor_name# : #form.instructor_email#</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> BELT </div>

							<div class="profile-info-value">
								
								<span>#form.member_belt#</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> JOINDED </div>

							<div class="profile-info-value">
								
								<span>#DateFormat(todayDate, "mm/dd/yyyy")#</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> QUESTION </div>

							<div class="profile-info-value">
								<cfset todayDate = Now()>
								<span>#form.question#</span>
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name"> ANSWER </div>

							<div class="profile-info-value">
								<cfset todayDate = Now()>
								<span>#form.answer#</span>
							</div>
						</div>
					

						
					</div>
					</cfoutput>
					</div>
					
					<div class="col-sm-6">
						<h3 class="header smaller lighter red">PAYMENT</h3>
						
						<cfoutput>
						<div class="well">
							<h4 class="green smaller lighter">Membership</h4>
							#membership.member_role# : <strong class="green">$35</strong><br>
							Start Date : #DateFormat(todayDate, "mm/dd/yyyy")#
						</div>

						<div class="well">
							<h4 class="blue smaller lighter">Lifetime Membership</h4>
							$500
						</div>
						<div class="well">
							<a href="membership3.cfm">submit</a>
						</div>
						
						
						</cfoutput>
						
					</div>
					
					
					
					
					
					
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->



<cfinclude template="footer.cfm">
