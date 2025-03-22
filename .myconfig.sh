repo=docker-renv-2025
space=larsvilhuber
dockerrepo=$(echo $space/$repo | tr [A-Z] [a-z] | sed 's/-internal//')
case $USER in
  vilhuber)
  #WORKSPACE=$HOME/Workspace/git/
  WORKSPACE=$PWD
  ;;
  codespace)
  WORKSPACE=/workspaces
  ;;
esac
tag=2025-03-21
