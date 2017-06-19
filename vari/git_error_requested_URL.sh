# ######################################## #
# git push origin master
# > error: The requested URL returned error: 403 Forbidden while accessing https://github.com/elenacorni/pita.git/info/refs
# >
# > fatal: HTTP request failed
# > -bash-4.1$ cat remoteBackup.sh
# > git push origin master
# > -bash-4.1$ git push origin master
# > error: The requested URL returned error: 403 Forbidden while accessing https://github.com/elenacorni/pita.git/info/refs
# >
# > fatal: HTTP request failed
#
# check if you are in the same situation:
# git config -l
# OUTPUT:
# > user.name=elenacorni
# > user.email=elena.corni@cnaf.infn.it
# > core.repositoryformatversion=0
# > core.filemode=true
# > core.bare=false
# > core.logallrefupdates=true
# > remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
# > remote.origin.url=https://github.com/elenacorni/pita.git
# > branch.master.remote=origin
# > branch.master.merge=refs/heads/master
# ######################################## #

git remote rm origin
git remote add origin https://<username>@<string-after-https://>
# es: git remote add origin https://elenacorni@github.com/elenacorni/pita.git
git push -u origin master

# se però ti da' quest'errore:
(gnome-ssh-askpass:29049): Gtk-WARNING **: cannot open display:

# risolvere dando:
unset SSH_ASKPASS

# and then running (You can also add the line to your .bashrc file.):
git push origin master

Password:
Counting objects: 4, done.
Delta compression using up to 24 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 279 bytes, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://elenacorni@github.com/elenacorni/utilities.git
   fbe98f0..a2b0290  master -> master
Branch master set up to track remote branch master from origin.

:-)
