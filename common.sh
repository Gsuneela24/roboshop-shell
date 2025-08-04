systemd_setup(){
  systemctl daemon-reload
  systemctl enable ${component_name}
  systemctl start ${component_name}
}
nodejs(){
  cp ${component_name}.service /etc/systemd/system/${component_name}.service
  dnf module disable nginx -y
  dnf module enable nginx:1.24 -y
  dnf install nginx -y
  useradd roboshop
  mkdir /app
  curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/${compoent_name}-v3.zip
  cd /app
  unzip /tmp/${component_name}.zip
  cd /app
  npm install
}
pwd=${pwd}