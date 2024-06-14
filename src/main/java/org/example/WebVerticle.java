package org.example;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.http.HttpServer;
import io.vertx.core.http.HttpServerResponse;
import io.vertx.ext.web.Router;

public class WebVerticle extends AbstractVerticle {
    @Override
    public void start() {
        HttpServer server = vertx.createHttpServer();
        Router router = Router.router(vertx);

        router.route().handler(ctx -> {
            HttpServerResponse resp = ctx.response();
            resp.putHeader("content-type", "text/plain");

            resp.end("Howdy!");
        });

        server.requestHandler(router).listen(8080);
        System.out.println("Server's up and ready!");
    }
}
