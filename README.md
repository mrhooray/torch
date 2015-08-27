# torch
> A script that glues perf CPU sampling and [Brendan Gregg's visualizer](https://github.com/brendangregg/FlameGraph) to generate FlameGraphs.

* [Dependency](#dependency)
* [Usage](#usage)
* [Examples](#examples)
* [License](#license)

##Dependency
Linux 3.7 and above

##Usage
```
#./torch.sh -h
Usage: torch [<OPTIONS>]

Options:
-h, --help            show this screen
-p, --pid <pid>       process id of the program
-d, --duration <num>  duration of sampling in seconds
-o, --output <file>   file to save flamegraph to
```

##Examples
###Click graph to zoom
Simple Program ([source](https://github.com/mrhooray/torch/blob/master/examples/simple-program.rs))
[![simple-program](https://cdn.rawgit.com/mrhooray/torch/master/examples/simple-program.svg)](https://cdn.rawgit.com/mrhooray/torch/master/examples/simple-program.svg)
Tcp Echo Server ([source](https://github.com/mrhooray/torch/blob/master/examples/tcp-echo-server.rs)) with [coio-rs](https://github.com/zonyitoo/coio-rs)
[![tcp-echo-server](https://cdn.rawgit.com/mrhooray/torch/master/examples/tcp-echo-server.svg)](https://cdn.rawgit.com/mrhooray/torch/master/examples/tcp-echo-server.svg)
HTTP Hello World ([source](https://github.com/mrhooray/torch/blob/master/examples/http-hello-world.rs)) with [hyper](https://github.com/hyperium/hyper)
[![http-hello-world](https://cdn.rawgit.com/mrhooray/torch/master/examples/http-hello-world.svg)](https://cdn.rawgit.com/mrhooray/torch/master/examples/http-hello-world.svg)

##License
MIT
