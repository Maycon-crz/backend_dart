import 'package:shelf/shelf.dart';

class MiddlewareInterception {
  //Middleware é uma classe que intecepta a nossa requisição e pode fazer algo antes de ser executada.
  Middleware get middleware => createMiddleware(
        responseHandler: (Response res) => res.change(
          headers: {
            'content-type': 'application/json',
            'xpto': '123',
          },
        ),
      );
}
