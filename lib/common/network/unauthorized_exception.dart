import 'package:flutter/widgets.dart';

class UnauthorizedException implements Exception {
  final dynamic mensagem;
  final int codigo;

  UnauthorizedException({@required this.mensagem, @required this.codigo});
}
