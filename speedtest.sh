#!/bin/bash

apt update -qq && apt install -y iperf3 > /dev/null 2>&1

clear
echo "   ___  __   _____  _____  _________    _______  ___________  ____________________"
echo "  / _ \/ /  / _ \ \/ /_  |/ ___/ __ \  / __/ _ \/ __/ __/ _ \/_  __/ __/ __/_  __/"
echo " / ___/ /__/ __ |\  / __// (_ / /_/ / _\ \/ ___/ _// _// // / / / / _/_\ \  / /   "
echo "/_/  /____/_/ |_|/_/____/\___/\____/ /___/_/  /___/___/____/ /_/ /___/___/ /_/    "
echo "                                                                                  "

echo -e "\n[PLAY2GO]: Начинается проверка скорости...."

speed_result=$(iperf3 -c speedtest.fra1.de.leaseweb.net -p 5201-5210 -P 8 | grep '\[SUM\]')

echo -e "\nРезультаты проверки: "
echo "$speed_result"

download_speed=$(echo "$speed_result" | grep -oP '\[SUM\].*?Mbits/sec' | awk '{print $6}' | tail -n 1)
download_speed=${download_speed%.*}

if [[ $download_speed -gt 100 ]]; then
    echo -e "\n*Гарантированная скорость от нас - 100 мбит/c,\n по результатам вашей проверки у вас скорость больше чем 100мбит/с и составляет ${download_speed} мбит/с"
fi
