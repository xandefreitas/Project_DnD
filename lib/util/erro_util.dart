import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_dd/common/network/unauthorized_exception.dart';

abstract class ErroUtil {
  static validarException(dynamic e) {
    if (e is DioError) {
      if (!(e.error is String)) {
        return e.error;
      }
    } else {
      return e;
    }
  }

  static rejeitarResposta({@required Exception exception, @required RequestOptions requestOptions, @required ResponseInterceptorHandler handler}) {
    return handler.reject(
      DioError(
        requestOptions: requestOptions,
        error: exception,
      ),
    );
  }

  static HttpException httpException(Response<dynamic> response) {
    return HttpException(obterMensagemErro(response));
  }

  static UnauthorizedException unauthorizedException(Response<dynamic> response) {
    return UnauthorizedException(
      mensagem: obterMensagemErro(response),
      codigo: response.statusCode,
    );
  }

  static obterMensagemErro(Response response) => response.data is String ? response.data : response.data["Message"];
}
