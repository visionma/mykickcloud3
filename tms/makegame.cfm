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
      <li class="active">Manage Games</li>
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
      manage game
      <i class="icon-double-angle-right"></i>
      create game
      </small>
    </h1>
  </div>

  <div class="row">
    <div class="col-xs-12">
      <!--- PAGE CONTENT BEGINS --->

<cfform class="form-horizontal" name="newGame" action="makegame2.cfm">




<div class="row">

  <div class="col-sm-4">

    <div class="widget-box">
      <div class="widget-header widget-header-flat">
        <h4>Basic Information</h4>
      </div>

      <div class="widget-body" align="center">


    <br>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Game Title</label>
      <span>
      <cfinput type="text" placeholder="Title" name="game_title" required="true" message="Please enter Game Title"/>
      </span>
    </div>

    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Game Size</label>

      <cfquery name="getGameSize" datasource="mykickcloud">
        select *
        from game_size
      </cfquery>

      <cfselect name="game_size" query="getGameSize" value="id" display="size">
      </cfselect>
      <span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="Define your game size to help estimate supply and etc" title="Size of your game">?</span>
    </div>

    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Ring Size</label>
      <select name="ring_size">
        <option value="">Select Ring Size</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
      </select>
        <span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="Define numbers of Rings you are going to use" title="Number of Ring">?</span>
    </div>

    <!---div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Game Style</label>
      <select name="game_style">
        <option value="">Select Game Style</option>
        <option value="local">Local</option>
        <option value="usta">USTA</option>
        <option value="wtf">WTF</option>
      </select>
    </div--->

    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Start Date</label>
      <cfinput  type="date" name="start_date" required="true"/>
    </div>
    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">End Date</label>
      <cfinput  type="date" name="end_date" required="true"/>
    </div>

    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Start Time</label>
      <cfinput  type="time" name="start_time" mask="hh:mm" required="true">
    </div>
    <br>
    </div>
  </div>
</div>




    <!------------------------------>
    <!------------------------------>
    <!------------------------------>

  <div class="col-sm-4">

    <div class="widget-box">
      <div class="widget-header widget-header-flat">
        <h4>Choose division</h4>
      </div>

      <div class="widget-body" align="center">


    <br>


    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Form</label>
      <input name="is_fp" id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" />
      <span class="lbl"></span>
      <cfinput class="col-xs-2" placeholder="$ 00" type="text" mask="999" name="1_price">
      <span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="Set your price for participating Form/Poomse" title="Set price">?</span>
    </div>
    <div class="space-4"></div>
    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Sparring</label>
      <input name="is_sg" id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" />
      <span class="lbl"></span>
      <cfinput class="col-xs-2" placeholder="$ 00"  type="text" mask="999" name="2_price">
      <span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="Set your price for participating Sparring" title="Set price">?</span>
    </div>
    <div class="space-4"></div>
    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">C-Form</label>
      <input name="is_cf" id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" />
      <span class="lbl"></span>
      <cfinput class="col-xs-2" placeholder="$ 00"  type="text" mask="999" name="3_price">
      <span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="Set your price for participating Creative Form" title="Set price">?</span>
    </div>
    <div class="space-4"></div>
    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Breaking</label>
      <input name="is_bb" id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" />
      <span class="lbl"></span>
      <cfinput class="col-xs-2" placeholder="$ 00"  type="text" mask="999" name="4_price">
      <span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="Set your price for participating Board Breaking" title="Set price">?</span>
    </div>
    <div class="space-4"></div>
    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Weapon</label>
      <input name="is_w" id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" />
      <span class="lbl"></span>
      <cfinput class="col-xs-2" placeholder="$ 00"  type="text" mask="999" name="5_price">
      <span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="Set your price for participating Weapon" title="Set price">?</span>
    </div>
    <div class="space-4"></div>
    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Coach Price</label>
      <input name="is_coach" id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" />
      <span class="lbl"></span>
      <cfinput class="col-xs-2" placeholder="$ 00"  type="text" mask="999" name="coach_price">
      <span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="Set your price for coaching staff" title="Set price">?</span>
    </div>
    <br>
    </div>
  </div>
</div>

    <!------------------------------>
    <!------------------------------>
    <!------------------------------>

  <div class="col-sm-4">

    <div class="widget-box">
      <div class="widget-header widget-header-flat">
        <h4>Location</h4>
      </div>

      <div class="widget-body" align="center">


    <br>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Place Name</label>
      <cfinput type="text" placeholder="Event Place Name" name="place_name" required="true" message="please enter Place Name"/>
    </div>

    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Event Place</label>
      <cfinput type="text" placeholder="Place Address1" name="game_address" required="true"/>
    </div>
    <div class="space-4"></div>
    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1"></label>
      <cfinput type="text" placeholder="Place City" name="game_city" required="true" message="Please enter city"/>
    </div>
    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1"></label>
      <select name="game_state">
        <cfinclude template="states.cfm" >
      </select>
    </div>
    <div class="space-4"></div>
    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1"></label>
      <cfinput type="text" placeholder="Place Zip" name="game_zip" required="true" message="Please enter zip code"/>
    </div>

    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Phone</label>
      <cfinput class="input-medium input-mask-phone" type="text" name="phone" required="true" message="Please enter contact phone"/>
    </div>

    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Email</label>
      <cfinput type="text" placeholder="Email" name="email" required="true" message="Please enter email"/>
    </div>

    <div class="space-4"></div>

    <div align="left">
      <label class="col-sm-4 control-label no-padding-left" for="form-field-1">Contact</label>
      <cfinput type="text" placeholder="Contact Person's Name" name="person" required="true" message="Please enter contact person's name"/>
    </div>

    <div class="space-4"></div>
    <div class="space-4"></div>

    <div align="center">
      <cfinput type="hidden" name="is_active" value="on">
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
      <br>
    </div>
        </div>
      </div>


  </div>
  </div>
</cfform>


      <!--- PAGE CONTENT ENDS --->
            </div>
          </div>
        </div>

</div>


<cfinclude template="footer.cfm" >