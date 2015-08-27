extern crate hyper;

use std::io::write;

use hyper::server;
use hyper::server::request;
use hyper::server::response;
use hyper::net::fresh;

fn hello(_: request, res: response<fresh>) {
    res.send(b"hello world!").unwrap();
}

fn main() {
    server::http("127.0.0.1:3000").unwrap().handle(hello);
}
