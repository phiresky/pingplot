<?php
error_reporting(-1);
if(!isset($_GET['fmt'])) die("call with ?fmt=pdf/png/svg");
$fmt = $_GET['fmt'];
system("./pingplot.sh ".escapeshellarg($fmt));
header("Content-Type: ".mime_content_type("pingplot.$fmt"));
readfile("pingplot.$fmt");
?>
