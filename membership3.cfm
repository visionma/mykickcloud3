
<cfquery name="getMembership" datasource="mykickcloud">
	insert into members(email_address,
						email_address2,
						password,
						password2,
						question,
						answer,
						firstname,
						middlename,
						lastname,
						member_address,
						member_city,
						member_state,
						member_zip,
						member_phone,
						member_day_phone,
						member_cell_phone,
						member_gender,
						birthday,
						school_name,
						instructor_name,
						instructor_email,
						referred_usat,
						member_belt,
						member_weight,
						weight_type,
						member_height,
						height_type,
						member_number,
						belt_cert,
						question_id,
						school_id,
						is_active,
						is_admin,
						register_date
						)
			values ('#session.membership.email_address#',
					'#session.membership.email_address2#',
					'#session.membership.password#',
					'#session.membership.password2#',
					'#session.membership.question#',
					'#session.membership.answer#',
					'#session.membership.firstname#',
					'#session.membership.middlename#',
					'#session.membership.lastname#',
					'#session.membership.member_address#',
					'#session.membership.member_city#',
					'#session.membership.member_state#',
					'#session.membership.member_zip#',
					'#session.membership.member_phone#',
					'#session.membership.member_day_phone#',
					'#session.membership.member_cell_phone#',
					'#session.membership.gender#',
					'#session.membership.birthdate#',
					'#session.membership.school_name#',
					'#session.membership.instructor_name#',
					'#session.membership.instructor_email#',
					'#session.membership.referred_usat#',
					'#session.membership.member_belt#',
					'#session.membership.member_weight#',
					'#session.membership.weight_type#',
					'#session.membership.member_height#',
					'#session.membership.height_type#',
					'#session.membership.member_number#',
					'#session.membership.belt_cert#',
					'#session.membership.question_id#',
					'#session.membership.school_id#',
				 	'#session.membership.is_active#',
					'#session.membership.is_admin#',
					'#session.membership.register_date#'
					)
</cfquery>

<cfset StructClear(Session)>


<cfset session.success = 'yes'>
<cflocation url="login.cfm">