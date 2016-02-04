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
			<li class="active">Add User</li>
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
						Add School User
						</small>
					</h1>
				</div>

				<div class="row">
					<div class="col-xs-12">

<!--- PAGE CONTENT BEGINS --->



		
		<cfform action="school_user_add2.cfm" class="form-horizontal" enctype="multipart/form-data" method="post">
			<div class="tabbable">
				<ul class="nav nav-tabs padding-16">
					<li class="active">
						<a data-toggle="tab" href="##edit-basic">
							<i class="green icon-edit bigger-125"></i>
							User Info
						</a>
					</li>
				</ul>

			<div class="tab-content profile-edit-tab-content">
				<div id="edit-basic" class="tab-pane in active">
					<h4 class="header blue bolder smaller">General</h4>

						<div class="row">
							

							<div class="col-xs-12 col-sm-8">

								<div class="form-group">
									<label class="col-sm-4 control-label no-padding-right">Name</label>

									<div class="col-sm-8">
										<cfinput name="name" class="col-xs-12 col-sm-10" type="text" 
										placeholder="name" required="yes" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-4 control-label no-padding-right">User Type</label>
									<div class="col-sm-8">

										<cfquery name="get_type" datasource="mykickcloud">
											select *
											from school_user_type
										</cfquery>

										<select name="school_user_type">
											<option value="" selected>Select User Type</option>
											<cfoutput query="get_type">
											<option value="#id#">#role#</option>
											</cfoutput>
										</select>
									</div>
								</div>

							</div>
						</div>

					
					

					

					<div class="space"></div>
					<h4 class="header blue bolder smaller">Contact</h4>

					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-email">Email</label>

						<div class="col-sm-9">
							<span class="input-icon input-icon-right">
								<cfinput name="email" type="email" required="yes"/>
								<i class="icon-envelope"></i>
							</span>
						</div>
					</div>

					

					<div class="space"></div>
					<h4 class="header blue bolder smaller">Access</h4>

					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-pass1">New Password</label>

						<div class="col-sm-9">
							<cfinput name="password" type="password" required="yes" />
						</div>
					</div>

					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-pass2">Confirm Password</label>

						<div class="col-sm-9">
							<cfinput name="password2" type="password" required="yes"/>
						</div>
					</div>
				</div>

				

			
			</div>
		</div>

		<div class="clearfix form-actions center">
				<cfoutput>
				<input type="hidden" name="school_id" value="#session.school_id#">
				</cfoutput>
				<button class="btn btn-warning" type="reset">
					<i class="icon-ok bigger-110"></i>
					RESET
				</button>

				<button class="btn btn-info" type="submit">
					<i class="icon-ok bigger-110"></i>
					SUBMIT
				</button>

			
		</div>
	</cfform>
			






