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
			<li class="active">Forum</li>
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
					Forum
				</small>
			</h1>
		</div>
		<!--/.page-header-->
		<div class="row">
			<div class="col-xs-12">
			
			<!--PAGE CONTENT BEGINS-->
	

						<div class="row">
							<div class="col-xs-12">
								<h3 class="header blue lighter">
									Forum Write
								</h3>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-12">

								<!-- the wysiwyg form -->
								<form method="POST" action="forum_post.cfm" id="myform">
									
									<b>Subject : </b>
										<input  type="text" placeholder="Subject" name="subject" required="true" 
											message="Please enter subject" class="width-90"/>
									 
									<div class="space-4"></div>
									<div class="space-4"></div>
									
									<b>Body Message : </b><br>
									<div id="editor" class="wysiwyg-editor">
										
									</div>
									<!--hidden input-->
									<div>
										<cfquery datasource="mykickcloud" name="getNum">
										select max(num) as count
										from board_member
										</cfquery>
										
										<cfquery datasource="mykickcloud" name="getMember">
										select *
										from members
										where members_id = #session.user_id#
										</cfquery>
										
										<cfset register_date = #DateFormat(now(), "mm/dd/yyyy")#>
										
										<cfif #getNum.count# is ''>
											<cfset maxNum = 1>	
										<cfelse>
											<cfset maxNum = #getNum.count# + 1>
										</cfif>
										
										<cfoutput>
										<input type="hidden" name="memo" />
										<input type="hidden" name="num" value="#maxNum#">
										<input type="hidden" name="name" value="#getMember.nick_name#">
										<input type="hidden" name="email" value="#getMember.email_address#">
										<input type="hidden" name="reg_date" value="#register_date#">
										</cfoutput>
									</div>
									<!--hidden input end-->
									<div class="form-actions align-right clearfix">
										<button type="reset" class="pull-left btn">
											<i class="icon-retweet bigger-110"></i>
											Reset
										</button>

										<button type="submit" class="btn btn-primary pull-right">
											<i class="icon-ok bigger-110"></i>
											Submit
										</button>
									</div>
								</form>

							</div>
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
		
		<script src="assets/js/bootstrap.min.js"></script>
		
		<script src="assets/js/bootstrap-wysiwyg.min.js"></script>
		
		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		
		<script type="text/javascript">
			jQuery(function($) {
				$('#editor').ace_wysiwyg({
					toolbar:
					[
						{
							name:'font',
							title:'Custom tooltip',
							values:['Some Special Font!','Arial','Verdana','Comic Sans MS','Custom Font!']
						},
						null,
						{
							name:'fontSize',
							title:'Custom tooltip',
							values:{1 : 'Size#1 Text' , 2 : 'Size#1 Text' , 3 : 'Size#3 Text' , 4 : 
							'Size#4 Text' , 5 : 'Size#5 Text'} 
						},
						null,
						{name:'bold', title:'Custom tooltip'},
						{name:'italic', title:'Custom tooltip'},
						{name:'strikethrough', title:'Custom tooltip'},
						{name:'underline', title:'Custom tooltip'},
						null,
						'insertunorderedlist',
						'insertorderedlist',
						'outdent',
						'indent',
						null,
						{name:'justifyleft'},
						{name:'justifycenter'},
						{name:'justifyright'},
						{name:'justifyfull'},
						null,
						{
							name:'createLink',
							placeholder:'Custom PlaceHolder Text',
							button_class:'btn-purple',
							button_text:'Custom TEXT'
						},
						{name:'unlink'},
						null,
						{
							name:'insertImage',
							placeholder:'Custom PlaceHolder Text',
							button_class:'btn-inverse',
							//choose_file:false,//hide choose file button
							button_text:'Set choose_file:false to hide this',
							button_insert_class:'btn-pink',
							button_insert:'Insert Image'
						},
						null,
						{
							name:'foreColor',
							title:'Custom Colors',
							values:['red','green','blue','navy','orange'],
							/**
								You change colors as well
							*/
						},
						/**null,
						{
							name:'backColor'
						},*/
						null,
						{name:'undo'},
						{name:'redo'},
						null,
						'viewSource'
					],
					speech_button:false,//hide speech button on chrome
					
					'wysiwyg': {
						hotKeys : {} //disable hotkeys
					}
					
				}).prev().addClass('wysiwyg-style2');

				
				
				//handle form onsubmit event to send the wysiwyg's content to server
				$('#myform').on('submit', function(){
					
					//put the editor's html content inside the hidden input to be sent to server
					$('input[name=memo]' , this).val($('#editor').html());
					
					//but for now we will show it inside a modal box

					//$('#modal-wysiwyg-editor').modal('show');
					//$('#wysiwyg-editor-value').css({'width':'99%', 'height':'200px'}).val($('#editor').html());
					
					return true;
				});
				$('#myform').on('reset', function() {
					$('#editor').empty();
				});
				
				
			});
		</script>

	</body>
</html>
