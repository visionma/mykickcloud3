


<cfset expire_Date = #dateadd("m", +12, getUser.register_Date)#>

<cfoutput query="getUser">
<cfdocument format="PDF" filename="pdf/mcard#members_id##member_number#.pdf" overwrite="Yes" orientation = "landscape">




<!DOCTYPE html>
<html lang="en">
	<head>
		<title>MyKickCloud Membership Card</title>
		<meta charset="UTF-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	</head>
	


	<body>





<table border="0" cellpadding="0" cellspacing="0" width="50%" height="50%">
	<tr>
		<td bgcolor="##000000">

<table width="100%" height="100%" valign="middle" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td rowspan="10" valign="top" align="center" bgcolor="##ffffff" height="100%">
			<img id="avatar" class="editable img-responsive"  src="assets/avatars/#avatar_filename#" />
				<br>
				<table border="0">
					<tr>
						<td align="center">
							<font face="sans-serif, helvetica, arial">
							<h1>#member_number#</h1>
							</font>
						</td>
					</tr>
				</table>
		</td>
		<td rowspan="10" width="1" bgcolor="##ffffff">&nbsp;</td>
		<td width="130" valign="middle" valign="top" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				Name: 
			</font>
		</td>
		<td width="180" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#firstname# #middlename# #lastname#
			</font>
		</td>
	</tr>
	<tr>
		<td width="130" valign="middle" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				Address: 
			</font>
		</td>
		<td valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#member_address# #member_city#<br>
				#member_state#, #member_zip#
			</font>
		</td>
	</tr>
	<tr>
		<td width="130" valign="middle" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				Email: 
			</font>
		</td>
		<td valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#email_address#
			</font>
		</td>
	</tr>
	<tr>
		<td width="130" valign="middle" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				Phone: 
			</font>
		</td>
		<td valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#member_phone#
			</font>
		</td>
	</tr>
	<tr>
		<td width="130" valign="middle" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				School: 
			</font>
		</td>
		<td valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#school_name#
			</font>
		</td>
	</tr>
	<tr>
		<td width="130" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				Belt: 
			</font>
		</td>
		<td valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#member_belt#
			</font>
		</td>
	</tr>
	<tr>
		<td width="130" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				Weight: 
			</font>
		</td>
		<td valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#member_weight# #weight_type#
			</font>
		</td>
	</tr>
	<tr>
		<td width="130" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				Height: 
			</font>
		</td>
		<td valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#member_height# #height_type#
			</font>
		</td>
	</tr>
	<tr>
		<td width="130" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				Registered Date: 
			</font>
		</td>
		<td valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#dateformat(register_date, "mm/dd/yyyy")#
			</font>
		</td>
	</tr>
	<tr>
		<td width="130" valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				Expire Date: 
			</font>
		</td>
		<td valign="middle" bgcolor="##ffffff">
			<font face="sans-serif, helvetica, arial" size="2">
				#dateformat(expire_date, "mm/dd/yyyy")#
			</font>
		</td>
	</tr>


</table>
</td>
</tr>
</table>




	</body>
</html>



</cfdocument>


<cfpdf action="read" name="myPDF" source="pdf/mcard#members_id##member_number#.pdf" />
	<cfcontent variable="#toBinary(myPDF)#" type="application/pdf" />


</cfoutput>
