<cfinclude template="header.cfm" >
<cfinclude template="sidebar.cfm" >

		
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
			<li class="active">Notice</li>
		</ul>
	<!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon">
					<input type="text" placeholder="Search ..." class="input-small nav-search-input" 
					id="nav-search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div>
	</div>
	<!--#nav-search-->
				
	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				Dashboard 
				<small>
					<i class="icon-double-angle-right"></i>
					Notice
				</small>
			</h1>
		</div>
		<!--/.page-header-->
		<div class="row">
			<div class="col-xs-12">
			
			<!--PAGE CONTENT BEGINS-->
				<cfif structKeyExists(session,'admin_id') and trim(session.admin_id) neq "">
					
					<!--reply update-->
					<cfif structKeyExists(form, 'is_reply') and trim(form.is_reply) neq "">
						<cfquery datasource="mykickcloud" name="post">
							insert into board_notice(memo,
													name,
													email,
													reg_date,
													is_reply,
													father
													)
							values ('#form.memo#',
									'#form.name#',
									'#form.email#',
									'#form.reg_date#',
									'#form.is_reply#',
									'#form.father#')
						</cfquery>
						
					</cfif>
					
					<!--reply update end-->
					
					

					<cfquery datasource="mykickcloud" name="getMember">
						select *
						from members
						where members_id = #session.admin_id#
					</cfquery>
					
					<cfquery datasource="mykickcloud" name="getGame">
						select *
						from board_notice
						where num = #url.vid#
					</cfquery>
					
					<cfset newHit = #getGame.hit# + 1>
						
					<cfquery datasource="mykickcloud" name="updateHit">
						update board_notice
						set hit = #newHit#
						where num = #url.vid#
					</cfquery>
					
					<cfoutput>
							<h3 class="header smaller lighter blue">#getGame.subject#</h3>
					
					
					<div id="id-message-content">
						<div class="message-header clearfix">
							<div class="pull-left">
							

								<div class="space-4"></div>

								<i class="icon-star orange2 mark-star"></i>

								&nbsp;
								<img class="middle" alt="John's Avatar" src="assets/avatars/avatar.png" width="32" />
								&nbsp;
								#getGame.name#

								&nbsp;
								<i class="icon-time bigger-110 orange middle"></i>
								<span class="time">#getGame.reg_date#</span>
							</div>

							<div class="action-buttons pull-right">
								<a href="">
									<i class="icon-trash red icon-only bigger-130"></i>
								</a>
							</div>
						</div>

						<div class="hr hr-double"></div>

						<div class="message-body">
							#getGame.memo#
						</div>
							
						<div class="hr hr-double"></div>
						
						<div class="message-body">
							<h4 class="smaller lighter blue">Comment :</h4>
							<cfform action="notice_view.cfm?vid=#getGame.num#" name="postComment">
								
								<div class="col-xs-10 pull-left">
								<textarea class="form-control limited" id="form-field-9" maxlength="150" name="memo"></textarea>
								</div>
								
								<cfset register_date = #DateFormat(now(), "mm/dd/yyyy")#>
								<cfinput type="hidden" name="name" value="#getMember.nick_name#">
								<cfinput type="hidden" name="email" value="#getMember.email_address#">
								<cfinput type="hidden" name="is_reply" value="1">
								<cfinput type="hidden" name="father" value="#getGame.id#">
								<cfinput type="hidden" name="reg_date" value="#register_date#">

								
								<div class="pull-left">
									<button class="btn btn-sm btn-write pull-right">
										<i class="icon-pencil"></i>
										ADD REPLY
									</button>
								</div>
								
								
								
							</cfform>
						</div>
					</div>
					</cfoutput>	
				
				<!--reply list-->
						<cfquery datasource="mykickcloud" name="getReply">
							select *
							from board_notice
							where is_reply = '1' and father = '#getGame.id#'
							order by id desc
						</cfquery>
						
						<cfif getReply.RecordCount neq "0">
						<br>
						<br>
						<br>
						<div class="message-body">
							<h4 class="header smaller lighter blue">Comment List :</h4>
						</div>
						
						<cfloop query="getReply">
						<cfoutput>
						<!--div class="message-header clearfix">
							<div class="pull-left">
							

								<div class="space-4"></div>


								&nbsp;
								<img class="middle" alt="John's Avatar" src="assets/avatars/avatar.png" width="32" />
								&nbsp;
								#name#

								&nbsp;
								<i class="icon-time bigger-110 orange middle"></i>
								<span class="time green">#reg_date#</span>
							</div>
						
							
							<div class="col-xs-7">
							#memo#
							</div>
						</div-->
						
						<div class="itemdiv dialogdiv">
							<div class="user">
								<img alt="Alexa's Avatar" src="assets/avatars/avatar1.png" />
							</div>

							<div class="body">
								<div class="time">
									<i class="icon-time"></i>
									<span class="green">#reg_date#</span>
								</div>

								<div class="name">
									<strong class="orange">#name#</strong>
								</div>
								<div class="text">#memo#</div>

								<div class="tools">
								
								</div>
							</div>
						</div>

						<!--div class="hr hr-double"></div-->

						</cfoutput>
						</cfloop>
						
						</cfif>
				
						
						<!--reply list end-->
								
					
					
			

				<cfelse>
					session time out
				</cfif>


			<!--PAGE CONTENT ENDS-->
			</div><!--/.span-->
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->

	
	</div><!--/.main-content-->
</div><!--/.main-container-->

		

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
<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="assets/js/jquery.sparkline.min.js"></script>
<script src="assets/js/flot/jquery.flot.min.js"></script>
<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="assets/js/flot/jquery.flot.resize.min.js"></script>


<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>

<!-- ace scripts -->

<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
	jQuery(function($) {
		var oTable1 = $('#sample-table-2').dataTable( {
		"aoColumns": [
	      { "bSortable": false },
	      null, null,null, null, null,
		  { "bSortable": false }
		] } );
		
		
		$('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
				$(this).closest('tr').toggleClass('selected');
			});
				
		});
	
	
		$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
		function tooltip_placement(context, source) {
			var $source = $(source);
			var $parent = $source.closest('table')
			var off1 = $parent.offset();
			var w1 = $parent.width();
	
			var off2 = $source.offset();
			var w2 = $source.width();
	
			if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
			return 'left';
		}
	})
</script>
</body>
</html>
