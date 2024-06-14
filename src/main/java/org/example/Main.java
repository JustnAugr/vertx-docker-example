package org.example;

import io.vertx.core.Vertx;

public class Main {
    public static void main(String[] args) {
        Vertx vertx = Vertx.vertx();
        System.out.println("Deploying verticles...");
        vertx.deployVerticle(new WebVerticle());
    }
}