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
   FUNCIÓN: 1 Exportar estructura
============================================= */
function exportSchema($mysqli, $db, $savePath) {

    $sql  = "-- TABLES SCHEMA EXPORT: $db\n\n";
    $sql .= "SET FOREIGN_KEY_CHECKS=0;\n";
    $sql .= "DROP DATABASE IF EXISTS `$db`;\n";
    $sql .= "CREATE DATABASE `$db` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;\n";
    $sql .= "USE `$db`;\n\n";

    $tables = $mysqli->query("SHOW TABLES IN `$db`");
    while ($row = $tables->fetch_row()) {
        $table = $row[0];

        $res = $mysqli->query("SHOW CREATE TABLE `$db`.`$table`");
        $create = $res->fetch_assoc()['Create Table'];

        // eliminar TODAS las líneas de FOREIGN KEY
        $create = preg_replace('/,\s*(CONSTRAINT\s+`[^`]+`\s+)?FOREIGN KEY\s*\([^\)]*\)\s*REFERENCES\s+`[^`]+`\s*\([^\)]*\)(\s+ON\s+(DELETE|UPDATE)\s+(CASCADE|SET NULL|RESTRICT|NO ACTION))*?/i','',$create);
        // limpiar paréntesis colgantes
        $create = preg_replace('/,\s*\)/', "\n)", $create);
        // forzar InnoDB
        $create = preg_replace('/ENGINE=\w+/i', 'ENGINE=InnoDB', $create);

        $sql .= $create . ";\n\n";
    }

    $sql .= "SET FOREIGN_KEY_CHECKS=1;\n";

    file_put_contents($savePath, $sql);
}


/* =============================================
   FUNCIÓN: 2 Exportar Foraneos
============================================= */
function exportSchemaConstraints($mysqli, $db, $savePath) {

    $sql  = "-- FOREIGN KEYS EXPORT: $db\n\n";
    $sql .= "USE `$db`;\n";
    $sql .= "SET FOREIGN_KEY_CHECKS=0;\n\n";

    $tables = $mysqli->query("SHOW TABLES IN `$db`");
    while ($row = $tables->fetch_row()) {

        $table = $row[0];

        $res = $mysqli->query("SHOW CREATE TABLE `$db`.`$table`");
        $create = $res->fetch_assoc()['Create Table'];

        preg_match_all(
            '/CONSTRAINT\s+`([^`]+)`\s+FOREIGN KEY\s+\([^)]+\)\s+REFERENCES\s+[^)]+\)/',
            $create,
            $matches
        );

        foreach ($matches[0] as $fk) {
            $sql .= "ALTER TABLE `$table` ADD $fk;\n";
        }
    }

    $sql .= "\nSET FOREIGN_KEY_CHECKS=1;\n";

    file_put_contents($savePath, $sql);
}


/* =============================================
   FUNCIÓN: 3 Exportar DATA
============================================= */
function exportData($mysqli, $db, $savePath) {
    $sql  = "-- DATA EXPORT: $db\n\n";
    $sql .= "USE `$db`;\n";
    $sql .= "SET FOREIGN_KEY_CHECKS=0;\n";
    $sql .= "START TRANSACTION;\n\n";

    $tables = $mysqli->query("SHOW TABLES IN `$db`");
    while ($row = $tables->fetch_row()) {
        $table = $row[0];

        $res = $mysqli->query("SELECT * FROM `$db`.`$table`");
        if ($res->num_rows === 0) continue;

        $sql .= "-- DATA FOR TABLE `$table`\n";
        $sql .= "DELETE FROM `$table`;\n";

        while ($data = $res->fetch_assoc()) {

            $cols = "`" . implode("`,`", array_keys($data)) . "`";

            $vals = implode(",", array_map(function ($v) use ($mysqli) {
                if ($v === null) return "NULL";
                return "'" . $mysqli->real_escape_string($v) . "'";
            }, array_values($data)));

            $sql .= "INSERT INTO `$table` ($cols) VALUES ($vals);\n";
        }

        $sql .= "\n";
    }

    $sql .= "COMMIT;\n";
    $sql .= "SET FOREIGN_KEY_CHECKS=1;\n";

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
    exportSchemaConstraints($mysqli, $db, "$dbFolder/02_{$db}_constraints.sql");
    exportData($mysqli, $db, "$dbFolder/03_{$db}_data.sql");

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