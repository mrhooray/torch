extern crate coio;

use std::io::{Read, Write};
use std::thread;

use coio::net::TcpListener;
use coio::{spawn, run};

fn main() {
    spawn(move|| {
        let acceptor = TcpListener::bind("127.0.0.1:3000").unwrap();

        for stream in acceptor.incoming() {
            let mut stream = stream.unwrap();

            spawn(move|| {
                let mut buf = [0; 1024];

                loop {
                    match stream.read(&mut buf) {
                        Ok(0) => {
                            break;
                        },
                        Ok(len) => {
                            stream.write_all(&buf[0..len]).unwrap();
                        },
                        Err(err) => {
                            break;
                        }
                    }
                }

            });
        }
    });

    run(4);
}
