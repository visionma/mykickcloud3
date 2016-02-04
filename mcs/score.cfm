<cfinclude template="header.cfm" >
<cfinclude template="sidebar.cfm" >

		
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i>
				<a href="">Home</a>
				<span class="divider">
				<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">Profile</li>
			
		</ul>
			
			<div class="nav-search" id="nav-search">
				<form class="form-search">
					<span class="input-icon">
						<input type="text" placeholder="Search ..." 
						class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
						<i class="icon-search nav-search-icon"></i>
					</span>
				</form>
			</div><!--#nav-search-->
	</div><!--.breadcrumb-->
	
	
	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				History
					
			</h1>
		</div><!--/.page-header-->

		<div class="row">
		<div class="col-xs-12">

			<!--PAGE CONTENT BEGINS-->

							

<cfset memberAge = DateDiff("yyyy", #getUser.birthday#, now())>
					


<cfquery name="getPlay" datasource="mykickcloud">
	select *
	from player
	where members_id = '#session.user_id#'
</cfquery>


<div class="page-content">
	<div class="row">
		<div class="col-xs-12">

			<div class="table-header">
				Results for "Latest Tournament"
			</div>

				<div class="table-responsive">
					<table id="sample-table-2" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th width="30%">Game</th>
								<th width="20%">School</th>
								<th class="hidden-480">Game Type</th>
								<th>
									<i class="icon-time bigger-110 hidden-480"></i>
									Date
								</th>
								<th class="hidden-480">Status</th>
								<th>Point</th>
								<th></th>
							</tr>
						</thead>

						<tbody>

							<cfoutput query="getPlay">
							<tr>
								<td>
									<a href="">#game_id#</a>
								</td>
								<td>#school_id#</td>
								<td></td>
								<td></td>
								<td>
									<span class="label label-sm label-warning">Expiring</span>
								</td>
								<td></td>
								<td></td>
							</tr>
							</cfoutput>

						</tbody>
					</table>
				</div>
		</div>
	</div>
</div>






<!--PAGE CONTENT ENDS-->
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->

			</div><!--/.main-content-->




		<!--basic scripts-->

		<!--[if !IE]>-->

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
