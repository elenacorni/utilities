# Settaggi Ubuntu

# Table of Contents
0. [soft lockup - CPU#0 stuck](#soft-lockup-cpu0-stuck)
1. [BUG: soft lockup - CPU#0 stuck for Xs!](#bug-soft-lockup---cpu0-stuck-for-xs)
2. [Example2](#example2)
3. [Third Example](#third-example)

## soft lockup - CPU#0 stuck
## Example
## Example2
## Third Example




## BUG: soft lockup - CPU#0 stuck for Xs!

(https://customerhelp.co.za/linux/ubuntu/fix-ubuntu-bug-soft-lockup-cpu-stuck-vmware-server.html)

Nella schermata d'inizio nel file di grub e aggiungere alla riga `GRUB_CMDLINE_LINUX_DEFAULT`: `pci=noacpi acpi=off noapic`.  
Salvare e accendere la vm/macchina.

Una volta in Ubuntu:
```sh
sudo vi /etc/default/grub
```
Cerca `GRUB_CMDLINE_LINUX_DEFAULT` e aggiungi `pci=noacpi acpi=off noapic`, salva ed esci dal file e come ultima cosa fai:
```sh
sudo update-grub
```
 
Restart pc (facoltativo):
```sh
sudo shutdown now -r  
```
  
### Spostare i bottoni delle cartelle da dx a sinix:
```sh
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:menu'
```

