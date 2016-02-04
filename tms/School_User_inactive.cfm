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
								manage school user
								<i class="icon-double-angle-right"></i>
								user list
							</small>
						</h1>
					</div>

				<div class="row">
					<div class="col-xs-12">
								
<!--- PAGE CONTENT BEGINS --->

				

<cfquery name="school_user_list" datasource="mykickcloud" >
    select *
    from school_user
    where is_active = '2'
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
				<th class="center">NAME</th>
				<th>TYPE</th>
				<th>EMAIL</th>
				<th class="center">IS ACTIVE?</th>
				<th class="center">REGISTER DATE</th>
				<th></th>
			</tr>
		</thead>

		<tbody>
		<cfloop query="school_user_list">
			<cfoutput>

				<cfquery name="getSchool_type" datasource="mykickcloud">
					select *
					from school_user_type
					where id = '#school_user_list.school_user_type_id#'
				</cfquery>

			
			<tr>
				<td class="center">
					
				</td>
				<td>#name#</td>
				<td>#getSchool_type.role#</td>
				<td>#email#</td>
				<td class="center">
					<cfif #is_active# EQ '1'>
						YES
					<cfelse>
						NO
					</cfif>

				</td>
				<td class="center">#register_date# </td>
				<td>
					<a href="school_user_activate.cfm?id=#id#" class="btn btn-minier btn-success">Activate</a> 
				</td>
			</tr>
			</cfoutput>
		</cfloop>
		</tbody>
	</table>
</div>









<!--- PAGE CONTENT ENDS --->










</div>

		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>


		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>


		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

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
		