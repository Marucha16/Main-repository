#!/bin/bash
# Nazwa: podstawoweinfobs.sh
# Opis: Wyświetla podstawowe informacje o systemie: hostname, nazwa systemu operacyjnego, zużycie pamięci RAM i aktualna pamięć..
# Autor: Mateusz

#pobieranie hostname
get_hostname() {
    echo "Hostname: $(hostname)"
}
#pobieranie nazwy systemu operacyjnego
get_os_name() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "OS: $PRETTY_NAME"
    else
        echo "OS: Nieznany"
    fi
}
# Pobieranie zużycia pamięci RAM
get_ram_usage() {
    meminfo=$(free -m)
    total=$(echo "$meminfo" | awk '/Mem:/ {print $2}')
    used=$(echo "$meminfo" | awk '/Mem:/ {print $3}')
    free=$(echo "$meminfo" | awk '/Mem:/ {print $4}')

    echo "RAM użyta: ${used} MB"
    echo "RAM wolna: ${free} MB"
    echo "RAM całkowita: ${total} MB"
}
# Pobieranie zurzycia pamieci dyskowej
get_disk_usage() {
df -h --output=source,size,used,avail,target | grep '^/dev/sdd' | awk '{printf "Pamięć: %s użyte, %s wolne, %s całkowita\n", $3, $4, $2}'
	}
get_hostname
get_os_name
get_ram_usage
get_disk_usage


