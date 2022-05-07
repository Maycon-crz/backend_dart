import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerHandler {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
      return Response(
        200,
        body: '<h1>Primeira Rota</h1>',
        headers: {
          'content-type': 'text/html',
        },
      );
    });

    //http://localhost:8081/ola/mundo
    //Ola mundo
    router.get('/ola/mundo/<usuario>', (Request req, String usuario) {
      return Response.ok("Ola mundo $usuario");
    });

    //Obs: Depois que criei esse parou de funcionar mas estava funcionando tudo inclusive esse então
    //Se der erro provavelmente deve ser pouca coisa
    //-----------------------
    //Este próximo método não é muito seguro
    //http://localhost:8081/ola/mundo?nome=Maycon&idade=23
    // router.get('/query', (Request req) {
    //   String? nome = req.url.queryParameters['nome'];
    //   String? idade = req.url.queryParameters['idade'];
    //   return Response.ok('Query eh: $nome, idade $idade');
    // });

    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);

      var usuario = json['usuario'];
      var senha = json['senha'];

      if (usuario == 'admin' && senha == '123') {
        Map result = {'token': 'token123', 'user_id': 1};
        String jsonResponse = jsonEncode(result);
        return Response.ok(jsonResponse,
            headers: {'content-type': 'application/json'});
      } else {
        return Response.forbidden('Acesso negado');
      }
    });

    return router;
  }
}

////////PAREI NO INICIO DA AULA 08 ***
