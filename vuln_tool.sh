#!/bin/bash

API_KEY="sk_test_1234567890"
ADMIN_USER="admin"
ADMIN_PASS="admin123"


echo "[*] Simple Admin Utility Script"

# -------------------------------
# Login section
# -------------------------------
read -p "Username: " username
read -p "Password: " password

if [[ "$username" == "$ADMIN_USER" && "$password" == "$ADMIN_PASS" ]]; then
    echo "[+] Login successful"
else
    echo "[-] Login failed"
    exit 1
fi


# -------------------------------
# Missing input validation
# -------------------------------
read -p "Enter filename to check size: " filename

echo "[*] File info:"
ls -lh $filename


# -------------------------------
# Command Injection
# -------------------------------
read -p "Enter directory to list: " dir

cmd="ls $dir"
echo "[*] Executing: $cmd"
eval $cmd


# -------------------------------
# Insecure API Call
# -------------------------------
read -p "Enter user ID to fetch data: " user_id

curl "http://api.example.com/user?id=$user_id&apikey=$API_KEY"

echo
echo "[*] Done"

