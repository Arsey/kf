<?php
$dataArr=array();
$str='@VarA = 1234';
$arrVariable=explode('=',$str);
$parametrVariables=explode( 'AS', $arrVariable[0]);
$dataArr['name']=$parametrVariables[0];
if(isset($parametrVariables[1])){
	$dataArr['type']=$parametrVariables[1];
}
if(isset($arrVariable[1])){
	$dataArr['value']=$arrVariable[1];
}
print_r($dataArr);