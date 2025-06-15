import 'package:get_it/get_it.dart';

import '../client/api_client.dart';

final getIt = GetIt.instance;

Future<void> inject() async {
  _injectClients();
}

Future<void> _injectClients() async {
  getIt.registerSingleton<ApiClient>(ApiClient());
}
