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
        if "No such file or directory: 'ping'" in str(e):
            print("Please make sure the 'ping' utility is installed on your system.")

def main():
    parser = argparse.ArgumentParser(description="Continuous Ping Monitor")

    parser.add_argument("address", help="IP address or hostname to ping")

    args = parser.parse_args()

    print(f"Pinging {args.address}...")

    ping_address(args.address)

if __name__ == "__main__":
    main()