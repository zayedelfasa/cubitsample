import 'package:cubitloginsample/views/login/login_view.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final routes = Sailor();

  static void createRoutes() {
    routes.addRoutes([
      SailorRoute(
          name: "/LoginPage",
          builder: (context, args, params) {
            return LoginView();
          },
          params: [SailorParam<int>(name: "id", defaultValue: 1234)]),
    ]);
  }
}
