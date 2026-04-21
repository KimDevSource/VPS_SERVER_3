import time
import random
import os

# --- Configuration ปลอมๆ ---
SERVER_ID = "KIM-VPS-NODE-01"
LOCATION = "LOEI_DATACENTER"
VERSION = "2.4.0-STABLE"

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def print_banner():
    banner = f"""
    #################################################
    #                                               #
    #   KIMVPS SYSTEM MANAGEMENT BOT [Python v3]    #
    #   Node: {SERVER_ID}                  #
    #   Status: RUNNING                             #
    #                                               #
    #################################################
    """
    print("\033[96m" + banner + "\033[0m")

def simulate_scan():
    tasks = [
        "Checking Firewall status...",
        "Analyzing CPU core temperatures...",
        "Scanning for unauthorized access...",
        "Optimizing RAM allocation...",
        "Verifying SSL certificates...",
        "Syncing with GitHub Repository (kimdev-source/Vps)..."
    ]
    
    for task in tasks:
        print(f"[\033[94mINFO\033[0m] {task}")
        time.sleep(random.uniform(0.5, 1.5))
        print(f"[\033[92mDONE\033[0m] {task} completed.")

def monitor_resources():
    print("\n\033[93m--- LIVE RESOURCE MONITOR ---\033[0m")
    try:
        for _ in range(5):
            cpu = random.randint(2, 15)
            ram = round(random.uniform(0.5, 1.2), 2)
            net = random.randint(100, 999)
            print(f"ID: {SERVER_ID} | CPU: {cpu}% | RAM: {ram}GB | NET: {net}kbps", end='\r')
            time.sleep(1)
    except KeyboardInterrupt:
        print("\nMonitoring stopped by user.")

def main():
    clear_screen()
    print_banner()
    
    print(f"Initializing connection to {LOCATION}...")
    time.sleep(2)
    
    simulate_scan()
    
    print("\n\033[92m[SYSTEM READY]\033[0m All nodes are operational.")
    
    # ถามคำถามปลอมๆ ให้ดูเหมือนใช้ได้จริง
    cmd = input("\nEnter Command (scan/monitor/exit): ").lower()
    
    if cmd == "scan":
        simulate_scan()
    elif cmd == "monitor":
        monitor_resources()
    elif cmd == "exit":
        print("Shutting down bot...")
    else:
        print("\033[91mInvalid Command.\033[0m Access Denied.")

if __name__ == "__main__":
    main()
