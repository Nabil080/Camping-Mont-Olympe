<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    

<?php
// var_dump(phpinfo());

$data = json_decode(file_get_contents('config.json'),true);
var_dump($data);

?>
</body>
</html>