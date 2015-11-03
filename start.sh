#!/bin/bash

# Use the environmental variables passed to the Docker container and use them to:

# Configure the Database Connection
echo "*** Setting DB Server to $MYSQL_PORT_3306_TCP_ADDR ***"
echo ""
echo "*** Setting DB Name to $MYSQL_ENV_MYSQL_DATABASE ***"
echo ""
sed -i "/pdo_dsn/c\$conf['pdo_dsn'] = 'mysql:host=$MYSQL_PORT_3306_TCP_ADDR;dbname=$MYSQL_ENV_MYSQL_DATABASE';" /www/munkireport/config.php # Set the DB Name and Server Address
echo "*** Setting DB User to $MYSQL_ENV_MYSQL_USER ***"
echo ""
sed -i "/pdo_user/c\$conf['pdo_user'] = '$MYSQL_ENV_MYSQL_USER';" /www/munkireport/config.php # Set the DB User
echo "*** Setting DB Password to $MYSQL_ENV_MYSQL_PASSWORD ***"
echo ""
sed -i "/pdo_pass/c\$conf['pdo_pass'] = '$MYSQL_ENV_MYSQL_PASSWORD';" /www/munkireport/config.php # Set the DB Password

# Configure MR settings
echo "*** Setting Munki Report Sitename to $MR_SITENAME ***"
echo ""
sed -i "/sitename/c\$conf['sitename'] = '$MR_SITENAME';" /www/munkireport/config.php # Set the MR Site Name
echo "*** Setting Timezone to $MR_TIMEZONE ***"
echo ""
sed -i "/timezone/c\$conf['timezone'] = @date_default_timezone_get($MR_TIMEZONE);" /www/munkireport/config.php # Set the MR Timezone

# Check to see which type of proxy server config we need
if [ "$proxy_required" = "mod1" ];
	then
# Configure Proxy Settings for Warranty Lookups etc
echo "*** Proxy Server Mode 1 (Only server and port number) selected ***"
echo ""
echo "*** Setting Proxy server to $proxy_server ***"
echo ""
sed -i "/proxy.yoursite.org/c\$conf['proxy']['server'] = '$proxy_server';" /www/munkireport/config.php # Set the proxy server address
echo "*** Setting Proxy port to $proxy_port ***"
echo ""
sed -i "/8080/c\$conf['proxy']['port'] = 8080;" /www/munkireport/config.php # Set the proxy port

elif [ "$proxy_required" = "mod2" ];
	then
echo "*** Proxy Server Mode 2 (authenticated proxy) selected ***"
echo ""
echo "*** Setting Proxy server to $proxy_server ***"
echo ""
sed -i "/proxy.yoursite.org/c\$conf['proxy']['server'] = '$proxy_server';" /www/munkireport/config.php # Set the proxy server address
echo "*** Setting Proxy port to $proxy_port ***"
echo ""
sed -i "/8080/c\$conf['proxy']['port'] = 8080;" /www/munkireport/config.php # Set the proxy port
echo "*** Setting Proxy username to $proxy_uname ***"
echo ""
sed -i "/proxyuser/c\$conf['proxy']['username'] = '$proxy_uname';" /www/munkireport/config.php # set the proxy username
echo "*** Setting Proxy password to $proxy_pword ***"
echo ""
sed -i "/proxypassword/c\$conf['proxy']['password'] = '$proxy_pword';" /www/munkireport/config.php # set the proxy password

elif [ "$proxy_required" = "no" ];
	then
	echo "*** Proxy server settings are not required, skipping ***"
fi

#check if Client Passphrases should be set
if [ "$MR_CLIENT_PASSPHRASES_REQUIRED" = "yes" ];
	then
	echo "*** Setting Client Passphreases ***"
	sed -i "/client_passphrases/c\$onf['client_passphrases'] = array($MR_CLIENT_PASSHRASES);" /www/munkireport/config.php # set the client passphrase(s)
fi

