# regist

Это полноэкранное приложение windows для сенсорного экрана на Flutter. Сенсорный монитор устанавливается на стойке регистрации. Новый клиент выбирает цель посещения, вводит свое имя, по итогу отправляется сообщение от бота в чат telegram со всеми HR менеджерами, что пришел новый клиент и его надо встретить. Выполнено в фирменом стиле компании.

![image](https://github.com/mottiya/regist/assets/113792589/94ec67b6-3fe3-46bf-af65-62f6d961c100)

![image](https://github.com/mottiya/regist/assets/113792589/10e50061-f90d-4bfe-95df-4ffe2c815b84)

## Getting Started

Установить dart/Flutter.

Добавить токен telegram бота и id чата в который будут приходить сообщения в код, в файле .\lib\services\telegram_service.dart

(Бот должен быть добавлен в группу telegram и разрешены сообщения, иметь права администратора)

После этого в терминале нужно ввести flutter build windows. Создастся репозиторий .\build

Далее можно создать ярлык рабочего стола или запустить exe файл из .\build\windows\runner\Release\regist.exe
