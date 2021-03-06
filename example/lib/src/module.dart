import 'package:thrio/thrio.dart';

import 'biz1/module.dart' as biz1;
import 'biz2/module.dart' as biz2;
import 'models/people.dart';

class Module with ThrioModule, ModuleJsonSerializer, ModuleJsonDeserializer {
  @override
  void onModuleRegister(ModuleContext moduleContext) {
    registerModule(biz1.Module(), moduleContext);
    registerModule(biz2.Module(), moduleContext);
  }

  @override
  void onModuleInit(ModuleContext moduleContext) {
    navigatorLogEnabled = true;
  }

  @override
  void onJsonSerializerRegister(ModuleContext moduleContext) {
    registerJsonSerializer<People>((instance) => instance<People>().toJson());
  }

  @override
  void onJsonDeserializerRegister(ModuleContext moduleContext) {
    registerJsonDeserializer((arguments) => People.fromJson(arguments));
  }
}
