import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:renter_pay/core/data/local/theme_service.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await GetStorage.init();
    Get.put(ThemeService());
    Get.put(ThemeController());
  });

  tearDownAll(() {
    Get.reset();
  });

  testWidgets('App builds smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(token: ''));
    await tester.pumpAndSettle();
    expect(find.byType(GetMaterialApp), findsOneWidget);
  });
}
