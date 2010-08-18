<?php

if(is_file("config.php")) {
	require_once("config.php");
} else {
	if(is_dir("install")) {
		header("location: install");
		exit();
	} else {
		$path = str_replace("content.php", "", $_SERVER['SCRIPT_FILENAME']);
		exit("You have to setup config.php first.<br />quick fix: mv {$path}config.dist.php {$path}config.php");
	}
}
require_once(WWW_DIR."/lib/page.php");
require_once(WWW_DIR."/lib/content.php");

$page = new Page();
$contents = new Contents();

$contentid = 0;
if (isset($_GET["id"]))
	$contentid = $_GET["id"];

if ($contentid == 0)
	$content = $contents->getIndex();
else
	$content = $contents->getByID($contentid);

$page->smarty->assign('content',$content);	
$page->meta_title = $content->title;
$page->meta_keywords = $content->metakeywords;
$page->meta_description = $content->metadescription;

$page->content = $page->smarty->fetch('content.tpl');
$page->render();

?>
