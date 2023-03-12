# fill1986_infra
fill1986 Infra repository


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
