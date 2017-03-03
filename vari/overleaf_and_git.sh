# ####################################################################################################################### #
#                                                                                                                         #
#                                       HOW TO ADD AN EXISTING OVERLEAF PROJECT IN GITHUB                                 #
#                                                                                                                         #
# ....................................................................................................................... #
#                                                                                                                         #
# https://www.overleaf.com/help/233-how-do-i-connect-an-overleaf-project-with-a-repo-on-github-or-bitbucket#.WLlBL39thZ1  #
# https://www.overleaf.com/blog/195#.WLlC2X9thZ0                                                                          #
# https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/                           #
#                                                                                                                         #
# ####################################################################################################################### #


# 1. CLONE AND EDIT PROJECT OVERLEAF LACALY USING GIT

# In your Overleaf Poject: Share > Clone With Git (copy url)
# Clone project into local directory:
git clone https://git.overleaf.com/<ID-PROJECT>   <NAME-DIR>

# Now you can edit it using local tools and then commit chenges with:
git add <WHAT-YOU-WANT-TO-COMMIT>
git commit -m '<DESC>'

# Push your changes into Overleaf using:
git push origin master

# NB: It's possible only master branch on Overleaf,
#  on local repository you can create all branch that you want.


# 2. SAVE INTO GITHUB

# a. Create a new local project:
mkdir overleaf_in_github

# test_overleaf/ is a folder of previus step
mv test_overleaf/ overleaf_in_github/
cd overleaf_in_github/
git init
git add .
git commit -m 'test'
# go to github > create new repository
git remote add origin https://github.com/elenacorni/test_overleaf.git
git push origin master

# in github the 'test_overleaf' folder, where you have cloned overleaf project,
# is seen as submodule.
