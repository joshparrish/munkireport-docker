<?php 

/**
 * RLC_scripts class
 *
 * @package munkireport
 * @author mholtrlc
 **/
class Rlc_scripts_controller extends Module_controller
{
	function __construct()
	{
		$this->module_path = dirname(__FILE__);
	}

	/**
	 * Default method
	 *
	 * @author AvB
	 **/
	function index()
	{
		echo "You've loaded the RLC Scripts module!";
	}

} // END class Rlc_scripts_controller
