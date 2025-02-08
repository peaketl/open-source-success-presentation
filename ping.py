import subprocess
import platform
import time
import argparse

def ping_address(address):
    # Determine the ping command based on OS
    param = '-n' if platform.system().lower() == 'windows' else '-c'
    command = ['ping', param, '1', address]

    try:
        output = subprocess.run(command,stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
        if output.returncode == 0:
            print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] Ping to {address} successful.")
        else:
            print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] Ping to {address} failed.")
    except Exception as e:
        print(f"Error occurred while pinging {address}: {e}")

def main():
    parser = argparse.ArgumentParser(description="Continuous Ping Monitor")
    parser.add_argument("address", help="IP address or hostname to ping")
    parser.add_argument("-i", "--interval", type=int, default=5, help="Ping interval in seconds (default: 5)")

    args = parser.parse_args()

    print(f"Starting continuous ping to {args.address} every {args.interval} seconds...\nPress Ctrl+C to stop.\n")

    try:
        while True:
            ping_address(args.address)
            time.sleep(args.interval)
    except KeyboardInterrupt:
        print("\nPing monitoring stopped by user.")

if __name__ == "__main__":
    main()