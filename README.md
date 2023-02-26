# fill1986_infra
fill1986 Infra repository

#Task: Исследовать способ подключения к someinternalhost в одну команду из вашего рабочего устройства:  
ssh -i .ssh/appuser -J appuser@158.160.36.85 appuser@10.129.0.23

#Additional task: Предложить вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost (по алиасу):  
Редактируем - config ~/.ssh.config:  
```
Host bastion 
    HostName 158.160.36.85  
    IdentityFile ~/.ssh/appuser 
    User appuser 

Host someinternalhost 
    Hostname 10.129.0.23 
    User appuser 
    ProxyJump bastion 
```
#Task 3: Опишите получившуюся конфигурацию и данные для подключения:  
bastion_IP = 158.160.36.85  
someinternalhost_IP = 10.129.0.23



