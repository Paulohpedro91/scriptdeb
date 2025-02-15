# Ativação de repositórios extras (DebMultimedia)
echo "deb https://www.deb-multimedia.org bookworm main non-free" | sudo tee /etc/apt/sources.list.d/deb-multimedia.list

# Adicionando repositórios principais do Debian
echo "deb http://deb.debian.org/debian bookworm main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bookworm-updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security bookworm-security main contrib non-free" | sudo tee -a /etc/apt/sources.list

# Adicionando repositório Backports
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list

# Atualizando lista de pacotes
sudo apt-get update -oAcquire::AllowInsecureRepositories=true

# Instalando a chave do repositório DebMultimedia
sudo apt-get install deb-multimedia-keyring

# Atualizando novamente e realizando a atualização de distribuição
sudo apt-get update
sudo apt-get dist-upgrade

# Instalação de drivers de vídeo proprietários Nvidia
sudo apt install nvidia-detect linux-headers-amd64
nvidia-detect
sudo apt install nvidia-driver 
sudo apt install nvidia-cuda-dev nvidia-cuda-toolkit libnvidia-encode1

# Instalação das fontes da Microsoft
sudo apt install ttf-mscorefonts-installer

# Ativação do suporte a Flatpak no sistema
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Ativação de pacotes de 32 bits
sudo dpkg --add-architecture i386
sudo apt update

# Configuração do Uncomplicated Firewall (UFW)
sudo apt install ufw
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
