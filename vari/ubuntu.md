# Settaggi Ubuntu

### [FIX] BUG: soft lockup - CPU#0 stuck for Xs!

(https://customerhelp.co.za/linux/ubuntu/fix-ubuntu-bug-soft-lockup-cpu-stuck-vmware-server.html)

Nella schermata d'inizio nel file di grub e aggiungere alla riga GRUB_CMDLINE_LINUX_DEFAULT:
  
pci=noacpi acpi=off noapic

Una volta entrata in Ubuntu:

  sudo vi /etc/default/grub
  
Cerca GRUB_CMDLINE_LINUX_DEFAULT e aggiungi pci=noacpi acpi=off noapic, salva ed esci dal file e come ultima cosa fai:

  sudo update-grub
 
 Restart pc (facoltativo):
 
  sudo shutdown now -r
  
  
### Spostare i bottoni delle cartelle da dx a sinix:

  gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:menu'

