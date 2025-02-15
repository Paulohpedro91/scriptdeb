# Instalação e Configuração do Sistema Debian

Este script é usado para configurar um sistema Debian com repositórios extras, drivers proprietários, fontes da Microsoft, suporte a Flatpak e pacotes de 32 bits. Além disso, configura o Uncomplicated Firewall (UFW).

## Pré-requisitos

Certifique-se de que você tenha permissões de superusuário antes de executar este script.

## Passos de Instalação

1. **Ativação de repositórios extras (DebMultimedia)**:
    ```sh
    echo "deb https://www.deb-multimedia.org bookworm main non-free" | sudo tee /etc/apt/sources.list.d/deb-multimedia.list
    ```

2. **Adicionando repositórios principais do Debian**:
    ```sh
    echo "deb http://deb.debian.org/debian bookworm main contrib non-free" | sudo tee -a /etc/apt/sources.list
    echo "deb http://deb.debian.org/debian bookworm-updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
    echo "deb http://security.debian.org/debian-security bookworm-security main contrib non-free" | sudo tee -a /etc/apt/sources.list
    ```

3. **Adicionando repositório Backports**:
    ```sh
    echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list
    ```

4. **Atualizando lista de pacotes**:
    ```sh
    sudo apt-get update -oAcquire::AllowInsecureRepositories=true
    ```

5. **Instalando a chave do repositório DebMultimedia**:
    ```sh
    sudo apt-get install deb-multimedia-keyring
    ```

6. **Atualizando novamente e realizando a atualização de distribuição**:
    ```sh
    sudo apt-get update
    sudo apt-get dist-upgrade
    ```

7. **Instalação de drivers de vídeo proprietários Nvidia**:
    ```sh
    sudo apt install nvidia-detect linux-headers-amd64
    nvidia-detect
    sudo apt install nvidia-driver 
    sudo apt install nvidia-cuda-dev nvidia-cuda-toolkit libnvidia-encode1
    ```

8. **Instalação das fontes da Microsoft**:
    ```sh
    sudo apt install ttf-mscorefonts-installer
    ```

9. **Ativação do suporte a Flatpak no sistema**:
    ```sh
    sudo apt install flatpak gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    ```

10. **Ativação de pacotes de 32 bits**:
    ```sh
    sudo dpkg --add-architecture i386
    sudo apt update
    ```

11. **Configuração do Uncomplicated Firewall (UFW)**:
    ```sh
    sudo apt install ufw
    sudo ufw limit 22/tcp
    sudo ufw allow 80/tcp
    sudo ufw allow 443/tcp
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw enable
    ```

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.
