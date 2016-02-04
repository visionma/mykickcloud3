<cfinclude template="header.cfm">
<cfinclude template="sidebar.cfm">



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
						<li class="active">Member List</li>
					</ul>

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div>
				</div>
					<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							Dashboard
							<small>
								<i class="icon-double-angle-right"></i>
								manage member
								<i class="icon-double-angle-right"></i>
								player list
							</small>
						</h1>
					</div>

					<div class="row-fluid">
						<div class="span12">
<!--- PAGE CONTENT BEGINS --->
<cfif isDefined("session.school_id")>	
	
<cfquery datasource="mykickcloud" name="getPlayer" > 
	select * 
	from player 
	where school_id = '#url.sid#'
		and game_id = '#url.gid#'
</cfquery>
				

<cfquery datasource="mykickcloud" name="getGame" > 
	select * 
	from game 
	where game_id = '#url.gid#'
</cfquery>

<cfoutput>
<div class="col-xs-12">
<blockquote class="pull-left">
<p>Player List of <b style="color:red;">#getGame.game_title#</b></p>
</blockquote>
</div>
</cfoutput>

<div class="row">
<cfoutput query="getPlayer">

<cfquery datasource="mykickcloud" name="getMember" > 
	select * 
	from members 
	where members_id = '#members_id#'
</cfquery>
<cfquery datasource="mykickcloud" name="getSubgame" > 
	select * 
	from Sub_game 
	where sub_game_id = '#getPlayer.sub_game_id#'
</cfquery>


	<div class="col-sm-9">
		<div class="dd" id="nestable">
			<ol class="dd-collapsed dd-list">
				<li class="dd-item dd2-item" data-id="1">
						<div class="dd-handle dd2-handle">
							<cfif '#getMember.member_gender#' eq 'male'>
							<i class="normal-icon icon-male blue bigger-130"></i>
							<cfelse>
							<i class="normal-icon icon-female red bigger-130"></i>
							</cfif>
							<i class="drag-icon icon-move bigger-125"></i>
						</div>
						<div class="dd-handle dd2-content">
						<span class="orange">#getSubgame.game_type#</span> |
						<span class="lighter grey">
						#getMember.firstname# #getMember.lastname#
						</span>
						<a href="member_deactivate.cfm?ID=#getMember.members_id#">
						<span class="sticker">
						<span class="label label-success arrowed-in">
							<i class="icon-ok bigger-110"></i>
						</span>
						</span>
						</a>
						</div>
						<ol class="dd-list">
							<li class="dd-item dd2-item item-red" data-id="2">
								<div class="dd-handle dd2-handle">
									<i class="normal-icon icon-home bigger-130"></i>
									<i class="drag-icon icon-move bigger-125"></i>
								</div>
								<div class="dd-handle dd2-content">
									<span class="blue">Address</span> : 
									<span class="lighter grey">
									#getMember.member_address# #getMember.member_address2# #getMember.member_city#
									</span>
								</div>
							</li>
							<li class="dd-item dd2-item item-orange" data-id="3">
								<div class="dd-handle dd2-handle">
									<i class="normal-icon icon-phone bigger-130"></i>
									<i class="drag-icon icon-move bigger-125"></i>
								</div>
								<div class="dd-handle dd2-content">
									<span class="blue">Phone</span> : 
									<span class="lighter grey">
									#getMember.member_phone#
									</span>
								</div>
							</li>
							<li class="dd-item dd2-item item-green" data-id="4">
								<div class="dd-handle dd2-handle">
									<i class="normal-icon icon-leaf bigger-130"></i>
									<i class="drag-icon icon-move bigger-125"></i>
								</div>
								<div class="dd-handle dd2-content">
									<span class="blue">Gender</span> : 
									<span class="lighter grey">
									#getMember.member_gender#
									</span>
								</div>
							</li>
							<li class="dd-item dd2-item item-blue" data-id="5">
								<div class="dd-handle dd2-handle">
									<i class="normal-icon icon-signal bigger-130"></i>
									<i class="drag-icon icon-move bigger-125"></i>
								</div>
								<cfset memberAge = DateDiff("yyyy", '#getMember.birthday#', now())>
								<div class="dd-handle dd2-content">
									<span class="blue">Age</span> : 
									<span class="lighter grey">
									#memberAge#
									</span>
								</div>
							</li>
							<li class="dd-item dd2-item item-red" data-id="6">
								<div class="dd-handle dd2-handle">
									<i class="normal-icon icon-download-alt bigger-130"></i>
									<i class="drag-icon icon-move bigger-125"></i>
								</div>
								<div class="dd-handle dd2-content">
									<span class="blue">Weigh</span> : 
									<span class="lighter grey">
									#getMember.member_weight#
									</span>
								</div>
							</li>
							<li class="dd-item dd2-item item-red" data-id="6">
								<div class="dd-handle dd2-handle">
									<i class="normal-icon icon-download-alt bigger-130"></i>
									<i class="drag-icon icon-move bigger-125"></i>
								</div>
								<div class="dd-handle dd2-content">
									<span class="blue">Belt</span> : 
									<span class="lighter grey">
									#getMember.member_belt#
									</span>
								</div>
							</li>
						</ol>
					</li>
				</ol>
			</div>
		</div>

</cfoutput>
	</div>







<cfelse>
	session time out
</cfif>


<!--PAGE CONTENT ENDS-->










<!--cfinclude template="footer.cfm"-->

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

		<script src="assets/js/jquery.nestable.min.js"></script>

		<!-- ace scripts -->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			jQuery(function($){
			
				$('.dd').nestable();
			
				$('.dd-handle a').on('mousedown', function(e){
					e.stopPropagation();
				});
				
				$('[data-rel="tooltip"]').tooltip();
			
			});
		</script>
	</body>
</html>






