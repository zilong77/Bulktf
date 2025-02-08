#!/bin/bash
while true; do
clear
# KYRO 
echo " "
echo "         _____                _____                    _____                   _______         "
echo "        /\    \              |\    \                  /\    \                 /::\    \        "
echo "       /::\____\             |:\____\                /::\    \               /::::\    \       "
echo "      /:::/    /             |::|   |               /::::\    \             /::::::\    \      "
echo "     /:::/    /              |::|   |              /::::::\    \           /::::::::\    \     "
echo "    /:::/    /               |::|   |             /:::/\:::\    \         /:::/~~\:::\    \    "
echo "   /:::/____/                |::|   |            /:::/__\:::\    \       /:::/    \:::\    \   "
echo "  /::::\    \                |::|   |           /::::\   \:::\    \     /:::/    / \:::\    \  "
echo " /::::::\____\________       |::|___|______    /::::::\   \:::\    \   /:::/____/   \:::\____\ "
echo "/:::/\:::::::::::\    \      /::::::::\    \  /:::/\:::\   \:::\____\ |:::|    |     |:::|    |"
echo "/:::/  |:::::::::::\____\    /::::::::::\____\/:::/  \:::\   \:::|    ||:::|____|     |:::|    |"
echo "\::/   |::|~~~|~~~~~        /:::/~~~~/~~      \::/   |::::\  /:::|____| \:::\    \   /:::/    / "
echo " \/____|::|   |            /:::/    /          \/____|:::::\/:::/    /   \:::\    \ /:::/    /  "
echo "       |::|   |           /:::/    /                 |:::::::::/    /     \:::\    /:::/    /   "
echo "       |::|   |          /:::/    /                  |::|\::::/    /       \:::\__/:::/    /    "
echo "       |::|   |          \::/    /                   |::| \::/____/         \::::::::/    /     "
echo "       |::|   |           \/____/                    |::|  ~|                \::::::/    /      "
echo "       |::|   |                                      |::|   |                 \::::/    /       "
echo "       \::|   |                                      \::|   |                  \::/____/        "
echo "        \:|   |                                       \:|   |                   ~~              "
echo "         \|___|                                        \|___|                                    "
echo " "
echo "Welcome to the Toolyool"
echo "--------------------------------------"
echo "I will help you to send token to your tuyul address"
echo " "

echo "Lagi install dependencies sabar!"  
  npm install ethers dotenv
clear
  
  node bulkTransfer.js
  
  
  echo "============================================"
  read -p "Apakah Anda ingin menjalankan ulang karena terlalu banyak akun tuyul anda? (y/n): " choice
  case "$choice" in 
    y|Y ) continue;;
    n|N ) echo "Thanks for using this tool."; exit;;
    * ) echo "Input tidak valid, keluar dari program."; exit;;
  esac
done
