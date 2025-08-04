systemd_setup(){
  systemctl daemon-reload
  systemctl enable ${component_name}
  systemctl start ${component_name}
}
nodejs(){
  dnf module disable nginx -y
  dnf module enable nginx:1.24 -y
  dnf install nginx -y
}