#!/system/bin/sh
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 2
done

if command -v magiskpolicy >/dev/null 2>&1; then
    magiskpolicy --live         "allow untrusted_app ptmx_device chr_file { read write open ioctl getattr }"         "allow untrusted_app devpts chr_file { read write open ioctl getattr }"         "allow untrusted_app tty_device chr_file { read write open ioctl getattr }"         "allow untrusted_app_34 ptmx_device chr_file { read write open ioctl getattr }"         "allow untrusted_app_34 devpts chr_file { read write open ioctl getattr }"         "allow untrusted_app_34 tty_device chr_file { read write open ioctl getattr }"         "allow untrusted_app_35 ptmx_device chr_file { read write open ioctl getattr }"         "allow untrusted_app_35 devpts chr_file { read write open ioctl getattr }"         "allow untrusted_app_35 tty_device chr_file { read write open ioctl getattr }"         "allow untrusted_app_36 ptmx_device chr_file { read write open ioctl getattr }"         "allow untrusted_app_36 devpts chr_file { read write open ioctl getattr }"         "allow untrusted_app_36 tty_device chr_file { read write open ioctl getattr }" 2>/dev/null
fi

chmod 666 /dev/ptmx 2>/dev/null
chmod 666 /dev/pts/* 2>/dev/null
chmod 666 /dev/tty 2>/dev/null

while true; do
    chmod 666 /dev/ptmx 2>/dev/null
    chmod 666 /dev/pts/* 2>/dev/null
    chmod 666 /dev/tty 2>/dev/null
    sleep 10
done &
