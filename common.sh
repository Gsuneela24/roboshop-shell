pwd=${pwd}
systemd_setup(){
  cp${pwd}/ ${component_name}.service /etc/systemd/system/${component_name}.service
  systemctl daemon-reload
  systemctl enable ${component_name}
  systemctl start ${component_name}
}
nodejs(){
  cp ${component_name}.service /etc/systemd/system/${component_name}.service
  dnf module disable nginx -y
  dnf module enable nginx:1.24 -y
  dnf install nginx -y

  npm install
}
pwd=${pwd}
python(){
  dnf install python3 gcc python3-devel -y

  pip3 install -r requirements.txt
}
app_pre_setup(){
   useradd roboshop
    mkdir /app
    curl -L -o /tmp/${component_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${component_name}-v3.zip
    cd /app
    unzip /tmp/${component_name}.zip
    cd /app
  
}
java(){
  dnf install maven -y
  app_pre_setup
mvn clean package
  mv target/${component_name}-1.0.jar ${component_name}.jar
}