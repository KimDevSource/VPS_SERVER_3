using System;
using System.Threading;
using System.Threading.Tasks;

namespace KimVPS.Core
{
    class Program
    {
        // จำลองข้อมูลสถานะ
        static string ServerName = "KIM-VPS-WIN-NODE";
        static string Version = "1.0.5-CS";

        static async Task Main(string[] args)
        {
            Console.Title = $"KimVPS Management System - {Version}";
            Console.Clear();

            PrintHeader();

            Console.ForegroundColor = ConsoleColor.Cyan;
            Console.WriteLine($"[SYSTEM] Initializing connection to Master Node...");
            await Task.Delay(1500);

            // วนลูปแสดงผลสถานะแบบ Real-time
            Random rng = new Random();
            int cycles = 0;

            while (true)
            {
                cycles++;
                double cpu = rng.NextDouble() * (15.0 - 2.0) + 2.0;
                double ram = rng.NextDouble() * (1.2 - 0.5) + 0.5;

                // เลื่อนเคอร์เซอร์ไปที่บรรทัดเดิมเพื่ออัปเดตตัวเลข
                Console.SetCursorPosition(0, 8);
                Console.ForegroundColor = ConsoleColor.White;
                Console.WriteLine("------------------------------------------");
                Console.Write(" STATUS: ");
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine("ONLINE    ");
                
                Console.ForegroundColor = ConsoleColor.White;
                Console.WriteLine($" CPU USAGE: {cpu:F1}%    ");
                Console.WriteLine($" RAM USAGE: {ram:F2} GB  ");
                Console.WriteLine($" UPTIME CYCLES: {cycles}  ");
                Console.WriteLine("------------------------------------------");
                
                Console.ForegroundColor = ConsoleColor.DarkGray;
                Console.WriteLine($"\nLast Sync: {DateTime.Now:HH:mm:ss}");
                Console.WriteLine("Press Ctrl+C to terminate session...");

                await Task.Delay(2000); // อัปเดตทุก 2 วินาที
            }
        }

        static void PrintHeader()
        {
            Console.ForegroundColor = ConsoleColor.Blue;
            Console.WriteLine(@"
  _  __ _            __     _______   _____ 
 | |/ /(_)           \ \   / /  __ \ / ____|
 | ' /  _  _ __ ___   \ \_/ /| |__) | (___  
 |  <  | || '_ ` _ \   \   / |  ___/ \___ \ 
 | . \ | || | | | | |   | |  | |     ____) |
 |_|\_\|_||_| |_| |_|   |_|  |_|    |_____/ 
                                            ");
            Console.WriteLine($"   >>> {ServerName} ENGINE v{Version} <<<");
            Console.WriteLine();
        }
    }
}
