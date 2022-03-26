#!/bin/bash

# Regular Colors
BLACK='\033[0;30m'  # Black
RED='\033[0;31m'    # Red
GREEN='\033[0;32m'  # Green
YELLOW='\033[0;33m' # Yellow
BLUE='\033[0;34m'   # Blue
PURPLE='\033[0;35m' # Purple
CYAN='\033[0;36m'   # Cyan
WHITE='\033[0;97m'  # White
NOCOLOR='\033[0m'   # Text Reset

notice() {
  echo -e "$YELLOW"
  echo "###################"
  echo -e "$1"
  echo "###################"
  echo -e "$NOCOLOR"
}

notice "Developer settings by Derek v0.1 - 2022.03.26"

if ! type brew &>/dev/null; then
  notice "brew 가 없어서 설치할게요"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


notice "필요한 패키지들을 설치할게요."
brew "curl"
brew install wget
brew install cask
brew install git

notice "필요한 앱을 설치할게요."
brew install "visual-studio-code"

if ! type aws &>/dev/null; then
  notice "aws 가 없군요? 설치할게요"
  brew install awscli
fi

if ! type aws-vault &>/dev/null; then
  notice "aws-vault 가 없군요? 설치할게요"
  brew cask install aws-vault
fi

if [[ -e $HOME/.aws/config ]]; then
  notice "이미 $HOME/.aws/config 이 있네요, 백업해둘게요"
  cp "$HOME"/.aws/config "$HOME"/.aws/config.backup.$(date +%Y%m%d)
  rm "$HOME"/.aws/config
fi

if ! type node &>/dev/null; then
  notice "node 가 없군요? 설치할게요"
  brew install node
  node -v
  npm -v
  nvm install --lts
fi

if ! type yarn &>/dev/null; then
  notice "yarn이 없군요? 설치할게요"
  npm install --global yarn
  yarn --version
fi

printf "\n\n\n###############################################################################################"

bash -c 'cat > vscode-extensions.txt' <<EOF 
# visual code를 설치하고 cmd+shift+p로 code command를 path에 저장하고 아래 명령어를 실행시키세요.
2gua.rainbow-brackets-0.0.6
4ops.terraform-0.2.5
766b.go-outliner-0.1.20
abuisman.multiline-vim-0.0.7
amazonwebservices.aws-toolkit-vscode-1.36.0
amazonwebservices.aws-toolkit-vscode-1.37.0
an0rak-dev.vscode-gcp-cloudbuild-1.0.0
aws-scripting-guy.cform-0.0.24
bridgecrew.checkov-1.0.75
coenraads.bracket-pair-colorizer-1.0.62
dbaeumer.vscode-eslint-2.2.2
docmarty.open-tig-0.0.3
donjayamanne.githistory-0.6.19
dsznajder.es7-react-js-snippets-4.4.3
dunstontc.vscode-go-syntax-0.0.18
eamodio.gitlens-12.0.5
erd0s.terraform-autocomplete-0.0.8
esbenp.prettier-vscode-9.4.0
golang.go-0.32.0
hashicorp.terraform-2.21.0
itayadler.terraform-ssm-0.3.6
makhmud.echosnippets-1.3.0
mark-tucker.aws-cli-configure-0.3.0
mhutchie.git-graph-1.30.0
ms-azuretools.vscode-docker-1.21.0
ms-ceintl.vscode-language-pack-ko-1.65.3
ms-python.python-2022.2.1924087327
ms-python.vscode-pylance-2022.3.3
ms-toolsai.jupyter-2022.2.1030672458
ms-vscode-remote.remote-containers-0.224.3
ms-vsliveshare.vsliveshare-1.0.5449
ms-vsliveshare.vsliveshare-audio-0.1.91
ms-vsliveshare.vsliveshare-pack-0.4.0
msyrus.go-doc-1.0.1
oderwat.indent-rainbow-8.2.2
pentium10.vscode-gcp-project-switcher-1.0.7
redhat.vscode-yaml-1.5.1
tht13.python-0.2.3
visualstudioexptteam.vscodeintellicode-1.2.17
vscode-icons-team.vscode-icons-11.10.0
xabikos.javascriptsnippets-1.8.0
xyz.local-history-1.8.1
xabikos.ReactSnippets
EOF
