import 'package:flutter_client_php_backend/utils/constants.dart';

class EventObject {
  int id;
  Object object;

  EventObject(
      {this.id: EventConstants.NO_INTERNET_CONNECTION, this.object: null});
}
