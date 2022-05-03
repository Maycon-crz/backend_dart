import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerHandler {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
      return Response(200, body: 'Primeira Rota');
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

    return router;
  }
}

////////PAREI NO INICIO DA AULA 06
