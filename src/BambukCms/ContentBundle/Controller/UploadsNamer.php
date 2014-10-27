<?php
namespace BambukCms\ContentBundle\Controller;

use Oneup\UploaderBundle\Uploader\File\FileInterface;
use Oneup\UploaderBundle\Uploader\Naming\NamerInterface;

class UploadsNamer implements NamerInterface
{
    public function name(FileInterface $file)
    {
    	$arrFile=getallheaders();
		$name=str_replace(' ','_',$arrFile['X-File-Name']);
		$name=$arrFile['X-File-Id'].'_'.$name;
	    return $name;
    }
}
