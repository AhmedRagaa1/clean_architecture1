import 'package:clean_architecture1/core/network/error_message_model.dart';

class ServerException implements Exception
{
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel
  });
}