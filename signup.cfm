<cfinclude template="header.cfm">

<cfquery name="getBelt" datasource="mykickcloud">
	select *
	from belts
	order by number
</cfquery>

<cfquery name="getschool" datasource="mykickcloud" >
	select * 
	from school 
</cfquery>

<cfquery name="getState" datasource="mykickcloud">
	select *
	from state
	order by short
</cfquery>

<cfoutput>
	
<div id="features">
	<div class="container">
		<!-- header -->
	    <h2 class="section_header">
	        <hr class="left visible-desktop">
	        <span>
				Player
			</span>
	        <hr class="right visible-desktop">
	    </h2>
			<cfform action="signup2.cfm">
			    <div class="row">
			        <div class="span4 feature">
                        	
						<h3>
							<i class="i_cloud"></i> Login Info
						</h3>
						<p class="description">
								
							<cfinput name="Email" type="text" placeholder="Email" required="yes"/>
							<cfinput name="password" type="password" placeholder="Password" required="yes" pattern="^[a-zA-Z0-9._]{8,16}$"/>
							<cfinput name="password2" type="password" placeholder="Password2" required="yes" pattern="^[a-zA-Z0-9._]{8,16}$"/>
							<cfinput name="firstname" type="text" placeholder="First Name" requried="yes">
							<cfinput name="lastname" type="text" placeholder="Last Name" requried="yes">
							<cfinput name="nick_name" type="text" placeholder="Nick Name" requried="yes">
						</p>
                           
					</div>
					<div class="span4 feature">
						<h3>
							<i class="i_cloud"></i> Address
						</h3>
						<p class="description">
							<cfinput name="member_address" type="text" placeholder="Address 1" requried="yes">
							<cfinput name="member_address2" type="text" placeholder="Address 2" requried="yes">
							<cfinput name="member_city" type="text" placeholder="City" requried="yes">
							<cfselect name="member_state" query="getState" display="full" value="short" 
							required="yes" message="You have to select state" queryPosition="below">
								<option value="" selected>Select State</option>
							</cfselect>
							<cfinput name="member_zip" type="text" placeholder="Zip" mask="99999" requried="yes">
							<cfinput name="member_phone" type="text" placeholder="Phone" mask="999-999-9999" requried="yes">
							
						</p>
                           
					</div>
					<div class="span4 feature">
                        	
						<h3>
							<i class="i_cloud"></i> Devision Info
						</h3>
						<p class="description">
							<cfselect name="member_gender">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</cfselect>
							
							
							
							<cfselect name="school_name" query="getschool" display="school_name" value="school_name"
							required="yes" message="You have to select your current school" queryPosition="below">
								<option value="" selected>Select School</option>
							</cfselect>
							
							<cfoutput>
								<input type="hidden" name="school_id" value="#getschool.school_id#">
							</cfoutput>
							
							<cfselect name="member_belt" query="getBelt" display="color" value="color" 
							required="yes" message="You have to select at least one belt" queryPosition="below">
								<option value="" selected>Select Your Belt</option>
							</cfselect>
							
							<cfinput name="birthday" type="text" placeholder="__/__/____ Birthdate" mask="99/99/9999" requried="yes">
							<cfinput name="member_weight" type="text" placeholder="00 lb / Weight" requried="yes">
							<cfinput name="member_height" type="text" placeholder="00 ft / Height" requried="yes">
						</p>
                    </div>
        		</div>
						<p class="center" align="center">
						<cfinput name="is_active" type="hidden" value="Y">
						<cfinput name="member_type" type="hidden" value="player">
						<cfinput name="reset" type="reset" class="btn" value="Reset"/>
				        <cfinput name="submit" type="submit" class="btn" value="Sign up"/>
						</p>
		
	 </cfform>
        
        
		

<p class="center" align="center">Already have an account? 
<a href="signin.cfm">Sign in</a></p>

</cfoutput>


    </div>
</div>
 <cfinclude template="footer.cfm">