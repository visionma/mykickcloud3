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
            <li class="active">Manage Member</li>
          </ul>


        </div>
          <div class="page-content">
          <div class="page-header position-relative">
            <h1>
              Dashboard
              <small>
                <i class="icon-double-angle-right"></i>
                manage memeber
                <i class="icon-double-angle-right"></i>
                add player
              </small>
            </h1>
          </div>

          <div class="row">
              <div class="col-xs-12">
              <!---PAGE CONTENT BEGINS--->
<cfquery datasource="mykickcloud" name="getGame" >
  select *
  from game
  where game_id = '#url.gid#'
      and school_id = '#url.sid#'
</cfquery>
<cfquery datasource="mykickcloud" name="getSubgame" >
  select *
  from sub_game
  where game_id = '#url.gid#'
      and school_id = '#url.sid#'
      and sub_game_id = '#url.sgid#'
</cfquery>


<cfoutput>
<div class="col-xs-12" align="center">
<blockquote class="pull-left">
<p>
  <span class="label label-lg label-pink arrowed-right">#getGame.game_title#</span>
  <span class="label label-lg label-yellow arrowed-in"> #getSubgame.game_type# </span>
  <span class="label label-lg label-yellow"> #getSubgame.game_belt# </span>
  <span class="label label-lg label-yellow"> #getSubgame.game_gender# </span>
  <span class="label label-lg label-yellow"> Age : #getSubgame.game_age# </span>
  <span class="label label-lg label-yellow">Weight : #getSubgame.game_weight# lb</span></p>
</blockquote>
</div>
</cfoutput>

<cfform class="form-horizontal" name="newGame" action="addplayer2.cfm">

<div class="col-xs-12">

  <div class="form-group">
    <label class="col-sm-2" align="right">
      First Name
    </label>
    <div class="col-sm-2">
      <cfinput type="text" placeholder="First Name" name="firstname" required="true"/>
    </div>

    <label class="col-sm-2" align="right">
      Last Name
    </label>
    <div class="col-sm-2">
      <cfinput type="text" placeholder="Last Name" name="lastname" required="true"/>
    </div>
  </div>


<div class="space-4"></div>

  <div class="form-group">
    <label class="col-sm-2" align="right">
      Nick Name
    </label>
    <div class="col-sm-2">
      <cfinput type="text"  placeholder="Nick Name" name="nick_name" required="true"/>
    </div>
    <label class="col-sm-2" align="right">
      Email
    </label>
    <div class="col-sm-2">
      <cfinput type="text"  placeholder="Email" name="email_address" required="Yes"/>
    </div>
  </div>



<div class="space-4"></div>

<div class="form-group">
  <label class="col-sm-2" align="right">
    Password
  </label>
  <div class="col-sm-2">
    <cfinput type="text" placeholder="Password" name="password" required="true" />
  </div>
  <label class="col-sm-2" align="right">
    Re-Password
  </label>
  <div class="col-sm-2">
    <cfinput type="password" placeholder="Password2" name="password2" required="true"/>
  </div>
</div>



<div class="space-4"></div>
<cfquery datasource="mykickcloud" name="getSchool">
  select *
  from school
</cfquery>
<div class="form-group">
  <label class="col-sm-2" align="right">
    School
  </label>
  <div class="col-sm-2">
    <cfselect name="school_name" id="form-field-select-1">
      <option value="">Select Your School</option>
      <cfoutput query="getSchool">
      <option value="#school_name#">#school_name#</option>
      </cfoutput>
    </cfselect>
  </div>
  <label class="col-sm-2" align="right">
    Belt
  </label>
  <div class="col-sm-2">
    <cfselect name="member_belt" id="form-field-select-1">
      <option value="">Select Belt Color</option>
      <option value="Balck">Black</option>
      <option value="White">White</option>
      <option value="Yellow">Yellow</option>
      <option value="Green">Green</option>
      <option value="Blue">Blue</option>
      <option value="Red">Red</option>
    </cfselect>
  </div>
</div>

<div class="space-4"></div>

<div class="form-group">
  <label class="col-sm-2" align="right">
    Address
  </label>
  <div class="col-sm-2">
    <cfinput type="text" placeholder="Address 1" name="member_address" required="true"/>
  </div>
  <label class="col-sm-2" align="right">
    Address 2
  </label>
  <div class="col-sm-2">
    <cfinput type="text" placeholder="Address 2" name="member_address2"/>
  </div>
</div>



<div class="space-4"></div>

<div class="form-group">
  <label class="col-sm-2" align="right">
    City
  </label>
  <div class="col-sm-2">
    <cfinput type="text" placeholder="City" name="member_city" required="true"/>
  </div>
  <label class="col-sm-1" align="right">
    State
  </label>
  <div class="col-sm-2">
    <select name="member_state">
    <cfinclude template="states.cfm">
    </select>
  </div>
  <label class="col-sm-1" align="right">
    Zip
  </label>
  <div class="col-sm-1">
    <cfinput type="text" mask="9999" size="5" placeholder="Zip" name="member_zip" required="true"/>
  </div>
</div>


<div class="space-4"></div>

    <div class="form-group">
      <label class="col-sm-2" align="right">
        Contact Phone
      </label>
      <div class="col-sm-2">
        <div class="input-group">
        <span class="input-group-addon">
          <i class="icon-phone bigger-110"></i>
        </span>
        <cfinput type="text" size="12" mask="999-999-9999" name="member_phone" required="true"/>
        </div>
      </div>
      <label class="col-sm-1" align="right">
        Birthdate
      </label>
      <div class="col-sm-2">
        <div class="input-group">
          <span class="input-group-addon">
            <i class="icon-calendar bigger-110"></i>
          </span>
          <cfinput  size="10"  type="text" mask="99/99/9999" name="birthday"/>
        </div>
      </div>
      <label class="col-sm-1" align="right">
        Gender
      </label>
      <div class="col-sm-1">
        <cfinclude template="gender.cfm">
      </div>
    </div>




<div class="space-4"></div>

<div class="form-group">
  <label class="col-sm-2" align="right">Weight</label>
    <div class="col-sm-2">
      <cfinput type="text" mask="999" size="3" name="member_weight" required="true"/> lb
    </div>
</div>

<div class="space-4"></div>


<cfoutput>
<input type="hidden" name="game_id" value="#url.gid#">
<input type="hidden" name="school_id" value="#url.sid#">
<input type="hidden" name="sub_game_id" value="#url.sgid#">
<input type="hidden" name="is_active" value="Y">
<input type="hidden" name="is_player" value="Y">
</cfoutput>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right" for="form-field-1"></label>
        <div class="col-sm-9">
        <button class="btn btn-info" type="submit">
        <i class="icon-ok bigger-110"></i>
        Submit
        </button>
&nbsp; &nbsp; &nbsp;
        <button class="btn" type="reset">
        <i class="icon-undo bigger-110"></i>
        Reset
        </button>
        </div>
    </div>
  </cfform>


      <!---PAGE CONTENT ENDS--->
            </div>
          </div>
        </div>

</div>


<cfinclude template="footer.cfm" >