echo "*** Setting Temperature Unit to $MR_TEMPERATURE_UNIT ***"
echo ""
sed -i "/temperature_unit/c\$conf['temperature_unit'] = '$MR_TEMPERATURE_UNIT';" /www/munkireport/config.php # Set the DB Password

echo "*** Setting Keep Previous Displays to $MR_KEEP_PREVIOUS_DISPLAYS ***"
echo ""
sed -i "/keep_previous_displays/c\$conf['keep_previous_displays'] = '$MR_KEEP_PREVIOUS_DISPLAYS';" /www/munkireport/config.php # Set the DB Password

echo "*** Setting Active Modules to $MR_MODULES ***"
echo ""
sed -i "/'modules'/c\$conf['modules'] = $MR_MODULES;" /www/munkireport/config.php

echo "*** Setting auth_secure to $MR_AUTH_SECURE ***"
echo ""
sed -i "/'auth_secure'/c\$conf['auth_secure'] = $MR_AUTH_SECURE;" /www/munkireport/config.php

echo "*** Setting Time Zone to $TZ ***"
echo ""
sed -i "/'timezone'/c\$conf['timezone'] = @date_default_timezone_get($TZ);" /www/munkireport/config.php


if [ "$MR_LDAP" == "yes"]; then

	echo ""
	echo "*** CONFIGURE LDAP SETTINGS***"
	echo ""
	echo ""

	echo "*** Setting Admin Groups to $MR_ADMIN_GROUPS ***"
	echo ""
	sed -i "/MR_ADMIN_GROUPS/c\$conf['roles']['admin'] = $MR_ADMIN_GROUPS;" /www/munkireport/config.php

	echo "*** Setting Manager Groups to $MR_MANAGER_GROUPS ***"
	echo ""
	sed -i "/MR_MANAGER_GROUPS/c\$conf['roles']['manager'] = $MR_MANAGER_GROUPS;" /www/munkireport/config.php

	echo "*** Setting LDAP Server(s) to $MR_LDAP_SERVER ***"
	echo ""
	sed -i "/'MR_LDAP_SERVER'/c\$conf['auth']['auth_ldap']['server'] = '$MR_LDAP_SERVER';" /www/munkireport/config.php

	echo "*** Setting LDAP User Tree to $MR_LDAP_USER_TREE ***"
	echo ""
	sed -i "/'MR_LDAP_USER_TREE'/c\$conf['auth']['auth_ldap']['usertree'] = '$MR_LDAP_USER_TREE';" /www/munkireport/config.php

	echo "*** Setting LDAP Group Tree to $MR_LDAP_GROUP_TREE ***"
	echo ""
	sed -i "/'MR_LDAP_GROUP_TREE'/c\$conf['auth']['auth_ldap']['grouptree'] = '$MR_LDAP_GROUP_TREE';" /www/munkireport/config.php

	echo "*** Setting Authorized Groups to $MR_LDAP_GROUPS ***"
	echo ""
	sed -i "/MR_LDAP_GROUPS/c\$conf['auth']['auth_ldap']['mr_allowed_groups'] = $MR_LDAP_GROUPS;" /www/munkireport/config.php

	echo "*** Setting Bind User to $MR_LDAP_BINDDN ***"
	echo ""
	sed -i "/'MR_LDAP_BINDDN'/c\$conf['auth']['auth_ldap']['binddn'] = '$MR_LDAP_BINDDN';" /www/munkireport/config.php

	echo "*** Setting Bind Password to $MR_LDAP_BINDPW ***"
	echo ""
	sed -i "/'MR_LDAP_BINDPW'/c\$conf['auth']['auth_ldap']['bindpw'] = '$MR_LDAP_BINDPW';" /www/munkireport/config.php
fi

# Fire up PHP and then start Nginx in non daemon mode so docker has something to keep running
echo ""
echo "*** Configuration of the Munki Report php file complete ***"
echo ""
echo "*** Starting php5-fpm ***"
service php5-fpm restart
echo ""
echo "*** Starting NginX ***"
nginx
