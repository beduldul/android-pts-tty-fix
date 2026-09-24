# Universal Android 15/16 Pseudo-Terminal (/dev/pts) & SELinux Permission Fixer

Magisk & KernelSU module designed to resolve pseudo-terminal allocation failures (`/dev/pts/0` TTY unavailable) and SELinux denial rules on Android 15 & 16 (AOSP & Custom ROMs).

---

## Technical Root Cause

Android 15+ mounts `/dev/pts` (pseudo-terminal slave) with restricted permissions (`mode=600`). This prevents external terminal applications, debugging binaries, and background root utilities from allocating pseudo-terminal file descriptors.

---

## Fix Mechanism

This module automatically applies runtime mount re-permissions and SELinux policy rules during boot:

```bash
chmod 666 /dev/ptmx
mount -o remount,gid=5,mode=666,ptmxmode=0666 /dev/pts
chmod 666 /dev/pts/*
```

SELinux Policy Injections:
- `allow untrusted_app devpts chr_file { read write open ioctl getattr }`
- `allow magisk devpts chr_file { read write open ioctl getattr }`

---

## Installation

1. Download `Fix_TTY_Access_v6.0.zip` from [Releases](https://github.com/beduldul/android-pts-tty-fix/releases).
2. Install via **Magisk / Kitsune Mask / KernelSU Manager**.
3. Reboot device.

---

## License
GPL-3.0 License
