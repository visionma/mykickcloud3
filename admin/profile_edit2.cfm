
<!--set the full path to the images folder-->
<cfset imagepath = expandpath('assets/avatars')>
	
<!--set the desired image width-->
<cfset thumbsize = 50>
	
<!--set the desired image width-->
<cfset imagesize = 150>
	

<cfif structKeyExists(form,"avatar") and len(form.avatar)>
	<cffile action="upload"
		filefield="avatar"
		destination="#imagepath#"
		nameconflict="MakeUnique" >
		
	<!--read the image-->

	<cfimage name="uploadedImage" source="#imagepath#/#FILE.ServerFile#">
	
	<!--figure out which way to scale the image-->
	
	<cfif uploadedImage.width gt uploadedImage.height>
		<cfset thmb_percentage = (thumbsize / uploadedImage.width)>
		<cfset percentage = (imagesize / uploadedImage.width)>
	<cfelse>
		<cfset thmb_percentage = (thumbsize / uploadedImage.height)>
		<cfset percentage = (imagesize / uploadedImage.height)>
	</cfif>
	
	<!--calculate the new thumbnail and image height/width-->
	
	<cfset thumbWidth = round(uploadedImage.width * thmb_percentage)>
	<cfset thumbHeight = round(uploadedImage.height * thmb_percentage)>
	<cfset newWidth = round(uploadedImage.width * percentage)>
	<cfset newHeight = round(uploadedImage.height * percentage)>
		
	<!--see if we need to resize the image, maybe it is already smaller than our desired size-->
	
	<cfif uploadedImage.width gt imagesize>
		<cfimage action="resize"
			height="#newHeight#"
			width="#newWidth#" 
			source="#uploadedImage#" 
			destination="#imagepath#/#FILE.ServerFile#" 
			overwrite="true">
	</cfif>
		<!--create a thumbnail for the image-->
		<cfimage action="resize" 
			height="#thumbHeight#" 
			width="#thumbWidth#" 
			source="#uploadedImage#" 
			destination="#imagepath#/thumbs/#FILE.ServerFile#" 
			overwrite="true">
			
			
			<cfquery datasource="mykickcloud" name="updateProfile">
				update members
				set nick_name = '#form.nick_name#',
					firstname = '#form.firstname#',
					lastname = '#form.lastname#',
					email_address = '#form.email_address#',
					password = '#form.password#',
					password2 = '#form.password2#',
					member_phone = '#form.member_phone#',
					avatar = '#imagepath#',
					avatar_filename = '#FILE.ServerFile#',
					member_weight = '#form.member_weight#', 
					member_height = '#form.member_height#', 
					member_belt = '#form.member_belt#', 
					member_address = '#form.member_address#', 
					member_address2 = '#form.member_address2#', 
					member_state = '#form.member_state#', 
					member_zip = '#form.member_zip#'
				where members_id = #form.uid#
			</cfquery>
</cfif>

<cfquery datasource="mykickcloud" name="updateProfile">
	update members
	set nick_name = '#form.nick_name#',
		firstname = '#form.firstname#',
		lastname = '#form.lastname#',
		email_address = '#form.email_address#',
		password = '#form.password#',
		password2 = '#form.password2#',
		member_phone = '#form.member_phone#',
		member_weight = '#form.member_weight#', 
		member_height = '#form.member_height#', 
		member_belt = '#form.member_belt#', 
		member_address = '#form.member_address#', 
		member_address2 = '#form.member_address2#', 
		member_state = '#form.member_state#', 
		member_zip = '#form.member_zip#'
	where members_id = #form.uid#
</cfquery>

<cflocation url="profile.cfm">
		
