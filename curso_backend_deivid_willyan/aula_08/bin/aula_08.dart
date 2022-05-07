import 'package:shelf/shelf.dart';

import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';

void main() async {
  //Comando para criar um novo projeto DART: dart create nome_do_projeto

  var cascadeHandler =
      Cascade().add(LoginApi().handler).add(BlogApi().handler).handler;

  var handler = Pipeline().addMiddleware(logRequests()).addHandler(
      cascadeHandler); /* Retorna um log do que está sendo acessado */

  await CustomServer().initialize(handler);

  //Parei no inicio da -> Aula 09
}
