<?php

/* =============================================
   CONFIG
============================================= */
$DB_HOST = "mysql";      // Nombre del servicio MySQL en Docker
$DB_USER = "root";
$DB_PASS = "Server*90";

$IGNORAR = [
    "mysql",
    "information_schema",
    "performance_schema",
    "sys"
];

$EXPORT_DIR = __DIR__ . "/dataBasesExports";
if (!is_dir($EXPORT_DIR)) {
    mkdir($EXPORT_DIR, 0777, true);
}

/* =============================================
   FUNCIÓN: Exportar estructura
============================================= */
function exportSchema($mysqli, $db, $savePath) {
    $schema = "-- SCHEMA EXPORT: $db\n\n";
    $schema .= "DROP DATABASE IF EXISTS `$db`;\n";
    $schema .= "CREATE DATABASE `$db`;\n";
    $schema .= "USE `$db`;\n\n";

    $tables = $mysqli->query("SHOW TABLES IN `$db`");
    while ($row = $tables->fetch_array()) {
        $table = $row[0];

        // Obtener CREATE TABLE
        $res = $mysqli->query("SHOW CREATE TABLE `$db`.`$table`");
        $create = $res->fetch_assoc()["Create Table"];

        $schema .= $create . ";\n\n";
    }

    file_put_contents($savePath, $schema);
}

/* =============================================
   FUNCIÓN: Exportar DATA
============================================= */
function exportData($mysqli, $db, $savePath) {
    $sql = "-- DATA EXPORT: $db\n\n";
    $sql .= "USE `$db`;\n\n";

    $tables = $mysqli->query("SHOW TABLES IN `$db`");
    while ($row = $tables->fetch_array()) {
        $table = $row[0];

        $res = $mysqli->query("SELECT * FROM `$db`.`$table`");
        $num = $res->num_rows;

        if ($num === 0) continue;

        $sql .= "DELETE FROM `$table`;\n";

        while ($data = $res->fetch_assoc()) {
            $cols = "`" . implode("`,`", array_keys($data)) . "`";
            $vals = "'" . implode("','", array_map(fn($v)=>addslashes($v), array_values($data))) . "'";
            $sql .= "INSERT INTO `$table` ($cols) VALUES ($vals);\n";
        }

        $sql .= "\n";
    }

    file_put_contents($savePath, $sql);
}

/* =============================================
   FUNCIÓN PRINCIPAL: Exporta UNA base
============================================= */
function exportDB($db, $mysqli, $EXPORT_DIR) {
    echo "<b>Exportando:</b> $db<br>";
    $mysqli->select_db($db);

    $dbFolder = "$EXPORT_DIR/$db";
    if (!is_dir($dbFolder)) mkdir($dbFolder);

    exportSchema($mysqli, $db, "$dbFolder/01_{$db}_schema.sql");
    exportData($mysqli, $db, "$dbFolder/02_{$db}_data.sql");

    echo "Exportación finalizada: $db<br><br>";
}

/* =============================================
   CONEXIÓN MYSQL
============================================= */
$mysqli = new mysqli($DB_HOST, $DB_USER, $DB_PASS);
if ($mysqli->connect_error) {
    die("Error MySQL: " . $mysqli->connect_error);
}

/* =============================================
   GET: Exportar UNA BD     → ?db=SE_Agua
   GET: Exportar TODAS      → ?all=1
============================================= */

if (isset($_GET["db"])) {
    $db = $_GET["db"];
    exportDB($db, $mysqli, $EXPORT_DIR);
    exit("Proceso completado.");
}

if (isset($_GET["all"])) {
    $res = $mysqli->query("SHOW DATABASES");
    while ($row = $res->fetch_assoc()) {
        $db = $row["Database"];
        if (!in_array($db, $GLOBALS["IGNORAR"])) {
            exportDB($db, $mysqli, $EXPORT_DIR);
        }
    }
    exit("Exportación completa de todas las bases.");
}

/* =============================================
MENÚ SIMPLE
============================================= */

$res = $mysqli->query("SHOW DATABASES");

echo "<h2>Exportar Bases de Datos</h2>";
echo "<ul>";

while ($row = $res->fetch_assoc()) {
    $db = $row["Database"];
    if (!in_array($db, $IGNORAR)) {
        echo "<li><a href='?db=$db'>Exportar $db</a></li>";
    }
}

echo "</ul>";
echo "<a href='?all=1'><b>Exportar TODAS</b></a>";