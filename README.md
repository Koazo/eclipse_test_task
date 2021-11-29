# eclipse_test_task

Это приложение flutter, тестовое задание от Eclipse Digital

## Задание

Стек: Flutter.
Используя сервис https://jsonplaceholder.typicode.com/ реализовать псевдо-приложение/
Список экранов:

1. Список пользователей. Вывод списка, полученного по апи в виде карточек вида
   [
   username
   name
   ]
2. Страница пользователя. Подробный вывод информации о пользователе
   [
   в AppBar - username
   (далее по списку)
   name
   email
   phone
   website
   working(company)[
   name
   bs
   catchPhrase (курсив, какцитата)
   ]
   adress
   список из 3-х превью (заголовок, 1 строчка текста...) постов пользователя + возможность посмотреть все (экран 3)
   список из 3-х превью альбомов пользователя с миниатюрой + возможность посмотреть все (экран 4)
   ]
3. список постов пользователя. Все посты в формате превью + возможность перейти на детальную (экран 5)
4. список альбомов пользователя
5. детальная страница поста со списком всех комментариев c именем и email. так же, внизу экрана добавить кнопку добавления комментария. По клику открывается форма с 3 полями имя, email, текс комментария и кнопкой "отправить/send" (на выбор: отдельный экран, модальное окно, bottomSheet). Отправку сделать на тот же сервис.
6. детальная альбома. Все фото альбома с описанием и слайдером
   Требования к внешнему виду: понятный интерфейс на Ваш вкус.

Дополнительное задание:
Кэшировать все ответы от сервиса, т.е. по мере использования приложения создавать дубликат данных. Например, запросили пользователей – закэшировали, запросили альбомы пользователя, отправили комментарий к посту, закэшировали. И при каждом запросе проверять кэш на наличие данных, если они имеются отдавать из кэша, отсутствуют запросили с сервиса. Реализация кэша на ваш выбор (SharedPreferences, hive, SQLite, и т.д.).

## Что использовалось

- Эмулятор: Pixel 4 XL (Android 9.0 Pie)
- [IDE: Visual Studio Code](https://visualstudio.microsoft.com/ru/vs/)
- [SDK: Flutter 2.5.3-stable](https://docs.flutter.dev/get-started/install/windows)

### Используемые пакеты

- [http: ^0.13.4](https://pub.dev/packages/http)
- [email_validator: ^2.0.1](https://pub.dev/packages/email_validator)
- [fluttertoast: ^8.0.8](https://pub.dev/packages/fluttertoast)
- [shimmer: ^2.0.0](https://pub.dev/packages/shimmer)
- [flutter_staggered_animations: ^1.0.0](https://pub.dev/packages/flutter_staggered_animations)
- [carousel_slider: ^4.0.0](https://pub.dev/packages/carousel_slider)

## Демонстрация

### Первый экран

![image](https://user-images.githubusercontent.com/71566968/143688365-667b6240-3079-4cba-82a4-cd1897949022.png)

### Второй экран
![image](https://user-images.githubusercontent.com/71566968/143688375-712044b0-8c8d-4896-8716-d6dc3626b157.png)
![image](https://user-images.githubusercontent.com/71566968/143688404-715762c0-4101-49f6-92c6-89f40d71f1cc.png)

### Третий экран 
![image](https://user-images.githubusercontent.com/71566968/143920623-8eb7220e-2ccf-4f12-bb6b-a6ec85412b24.png)

### Четвертый экран

![image](https://user-images.githubusercontent.com/71566968/143920678-e7cf93fd-ac19-4036-b9d3-c9251d2026ee.png)

### Пятый экран

![image](https://user-images.githubusercontent.com/71566968/143920753-5e541854-f97b-47f2-ad7e-87168531bdf1.png)
![image](https://user-images.githubusercontent.com/71566968/143920809-bba9311d-5b02-4304-858d-e7846f03f3f7.png)
![image](https://user-images.githubusercontent.com/71566968/143920833-dfb6b4f4-633e-4a6a-bc30-383f017db3aa.png)
![image](https://user-images.githubusercontent.com/71566968/143920854-d7ea2e92-db7b-452f-ac68-6961473b3ba6.png)

### Шестой экран 

![image](https://user-images.githubusercontent.com/71566968/143920949-6768a1a4-b7bc-456b-a8cb-d0b4290ab75f.png)
![image](https://user-images.githubusercontent.com/71566968/143920918-2766ea6f-3f97-4271-9fde-50da73cd6f44.png)

## Резюмируя
Все задачи из ТЗ, были выполнены, за исключением отображения миниатюр(thumbnail) альбомов на экранах 2 и 4. Кеширование данных присутствует.
Необходимо провести код рефакторинг, обновление UI, добавить проверки и лоадеры для более приятного опыта и корректной работы программы в случае сбоев. 
