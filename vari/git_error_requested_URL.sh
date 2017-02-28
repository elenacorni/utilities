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
