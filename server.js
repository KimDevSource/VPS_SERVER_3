/**
 * KIMVPS - Mock Server System
 * Core: Node.js / Express
 * Developer: TheOfficialKim
 */

const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// จำลองฐานข้อมูลสถานะเครื่อง
let systemStatus = {
    status: "ONLINE",
    uptime: 0,
    server_name: "KIMVPS-PRIMARY-NODE",
    location: "TH-LOEI-DATACENTER"
};

// Middleware สำหรับ Log หน้าตาเท่ๆ ใน Console
app.use((req, res, next) => {
    const timestamp = new Date().toISOString().replace(/T/, ' ').replace(/\..+/, '');
    console.log(`[\x1b[36m${timestamp}\x1b[0m] \x1b[32m${req.method}\x1b[0m request to \x1b[33m${req.url}\x1b[0m`);
    next();
});

// Route หลักสำหรับแสดงสถานะ (ใช้เชื่อมกับหน้าเว็บได้)
app.get('/api/status', (req, res) => {
    // จำลองการคำนวณสถิติปลอมๆ
    const mockCpu = (Math.random() * 5 + 2).toFixed(1);
    const mockRam = (Math.random() * 0.4 + 0.8).toFixed(2);
    
    res.json({
        ...systemStatus,
        cpu_usage: `${mockCpu}%`,
        ram_usage: `${mockRam} GB`,
        active_connections: Math.floor(Math.random() * 10) + 1
    });
});

// Route สำหรับจำลองการ Deploy
app.post('/api/deploy', (req, res) => {
    console.log("\x1b[35m[SYSTEM]\x1b[0m Deployment triggered via GitHub Webhook...");
    res.json({ message: "Deployment started successfully" });
});

// หน้า Dashboard ปลอมๆ สำหรับหน้าแรก
app.get('/', (req, res) => {
    res.send(`
        <body style="background:#050505; color:#00d2ff; font-family:monospace; display:flex; justify-content:center; align-items:center; height:100vh; flex-direction:column;">
            <h1>KIMVPS SERVER ENGINE</h1>
            <p>Status: <span style="color:#00ff00;">RUNNING</span></p>
            <p>Port: ${PORT}</p>
            <p>Listening for API calls...</p>
        </body>
    `);
});

app.listen(PORT, () => {
    console.clear();
    console.log("------------------------------------------");
    console.log("\x1b[36m  _  _____ __  ____     ______  ____  \x1b[0m");
    console.log("\x1b[36m | |/ /_ _|  \\/  \\ \\   / /  _ \\/ ___| \x1b[0m");
    console.log("\x1b[36m | ' / | || |\\/| |\\ \\ / /| |_) \\___ \\ \x1b[0m");
    console.log("\x1b[36m | . \\ | || |  | | \\ V / |  __/ ___) |\x1b[0m");
    console.log("\x1b[36m |_|\\_\\___|_|  |_|  \\_/  |_|   |____/ \x1b[0m");
    console.log("------------------------------------------");
    console.log(`\x1b[32m[SUCCESS]\x1b[0m KimVPS Engine started on port ${PORT}`);
    console.log(`\x1b[33m[READY]\x1b[0m Monitoring GitHub Webhooks...`);
});

// จำลองการนับ Uptime
setInterval(() => {
    systemStatus.uptime += 1;
}, 1000);