<!--- PAGE CONTENT ENDS --->
						</div>
					</div>
				</div>

				

					
			</div>
	




			<script type="text/javascript">
				window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
			</script>


			<script type="text/javascript">
				if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
			</script>
			<script src="assets/js/bootstrap.min.js"></script>
			<script src="assets/js/typeahead-bs2.min.js"></script>

			<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
			<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
			<script src="assets/js/jquery.gritter.min.js"></script>
			<script src="assets/js/bootbox.min.js"></script>
			<script src="assets/js/jquery.slimscroll.min.js"></script>
			<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
			<script src="assets/js/jquery.hotkeys.min.js"></script>
			<script src="assets/js/bootstrap-wysiwyg.min.js"></script>
			<script src="assets/js/select2.min.js"></script>
			<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
			<script src="assets/js/fuelux/fuelux.spinner.min.js"></script>
			<script src="assets/js/x-editable/bootstrap-editable.min.js"></script>
			<script src="assets/js/x-editable/ace-editable.min.js"></script>
			<script src="assets/js/jquery.maskedinput.min.js"></script>


			<script src="assets/js/ace-elements.min.js"></script>
			<script src="assets/js/ace.min.js"></script>

			<script type="text/javascript">
				jQuery(function($) {

					//editables on first profile page
					$.fn.editable.defaults.mode = 'inline';
					$.fn.editableform.loading = "<div class='editableform-loading'><i class='light-blue icon-2x icon-spinner icon-spin'></i></div>";
				    $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="icon-ok icon-white"></i></button>'+
				                                '<button type="button" class="btn editable-cancel"><i class="icon-remove"></i></button>';    

					//editables 
				    $('#username').editable({
						type: 'text',
						name: 'username'
				    });


					var countries = [];
				    $.each({ "CA": "Canada", "IN": "India", "NL": "Netherlands", "TR": "Turkey", "US": "United States"}, function(k, v) {
				        countries.push({id: k, text: v});
				    });

					var cities = [];
					cities["CA"] = [];
					$.each(["Toronto", "Ottawa", "Calgary", "Vancouver"] , function(k, v){
						cities["CA"].push({id: v, text: v});
					});
					cities["IN"] = [];
					$.each(["Delhi", "Mumbai", "Bangalore"] , function(k, v){
						cities["IN"].push({id: v, text: v});
					});
					cities["NL"] = [];
					$.each(["Amsterdam", "Rotterdam", "The Hague"] , function(k, v){
						cities["NL"].push({id: v, text: v});
					});
					cities["TR"] = [];
					$.each(["Ankara", "Istanbul", "Izmir"] , function(k, v){
						cities["TR"].push({id: v, text: v});
					});
					cities["US"] = [];
					$.each(["New York", "Miami", "Los Angeles", "Chicago", "Wysconsin"] , function(k, v){
						cities["US"].push({id: v, text: v});
					});

					var currentValue = "NL";
				    $('#country').editable({
						type: 'select2',
						value : 'NL',
				        source: countries,
						success: function(response, newValue) {
							if(currentValue == newValue) return;
							currentValue = newValue;

							var new_source = (!newValue || newValue == "") ? [] : cities[newValue];

							//the destroy method is causing errors in x-editable v1.4.6
							//it worked fine in v1.4.5
							/**			
							$('#city').editable('destroy').editable({
								type: 'select2',
								source: new_source
							}).editable('setValue', null);
							*/

							//so we remove it altogether and create a new element
							var city = $('#city').removeAttr('id').get(0);
							$(city).clone().attr('id', 'city').text('Select City').editable({
								type: 'select2',
								value : null,
								source: new_source
							}).insertAfter(city);//insert it after previous instance
							$(city).remove();//remove previous instance

						}
				    });

					$('#city').editable({
						type: 'select2',
						value : 'Amsterdam',
				        source: cities[currentValue]
				    });



					$('#signup').editable({
						type: 'date',
						format: 'yyyy-mm-dd',
						viewformat: 'dd/mm/yyyy',
						datepicker: {
							weekStart: 1
						}
					});

				    $('#age').editable({
				        type: 'spinner',
						name : 'age',
						spinner : {
							min : 16, max:99, step:1
						}
					});

					//var $range = document.createElement("INPUT");
					//$range.type = 'range';
				    $('#login').editable({
				        type: 'slider',//$range.type == 'range' ? 'range' : 'slider',
						name : 'login',
						slider : {
							min : 1, max:50, width:100
						},
						success: function(response, newValue) {
							if(parseInt(newValue) == 1)
								$(this).html(newValue + " hour ago");
							else $(this).html(newValue + " hours ago");
						}
					});

					$('#about').editable({
						mode: 'inline',
				        type: 'wysiwyg',
						name : 'about',
						wysiwyg : {
							//css : {'max-width':'300px'}
						},
						success: function(response, newValue) {
						}
					});



					// *** editable avatar *** //
					try {//ie8 throws some harmless exception, so let's catch it

						//it seems that editable plugin calls appendChild, and as Image doesn't have it, it causes errors on IE at unpredicted points
						//so let's have a fake appendChild for it!
						if( /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ) Image.prototype.appendChild = function(el){}

						var last_gritter
						$('#avatar').editable({
							type: 'image',
							name: 'avatar',
							value: null,
							image: {
								//specify ace file input plugin's options here
								btn_choose: 'Change Avatar',
								droppable: true,
								/**
								//this will override the default before_change that only accepts image files
								before_change: function(files, dropped) {
									return true;
								},
								*/

								//and a few extra ones here
								name: 'avatar',//put the field name here as well, will be used inside the custom plugin
								max_size: 110000,//~100Kb
								on_error : function(code) {//on_error function will be called when the selected file has a problem
									if(last_gritter) $.gritter.remove(last_gritter);
									if(code == 1) {//file format error
										last_gritter = $.gritter.add({
											title: 'File is not an image!',
											text: 'Please choose a jpg|gif|png image!',
											class_name: 'gritter-error gritter-center'
										});
									} else if(code == 2) {//file size rror
										last_gritter = $.gritter.add({
											title: 'File too big!',
											text: 'Image size should not exceed 100Kb!',
											class_name: 'gritter-error gritter-center'
										});
									}
									else {//other error
									}
								},
								on_success : function() {
									$.gritter.removeAll();
								}
							},
						    url: function(params) {
								// ***UPDATE AVATAR HERE*** //
								//You can replace the contents of this function with examples/profile-avatar-update.js for actual upload


								var deferred = new $.Deferred

								//if value is empty, means no valid files were selected
								//but it may still be submitted by the plugin, because "" (empty string) is different from previous non-empty value whatever it was
								//so we return just here to prevent problems
								var value = $('#avatar').next().find('input[type=hidden]:eq(0)').val();
								if(!value || value.length == 0) {
									deferred.resolve();
									return deferred.promise();
								}


								//dummy upload
								setTimeout(function(){
									if("FileReader" in window) {
										//for browsers that have a thumbnail of selected image
										var thumb = $('#avatar').next().find('img').data('thumb');
										if(thumb) $('#avatar').get(0).src = thumb;
									}

									deferred.resolve({'status':'OK'});

									if(last_gritter) $.gritter.remove(last_gritter);
									last_gritter = $.gritter.add({
										title: 'Avatar Updated!',
										text: 'Uploading to server can be easily implemented. A working example is included with the template.',
										class_name: 'gritter-info gritter-center'
									});

								 } , parseInt(Math.random() * 800 + 800))

								return deferred.promise();
							},

							success: function(response, newValue) {
							}
						})
					}catch(e) {}



					//another option is using modals
					$('#avatar2').on('click', function(){
						var modal = 
						'<div class="modal hide fade">\
							<div class="modal-header">\
								<button type="button" class="close" data-dismiss="modal">&times;</button>\
								<h4 class="blue">Change Avatar</h4>\
							</div>\
							\
							<form class="no-margin">\
							<div class="modal-body">\
								<div class="space-4"></div>\
								<div style="width:75%;margin-left:12%;"><input type="file" name="file-input" /></div>\
							</div>\
							\
							<div class="modal-footer center">\
								<button type="submit" class="btn btn-small btn-success"><i class="icon-ok"></i> Submit</button>\
								<button type="button" class="btn btn-small" data-dismiss="modal"><i class="icon-remove"></i> Cancel</button>\
							</div>\
							</form>\
						</div>';


						var modal = $(modal);
						modal.modal("show").on("hidden", function(){
							modal.remove();
						});

						var working = false;

						var form = modal.find('form:eq(0)');
						var file = form.find('input[type=file]').eq(0);
						file.ace_file_input({
							style:'well',
							btn_choose:'Click to choose new avatar',
							btn_change:null,
							no_icon:'icon-picture',
							thumbnail:'small',
							before_remove: function() {
								//don't remove/reset files while being uploaded
								return !working;
							},
							before_change: function(files, dropped) {
								var file = files[0];
								if(typeof file === "string") {
									//file is just a file name here (in browsers that don't support FileReader API)
									if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
								}
								else {//file is a File object
									var type = $.trim(file.type);
									if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
											|| ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
										) return false;

									if( file.size > 110000 ) {//~100Kb
										return false;
									}
								}

								return true;
							}
						});

						form.on('submit', function(){
							if(!file.data('ace_input_files')) return false;

							file.ace_file_input('disable');
							form.find('button').attr('disabled', 'disabled');
							form.find('.modal-body').append("<div class='center'><i class='icon-spinner icon-spin bigger-150 orange'></i></div>");

							var deferred = new $.Deferred;
							working = true;
							deferred.done(function() {
								form.find('button').removeAttr('disabled');
								form.find('input[type=file]').ace_file_input('enable');
								form.find('.modal-body > :last-child').remove();

								modal.modal("hide");

								var thumb = file.next().find('img').data('thumb');
								if(thumb) $('#avatar2').get(0).src = thumb;

								working = false;
							});


							setTimeout(function(){
								deferred.resolve();
							} , parseInt(Math.random() * 800 + 800));

							return false;
						});

					});



					//////////////////////////////
					$('#profile-feed-1').slimScroll({
					height: '250px',
					alwaysVisible : true
					});

					$('.profile-social-links > a').tooltip();

					$('.easy-pie-chart.percentage').each(function(){
					var barColor = $(this).data('color') || '#555';
					var trackColor = '#E2E2E2';
					var size = parseInt($(this).data('size')) || 72;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate:false,
						size: size
					}).css('color', barColor);
					});

					///////////////////////////////////////////

					//show the user info on right or left depending on its position
					$('#user-profile-2 .memberdiv').on('mouseenter', function(){
						var $this = $(this);
						var $parent = $this.closest('.tab-pane');

						var off1 = $parent.offset();
						var w1 = $parent.width();

						var off2 = $this.offset();
						var w2 = $this.width();

						var place = 'left';
						if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) place = 'right';

						$this.find('.popover').removeClass('right left').addClass(place);
					}).on('click', function() {
						return false;
					});


					///////////////////////////////////////////
					$('#user-profile-3')
					.find('input[type=file]').ace_file_input({
						style:'well',
						btn_choose:'Change avatar',
						btn_change:null,
						no_icon:'icon-picture',
						thumbnail:'large',
						droppable:true,
						before_change: function(files, dropped) {
							var file = files[0];
							if(typeof file === "string") {//files is just a file name here (in browsers that don't support FileReader API)
								if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
							}
							else {//file is a File object
								var type = $.trim(file.type);
								if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
										|| ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
									) return false;

								if( file.size > 110000 ) {//~100Kb
									return false;
								}
							}

							return true;
						}
					})
					.end().find('button[type=reset]').on(ace.click_event, function(){
						$('#user-profile-3 input[type=file]').ace_file_input('reset_input');
					})
					.end().find('.date-picker').datepicker().next().on(ace.click_event, function(){
						$(this).prev().focus();
					})
					$('.input-mask-phone').mask('(999) 999-9999');



					////////////////////
					//change profile
					$('[data-toggle="buttons"] .btn').on('click', function(e){
						var target = $(this).find('input[type=radio]');
						var which = parseInt(target.val());
						$('.user-profile').parent().addClass('hide');
						$('#user-profile-'+which).parent().removeClass('hide');
					});
				});
			</script>
		</body>
	</html>
