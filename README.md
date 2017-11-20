# torch
> A script that glues perf CPU sampling and [Brendan Gregg's visualizer](https://github.com/brendangregg/FlameGraph) to generate FlameGraphs.

* [Requirements](#requirements)
* [Usage](#usage)
* [Examples](#examples)
* [License](#license)

## Requirements
Linux 3.7 and above

## Usage
```
#./torch.sh -h
Usage: ./torch.sh [options] pid

Options:
-d, --duration <num>  duration of sampling in seconds [default: 10]
-o, --output <file>   file to save flamegraph to [default: ./flamegraph.svg]
-h, --help            this message
```

## Examples
### Click graph to zoom
A loop printing stuff ([source](https://github.com/mrhooray/torch/blob/master/examples/loop.rs))
[![loop](https://cdn.rawgit.com/mrhooray/torch/master/examples/loop.svg)](https://cdn.rawgit.com/mrhooray/torch/master/examples/loop.svg)
Tcp Echo Server ([source](https://github.com/mrhooray/torch/blob/master/examples/tcp-echo-server.rs)) with [coio-rs](https://github.com/zonyitoo/coio-rs)
[![tcp-echo-server](https://cdn.rawgit.com/mrhooray/torch/master/examples/tcp-echo-server.svg)](https://cdn.rawgit.com/mrhooray/torch/master/examples/tcp-echo-server.svg)
HTTP Hello World ([source](https://github.com/mrhooray/torch/blob/master/examples/http-hello-world.rs)) with [hyper](https://github.com/hyperium/hyper)
[![http-hello-world](https://cdn.rawgit.com/mrhooray/torch/master/examples/http-hello-world.svg)](https://cdn.rawgit.com/mrhooray/torch/master/examples/http-hello-world.svg)

## License
MIT
CDDL
