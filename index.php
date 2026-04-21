<?php
/**
 * KIMVPS - PHP Core Engine
 * System: Cloud Management Interface
 * Developer: TheOfficialKim (TheOfficialKim)
 */

// จำลองการเช็ค Session หรือสถานะเซิร์ฟเวอร์
$server_name = "KIM-NODE-01";
$system_load = sys_getloadavg(); // ดึงค่า Load จริงถ้าเป็น Linux
$cpu_usage = $system_load ? $system_load[0] : rand(2, 10);
$memory_usage = round(memory_get_usage() / 1024 / 1024, 2);

$status = "ACTIVE";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>KimVPS | PHP Backend</title>
    <style>
        body { background: #050505; color: #00d2ff; font-family: 'Courier New', monospace; padding: 50px; }
        .terminal-box {
            border: 1px solid #00d2ff;
            padding: 20px;
            background: rgba(0, 210, 255, 0.05);
            box-shadow: 0 0 15px rgba(0, 210, 255, 0.2);
            max-width: 600px;
            margin: auto;
        }
        .line { margin-bottom: 10px; }
        .label { font-weight: bold; color: #fff; }
        .blink { animation: blinker 1s linear infinite; }
        @keyframes blinker { 50% { opacity: 0; } }
    </style>
</head>
<body>

    <div class="terminal-box">
        <h2 style="text-align: center; border-bottom: 1px solid #00d2ff; padding-bottom: 10px;">
            KIMVPS PHP MONITOR
        </h2>
        
        <div class="line">
            <span class="label">> SERVER_ID:</span> <?php echo $server_name; ?>
        </div>
        
        <div class="line">
            <span class="label">> SYSTEM_STATUS:</span> 
            <span style="color: #00ff00;"><?php echo $status; ?></span>
        </div>

        <div class="line">
            <span class="label">> CPU_LOAD:</span> <?php echo $cpu_usage; ?>%
        </div>

        <div class="line">
            <span class="label">> MEM_ALLOCATED:</span> <?php echo $memory_usage; ?> MB
        </div>

        <div class="line">
            <span class="label">> TIMESTAMP:</span> <?php echo date('Y-m-d H:i:s'); ?>
        </div>

        <div class="line" style="margin-top: 20px;">
            <span class="blink">_</span> RUNNING PHP ENGINE V<?php echo phpversion(); ?>
        </div>
    </div>

</body>
</html>
