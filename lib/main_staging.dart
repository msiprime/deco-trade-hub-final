import 'package:flutter_template_by_msi/bootstrap.dart';
import 'package:flutter_template_by_msi/services/environments/environments.dart';

Future<void> main() async {
  // run the app with the staging environment
  await bootstrap(const StagingEnvironment());
}
