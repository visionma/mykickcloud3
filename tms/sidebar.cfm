		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				

					<ul class="nav nav-list">
						<li class="active">
							<a href="index.cfm">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> Dashboard </span>
							</a>
						</li>
						
						
						<li>
							<a href="school_info.cfm" class="dropdown-toggle">
								<i class="icon-pencil"></i>
								<span class="menu-text"> Manage School </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
									<li>
										<a href="School_info.cfm">
											<i class="icon-double-angle-right"></i>
											School Info
										</a>
									</li>
									<li>
										<a href="School_gallery.cfm">
											<i class="icon-double-angle-right"></i>
											Gallery
										</a>
									</li>
								<cfif #getschool_user.school_user_type_id# EQ '1'>
									<li>
										<a href="School_User_list.cfm">
											<i class="icon-double-angle-right"></i>
											User List
										</a>
									</li>
									<li>
										<a href="School_User_inactive.cfm">
											<i class="icon-double-angle-right"></i>
											Inactive List
										</a>
									</li>
									</cfif>
								</ul>



						</li>
						<li>
							<a href="member_list.cfm" class="dropdown-toggle">
								<i class="icon-group"></i>
								<span class="menu-text"> Manage Member </span>
							</a>
						</li>
						
						
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-list"></i>
								<span class="menu-text"> Manage Game </span>
								<b class="arrow icon-angle-down"></b>
							</a>
								<ul class="submenu">
									<li>
										<a href="makegame.cfm">
											<i class="icon-double-angle-right"></i>
											Create Game
										</a>
									</li>
									<li>
										<a href="listgame.cfm">
											<i class="icon-double-angle-right"></i>
											List Games
										</a>
									</li>
									
									<li>
										<a href="game_past.cfm">
											<i class="icon-double-angle-right"></i>
											Past Games
										</a>
									</li>
									
								</ul>
						</li>
						
						<li>
							<a href="forum.cfm">
								<i class="icon-file"></i>
								<span class="menu-text"> Forum </span>
							</a>
						</li>
					</ul>
				</li>
			</ul>

		<div class="sidebar-collapse" id="sidebar-collapse">
			<i class="icon-double-angle-left"></i>
		</div>
	</div>
</div>