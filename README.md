# fill1986_infra
fill1986 Infra repository

## Homework Terraform--1
Установлен terraform v1.4.2
Создан конф. файл maint.tf в котором задикларированна инфраструктура YC и в качестве образа используется ранее созданный с помощью Packer шаблон.  

Для управления ресурсами YC добавлен модуль provider yandex v0.87.0, в котором также заданы ключи для подключения Terraform r YC.

Дополнительно в разделе *provisioner* файла main.tf определен порядок установки и запуска сервиса *puma*. Порядок подключения провижионеров определен в разделе *connection*.

Запуск создания инстанса 
```
$ terraform apply
```


чтобы удобней искать назначенный IP в выводимой информации, c помощью файла outputs.tf настроен вывод IP после создания инстанса.

Для проверки подключения к созданному инстансу:
```
ssh ubuntu@<внешний_IP>
```

Проверка работы приложения:
http://external_ip_address_app:9292



## Homework Packer

В директории /packer создан файл (Packer шаблон) ubuntu16.json содержащий описание для сборки обаза VM с предустановленными Ruby и MongoDB

Выполнение процесса сборки образа: 
``` 
$ packer build ./ubuntu16.json
```

### Построение bake-образа
Дополнительно создан фалй шаблона содержащий также  все зависимости и сам код приложения.
Выполнение процесса сборки образа:  
```
$ packer build -var-file=scripts/variables.json.examples ./immutable.json
```

### Автоматизация создания ВМ
Дополнительно создан скрипт для создаиня VM с помощью Yandex.Cloud CLI: /congig-scipts/
create-reddit-vm.sh
=======
# HomeWork: Деплой тестового приложения

testapp_IP = 130.193.38.232 
testapp_port = 9292

CLI для создания инстанса:
```  
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
```

Подключаемся к созданной VM:
```
ssh yc-user@$PUBLIC_IP_ADDRESS
```
Для установки Ruby, MongoDB выполнить на VM скрипты install_ruby.sh и install_mongodb
Для скачивания и установики приложения выполнить deploy.sh

Проверка рабоыт приложения: http://external_ip:port


# HomeWork: Знакомство с облачной инфраструктурой инфраструктурой. Yandex.Cloud  
##Task: Исследовать способ подключения к someinternalhost в одну команду из вашего рабочего устройства:  
ssh -i .ssh/appuser -J appuser@158.160.36.85 appuser@10.129.0.23

##Additional task: Предложить вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost (по алиасу):  
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
##Task 3: Опишите получившуюся конфигурацию и данные для подключения:  
bastion_IP = 158.160.36.85  
someinternalhost_IP = 10.129.0.23

testapp_IP = 35.198.167.169
testapp_port = 9292

