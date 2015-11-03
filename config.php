<?php if ( ! defined( 'KISS' ) ) exit;

	/*
	|===============================================
	| System Defaults
	|===============================================
	*/

	$conf['index_page'] = 'index.php?';
	$conf['vnc_link'] = "vnc://%s:5900";
	$conf['ssh_link'] = "ssh://adminuser@%s";
	$conf['uri_protocol'] = 'AUTO';
	$conf['webhost'] = (empty($_SERVER['HTTPS']) ? 'http' : 'https')
		. '://'.$_SERVER[ 'HTTP_HOST' ];
	$conf['subdirectory'] = substr(
					    $_SERVER['PHP_SELF'],
					    0,
					    strpos($_SERVER['PHP_SELF'], basename(FC))
				    );
	$conf['allow_migrations'] = TRUE; //Allows automatic upgrade of the database
	$conf['locale'] = 'en_US';
	$conf['lang'] = 'en';
    $conf['bundlepath_ignorelist'] = array('/System/Library/.*');
	$conf['bundleid_ignorelist'][] = 'com.parallels.winapp.*';
	$conf['bundleid_ignorelist'][] = 'com.vmware.proxyApp.*';
    $conf['request_timeout'] = 5;
	// Path to system folder, with trailing slash
	$conf['system_path'] = APP_ROOT.'/system/';
	// Path to app folder, with trailing slash
	$conf['application_path'] = APP_ROOT.'/app/';
	// Path to view directory, with trailing slash
	$conf['view_path'] = $conf['application_path'].'views/';
	// Path to controller directory, with trailing slash
	$conf['controller_path'] = $conf['application_path'].'controllers/';
	// Path to modules directory, with trailing slash
	$conf['module_path'] = $conf['application_path'] . "modules/";
	// Routes
	$conf['routes'] = array();
	$conf['routes']['module(/.*)?']	= "module/load$1";

	/*
	|===============================================
	| Customizable settings
	|===============================================
	*/

	$conf['sitename'] = 'MunkiReport';
	$conf['apps_to_track'] = array('Firefox','Java','Flash Player');
	$conf['auth_secure'] = FALSE;
    $conf['modules'] = array('munkireport');
    //$conf['keep_previous_displays'] = TRUE;
    //$conf['temperature_unit'] = 'F';
    //$conf['client_passphrases'] = array();
	$conf['dashboard_layout'] = array(
		array('client', 'munki'), /*client is actually two widgets*/
		array('disk_report', 'installed_memory', 'bound_to_ds'),
		array('uptime', 'pending_apple', 'pending_munki'),
		array('new_clients', 'munki_versions', 'filevault'),
		array('warranty','power_battery_condition','power_battery_health')
	);



	/*
	|===============================================
	| MySQL settings
	|===============================================
	*/

	$conf['pdo_dsn'] = 'mysql:host=sql.test.internal;dbname=munkireport';
	$conf['pdo_user'] = 'admin';
	$conf['pdo_pass'] = 'admin';
	$conf['pdo_opts'] = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');

	/*
	|===============================================
	| Proxy settings
	|===============================================
	|
	| If you are behind a proxy, MunkiReport may be unable to
	| retrieve warranty and model information from Apple.
	|
	| Note that there is only authenticated proxy support for
	| basic authentication
	|
	*/
    //$conf['proxy']['server'] = 'proxy.yoursite.org'; // Required
	//$conf['proxy']['username'] = 'proxyuser'; // Optional
	//$conf['proxy']['password'] = 'proxypassword'; Optional
	//$conf['proxy']['port'] = 8080; // Optional, defaults to 8080

	/*
	|===============================================
	| Create table options
	|===============================================
	|
	| For MySQL, define the default table and charset
	|
	*/
	$conf['mysql_create_tbl_opts'] = 'ENGINE=InnoDB DEFAULT CHARSET=utf8';

	/*
	|===============================================
	| Timezone
	|===============================================
	|
	| See http://www.php.net/manual/en/timezones.php for valid values
	|
	*/
	$conf['timezone'] = @date_default_timezone_get(Australia/Sydney);

	$conf['debug'] = TRUE;

	/*
|===============================================
| Authorization settings
|===============================================
*/
  //$auth_config['root'] = '$P$BUqxGuzR2VfbSvOtjxlwsHTLIMTmuw0';

	//$conf['authorization']['delete_machine'] = array('admin', 'manager');
	//$conf['authorization']['global'] = array('admin');

	//$conf['roles']['admin'] = MR_ADMIN_GROUPS;
	//$conf['roles']['manager'] = MR_MANAGER_GROUPS;
	//$conf['auth']['auth_ldap']['server']      = 'MR_LDAP_SERVER'; // One or more servers separated by commas.
	//$conf['auth']['auth_ldap']['usertree']    = 'MR_LDAP_USER_TREE'; // Where to find the user accounts.
	//$conf['auth']['auth_ldap']['grouptree']   = 'MR_LDAP_GROUP_TREE'; // Where to find the groups.
	//$conf['auth']['auth_ldap']['mr_allowed_groups'] = MR_LDAP_GROUPS; // For group based access, fill in groups.
	//$conf['auth']['auth_ldap']['binddn']      = 'MR_LDAP_BINDDN'; // Optional bind DN
	//$conf['auth']['auth_ldap']['bindpw']      = 'MR_LDAP_BINDPW'; // Optional bind password
