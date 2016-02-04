<cfinclude template="header.cfm">
<cfinclude template="sidebar.cfm">



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
						<li class="active">Member List</li>
					</ul><!--.breadcrumb-->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div><!--#nav-search-->
				</div>
					<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							Dashboard
							<small>
								<i class="icon-double-angle-right"></i>
								manage member
								<i class="icon-double-angle-right"></i>
								member list
							</small>
						</h1>
					</div><!--/.page-header-->

				<div class="row">
					<div class="col-xs-12">
								
<!--PAGE CONTENT BEGINS-->




					
<cfquery datasource="mykickcloud" name="getDivision" > 
	select * 
	from game_size
</cfquery>




		<h3 class="header smaller lighter blue">Division List</h3>
	

		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="5%">Order</th>
						<th class="center">
							Division
						</th>
						<th class="center">Detail</th>
						<th><a href="division_new.cfm" class="btn btn-xs btn-danger">CREATE NEW</th>
					</tr>
				</thead>

				<tbody>
					
				<cfoutput query="getDivision">


					<tr>
						<td class="center">#order#</td>
						<td class="center">
							<strong>#size#</strong>
						</td>
						<td>#detail#</td>
						<td>
							<cfquery name="checkBeltGroup" datasource="mykickcloud">
								select *
								from division_belt
								where game_size = '#getDivision.id#' 
							</cfquery>

							<cfif checkBeltGroup.RecordCount eq 0>
								<a href="division_belt_add.cfm?id=#id#" class="btn btn-xs">ADD BELT GROUP</a>
							<cfelse>
								<a href="division_belt_add.cfm?id=#id#" class="btn btn-xs">EDIT</a>
							</cfif>
							
						</td>
					</tr>
					
				</cfoutput>
						
				</tbody>
			</table>
		</div>
	</div>
</div>





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

		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>

		<!-- ace scripts -->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			jQuery(function($) {
				var oTable1 = $('#member_table').dataTable( {
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
		