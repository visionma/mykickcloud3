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
								member list
							</small>
						</h1>
					</div>

				<div class="row">
					<div class="col-xs-12">
								
<!--- PAGE CONTENT BEGINS --->


<cfif structKeyExists(session,'school_id') and trim(session.school_id) neq "">					
<cfquery datasource="mykickcloud" name="getMember" > 
	select * 
	from members 
	where school_id = '#session.school_id#'
	order by firstname
</cfquery>



<cfif getMember.RecordCount eq 0>
	
0 member

<cfelse>

<cfset memberAge = DateDiff("yyyy", #getMember.birthday#, now())>
	
	
<div class="table-responsive">
	<table id="forum_table"  class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				
				<th class="center">NAME</th>
				<th>ADDRESS</th>
				<th>EMAIL</th>
				<th class="center">PHONE</th>
				<th class="center">GENDER / AGE</th>
				<th>Belt</th>
				<th>Weight</th>
			</tr>
		</thead>

		<tbody>
		<cfloop query="getMember">
			<cfoutput>
			
			<tr>
				<td><a href="member_detail.cfm?mid=#members_id#">#firstname# #lastname#</a></td>
				<td>#member_address# #member_address2#, #member_city#</td>
				<td>#email_address#</td>
				<td class="center">#member_phone#</td>
				<td class="center">#member_gender# / #memberAge# </td>
				<td>#member_belt#</td>
				<td>#member_weight# #weight_type#</td>
			</tr>
			</cfoutput>
		</cfloop>
		</tbody>
	</table>
</div>





</cfif>




<cfelse>
	session time out
</cfif>


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
		