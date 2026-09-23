import 'FbObjects/Perfil.dart';
import 'InsLib/bot_bars/InsBotBarStyle1.dart';

class DataHolder {
  DataHolder._();
  static final DataHolder instance = new DataHolder._();
  late Perfil perfilUsuario;

  bool blNotificacionesBadge = true;
  int _bottomNavIndex = 0;

}