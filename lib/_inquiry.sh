#!/bin/bash

get_mysql_root_password() {
  print_banner
  printf "${WHITE} 💻 Enter password for the Deploy user and Database (Do not use special characters):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " mysql_root_password
}

get_link_git() {
  print_banner
  printf "${WHITE} 💻 Enter the GITHUB link of your whaticket to install:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " link_git
}

get_instancia_add() {
  print_banner
  printf "${WHITE} 💻 Enter a name for the Instance/Company to be installed (Do not use spaces or special characters, use lowercase letters only):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " instancia_add
}

get_max_whats() {
  print_banner
  printf "${WHITE} 💻 Enter the number of Connections/Whats that ${instancia_add} can register:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " max_whats
}

get_max_user() {
  print_banner
  printf "${WHITE} 💻 Enter the number of Users/Attendants that ${instancia_add} can register:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " max_user
}

get_frontend_url() {
  print_banner
  printf "${WHITE} 💻 Enter the domain of the FRONTEND/PANEL for ${instancia_add}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " frontend_url
}

get_backend_url() {
  print_banner
  printf "${WHITE} 💻 Enter the domain of the BACKEND/API for ${instancia_add}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " backend_url
}

get_frontend_port() {
  print_banner
  printf "${WHITE} 💻 Enter the FRONTEND port for ${instancia_add}; Ex: 3000 to 3999 ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " frontend_port
}

get_backend_port() {
  print_banner
  printf "${WHITE} 💻 Enter the BACKEND port for this instance; Ex: 4000 to 4999 ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " backend_port
}

get_redis_port() {
  print_banner
  printf "${WHITE} 💻 Enter the REDIS/MSG SCHEDULING port for ${instancia_add}; Ex: 5000 to 5999 ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " redis_port
}

get_empresa_delete() {
  print_banner
  printf "${WHITE} 💻 Enter the name of the Instance/Company to be deleted (Enter the same name used during installation):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_delete
}

get_empresa_atualizar() {
  print_banner
  printf "${WHITE} 💻 Enter the name of the Instance/Company to be updated (Enter the same name used during installation):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_atualizar
}

get_empresa_bloquear() {
  print_banner
  printf "${WHITE} 💻 Enter the name of the Instance/Company to be blocked (Enter the same name used during installation):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_bloquear
}

get_empresa_desbloquear() {
  print_banner
  printf "${WHITE} 💻 Enter the name of the Instance/Company to be unblocked (Enter the same name used during installation):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_desbloquear
}

get_empresa_dominio() {
  print_banner
  printf "${WHITE} 💻 Enter the name of the Instance/Company to change domains (Attention: to change domains, you need to enter both domains, even if you are changing only one):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_dominio
}

get_alter_frontend_url() {
  print_banner
  printf "${WHITE} 💻 Enter the NEW domain of the FRONTEND/PANEL for ${empresa_dominio}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_frontend_url
}

get_alter_backend_url() {
  print_banner
  printf "${WHITE} 💻 Enter the NEW domain of the BACKEND/API for ${empresa_dominio}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_backend_url
}

get_alter_frontend_port() {
  print_banner
  printf "${WHITE} 💻 Enter the port of the FRONTEND of the Instance/Company ${empresa_dominio}; The port must be the same as provided during installation ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_frontend_port
}

get_alter_backend_port() {
  print_banner
  printf "${WHITE} 💻 Enter the port of the BACKEND of the Instance/Company ${empresa_dominio}; The port must be the same as provided during installation ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_backend_port
}

get_urls() {
  get_mysql_root_password
  get_link_git
  get_instancia_add
  get_max_whats
  get_max_user
  get_frontend_url
  get_backend_url
  get_frontend_port
  get_backend_port
  get_redis_port
}

software_update() {
  get_empresa_atualizar
  frontend_update
  backend_update
}

software_delete() {
  get_empresa_delete
  deletar_tudo
}

software_bloquear() {
  get_empresa_bloquear
  configurar_bloqueio
}

software_desbloquear() {
  get_empresa_desbloquear
  configurar_desbloqueio
}

software_dominio() {
  get_empresa_dominio
  get_alter_frontend_url
  get_alter_backend_url
  get_alter_frontend_port
  get_alter_backend_port
  configurar_dominio
}

inquiry_options() {
  print_banner
  printf "${WHITE} 💻 Welcome to Whaticket Manager - Unlimited support, select the next action below!${GRAY_LIGHT}"
  printf "\n\n"
  printf "   [0] Install whaticket\n"
  printf "   [1] Update whaticket\n"
  printf "   [2] Delete whaticket\n"
  printf "   [3] Block whaticket\n"
  printf "   [4] Unblock whaticket\n"
  printf "   [5] Change whaticket domain\n"
  printf "\n"
  read -p "> " option

  case "${option}" in
    0) get_urls ;;

    1) 
      software_update 
      exit
      ;;

    2) 
      software_delete 
      exit
      ;;
    3) 
      software_bloquear 
      exit
      ;;
    4) 
      software_desbloquear 
      exit
      ;;
    5) 
      software_dominio 
      exit
      ;;        

    *) exit ;;
  esac
}
