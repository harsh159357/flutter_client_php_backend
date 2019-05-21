# Flutter Client PHP Backend

## App Demonstrating the use of Flutter and PHP.

* App Logo Created Using [Logo Maker](http://logomakr.com)
* For Hosting used [000webhost](https://hafinse.000webhostapp.com)

## Built With

* [Flutter](https://flutter.io) - Cross Platform App Development Framework

## Screenshots

<div id="images" style="#images {
    white-space: nowrap;
}">
<img src="screenshots/Splash.png" alt="Splash" width="150" height="300">
<img src="screenshots/Home.png" alt="Home" width="150" height="300">
<img src="screenshots/Login.png" alt="Login" width="150" height="300">
<img src="screenshots/Registration.png" alt="Registration" width="150" height="300">
<img src="screenshots/Change_Password.png" alt="Change Password" width="150" height="300">
</div>
<br/>

## How to use this App.
* Host the sample included inside [phpbackend](https://github.com/harsh159357/flutter_client_php_backend/tree/master/phpbackend) on preffered web hosting
* Create a table inside your database using [FlutterClientPhpBackend.sql](https://github.com/harsh159357/flutter_client_php_backend/blob/master/phpbackend/FlutterClientPhpBackend.sql)
* If you are using your own website just edit the following constant inside [constants.dart](https://github.com/harsh159357/flutter_client_php_backend/blob/master/lib/utils/constants.dart)

      static const String API_BASE_URL = "https://hafinse.000webhostapp.com";

* Make sure to edit [DBOperations.php](https://github.com/harsh159357/flutter_client_php_backend/blob/master/phpbackend/DBOperations.php) and change following things -

    private $host = 'your_host';
    private $user = 'your_user_name';
    private $db = 'your_database';
    private $pass = 'your_password';

### Not Interested in doing above steps just clone this repo and use it as it is already hosted on Free Web Host 000webhost [hafinse](https://hafinse.000webhostapp.com)


## Features Implemented
* Splash
* Login
* Registration
* Change Password

## Things you can learn through this project -
* Navigation Between Pages.
* Performing Operations in Background Thread.
* Network Requests.
* Serializing and DesSerializing JSON.
* Dialogs and SnackBar.
* Custom Progress Dialog.
* Rest API Integration.
* Store and Retrieve values from Shared Preference.

### Its Android CounterPart [Click Here](https://github.com/harsh159357/android_client_php_backend)

### If you are aware of [Postman](https://www.getpostman.com/) you can use [Postman Collection](https://www.getpostman.com/collections/80394d2fc7c2aed05cc5) for Rest API used in this repo

## Helping Hands for this project

* https://flutter.io/
* https://pub.dartlang.org/packages/flutter_launcher_icons
* https://pub.dartlang.org/packages/shared_preferences
* https://pub.dartlang.org/packages/http
* https://pub.dartlang.org/packages/json_serializable
* https://flutter.io/json/#creating-model-classes-the-json_serializable-way
* https://flutter.io/json/
* https://flutter.io/cookbook/networking/fetch-data/
* https://flutter.io/cookbook/


### :heart: Found this project useful?
If you found this project useful, then please consider giving it a :star: on Github and sharing it with your friends via social media.

### Last But not Least
There are still some things which are pending in this project make a pull request to improve this project or suggest an idea
to improve this project further by raising issues.

### Project Maintained By

# [Harsh Sharma](http://bit.ly/githarsh)

Android Developer

<a href="http://bit.ly/stackharsh"><img src="https://github.com/aritraroy/social-icons/blob/master/stackoverflow-icon.png?raw=true" width="60"></a>
<a href="http://bit.ly/lnkdharsh"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a>
<a href="http://bit.ly/harshfb"><img src="https://github.com/aritraroy/social-icons/blob/master/facebook-icon.png?raw=true" width="60"></a>

License
-------

    Copyright 2018 Harsh Sharma

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
