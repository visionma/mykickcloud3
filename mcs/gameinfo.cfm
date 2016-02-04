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
			<li class="active">Game Info</li>
		</ul>

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon">
					<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div><!--.breadcrumb-->
	
				
	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				Game Info
				<small>
					<i class="icon-double-angle-right"></i>
					List
				</small>
			</h1>
		</div><!--/.page-header-->
		<div class="row">
			<div class="col-xs-12">
			
				<!--PAGE CONTENT BEGINS-->
					
					

						<!--get game list of the school-->				
						<cfquery datasource="mykickcloud" name="getList" > 
							select * 
							from game 
							where is_active = 'on'
							order by start_date desc
						</cfquery>


<div class="table-responsive">
	<table id="forum_table"  class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th class="center">
					<label>
						
						<span class="lbl"></span>
					</label>
				</th>
				<th class="center">Game Size</th>
				<th>Title</th>
				<th>School</th>
				<th class="center">Date</th>
				<th class="center">Player</th>
				<th></th>
			</tr>
		</thead>

		<tbody>
		<cfloop query="getList">
			<cfoutput>
			<!--get player of the game - query inside of output to loop the list-->
			<cfquery datasource="mykickcloud" name="getPlayer" > 
				select * 
				from player 
				where game_id = '#getList.game_id#'
			</cfquery>


				<cfquery datasource="mykickcloud" name="getSchool">
					select *
					from school
					where school_id = '#getList.school_id#'
				</cfquery>
			<tr>
				<td class="center">
					<label>
						<i class="icon-caret-right bigger-130 green"></i>
						<span class="lbl"></span>
					</label>
				</td>
				<td class="center">
					<cfif '#game_size#' eq 'i'>
					International
					<cfelseif '#game_size#' eq 'n'>
					Nationwide
					<cfelseif '#game_size#' eq 'la'>
					Local A
					<cfelseif '#game_size#' eq 'lb'>
					Local B
					<cfelse>
					Local C 
					</cfif>
				</td>
				
				<td>
					<cfif '#is_active#' eq 'on'>
					<a href="game_detail.cfm?gid=#getList.game_id#&sid=#getList.school_id#">
					<span class="green">
					#game_title#</span></a>
					<cfelse>
					<span class="lighter grey">
					#game_title#</span>
					</cfif>	
					</a>
				</td>
				<td>#getSchool.school_name#</td>
				<td class="center">#DateFormat(start_date, "mm/dd/yyyy")# ~ #DateFormat(end_date, "mm/dd/yyyy")#</td>
				<td class="center">#getPlayer.recordcount# </td>
				<td><i class="icon-caret-left bigger-130 green"></i></td>
			</tr>
			</cfoutput>
		</cfloop>
		</tbody>
	</table>
</div>




						


						<!--PAGE CONTENT ENDS-->
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->


				</div><!--/.main-content-->




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

				<script src="assets/js/jquery.dataTables.min.js"></script>
				<script src="assets/js/jquery.dataTables.bootstrap.js"></script>

				<!-- ace scripts -->

				<script src="assets/js/ace-elements.min.js"></script>
				<script src="assets/js/ace.min.js"></script>

				<!-- inline scripts related to this page -->

				<script type="text/javascript">
					jQuery(function($) {
						var oTable1 = $('#forum_table').dataTable( {
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
