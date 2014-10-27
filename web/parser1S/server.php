<?php
require_once('nusoap/lib/nusoap.php');
ini_set("soap.wsdl_cache_enabled", "0"); 
header('Content-Type: text/html; charset=utf-8');

$username = 'ws';
$password = '1';
$url = 'http://82.207.27.125:8080/ws1c/ws/ws1c.1cws?wsdl';
$client = new nusoap_client($url, true);
$client->setCredentials($username,$password);
$namespace='http://ws1c.kiwifitness.com.ua';
$client->soap_defencoding = 'UTF-8';
$client->decode_utf8 = false;
/*GetCardStatus*/

if($_POST['procedure'] == 'GetCardStatus'){	
	
	$params = array(
		'CardCode' => $_POST['CardCode']
	);

	$result = $client->call('GetCardStatus', $params);
	print_r($result);

}
/* end GetCardStatus*/

/*GetClientData*/
if($_POST['procedure'] == 'GetClientData'){	
	
	$params = array(
		'CardCode' => $_POST['CardCode']
	);

	$result = $client->call('GetClientData', $params);
	print_r($result);

}

/* end GetClientData*/

/*SetStatusFrozenAbonement*/
if($_POST['procedure'] == 'SetStatusFrozenAbonement'){	
	
	$params = array(
		'CardCode' => $_POST['CardCode'],
		'AbonementCode' => $_POST['AbonementCode'],
		'DateFrom' => $_POST['DateFrom'],
		'DateTo' => $_POST['DateTo']
	);

	$result = $client->call('SetStatusFrozenAbonement', $params);
	print_r($result);

}

/* end SetStatusFrozenAbonement*/

/*SetAddMoneyToAccount */
if($_POST['procedure'] == 'SetAddMoneyToAccount'){	
	
	$params = array(
		'CardCode' => $_POST['CardCode'],
		'Value' => $_POST['Value']
	);

	$result = $client->call('SetAddMoneyToAccount', $params);
	print_r($result);

}

/* end SetAddMoneyToAccount */

/*SetAddMoneyToAccount */
if($_POST['procedure'] == 'SetBonusForSigninUoOnTheSite'){	
	
	$params = array(
		'CardCode' => $_POST['CardCode'],
		'Value' => $_POST['Value']
	);

	$result = $client->call('SetBonusForSigninUoOnTheSite', $params);
	print_r($result);

}

/* end SetAddMoneyToAccount */


						