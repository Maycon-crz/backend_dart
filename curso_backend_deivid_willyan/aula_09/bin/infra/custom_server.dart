import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> initialize({
    required Handler handler,
    required String address,
    required int port,
  }) async {
    //--------------------
    //Usei esse código aqui em baixo porque não estava funcionando essa instancia do .env - (Verificar o erro!)
    String address = 'localhost';
    int port = 8082;
    //--------------------
    await shelf_io.serve(handler, address, port);
    print('Servidor inicializado -> http://$address:$port');
  }
}
