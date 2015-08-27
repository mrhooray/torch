#!/usr/bin/env sh
USAGE="Usage: torch [<OPTIONS>]

Options:
-h, --help            show this screen
-p, --pid <pid>       process id of the program
-d, --duration <num>  duration of sampling in seconds
-o, --output <file>   file to save flamegraph to"

while [[ $# > 0 ]]
do
    key="$1"

    case $key in
        -p|--pid)
            PID="$2"
            shift
            ;;
        -d|--duration)
            DURATION="$2"
            shift
            ;;
        -o|--output)
            OUTPUT="$2"
            shift
            ;;
        -h|--help)
            HELP=true
            ;;
        *)
            echo "Error: Invalid Option $1"
            echo "$USAGE"
            exit 1
            ;;
    esac
    shift
done

if [ "$HELP" = true ]
then
    echo "$USAGE"
    exit 0
fi

if [[ -z "$PID" ]] || [[ -z "$DURATION" ]] || [[ -z "$OUTPUT" ]]
then
    echo "Error: Missing Options"
    echo "$USAGE"
    exit 1
fi

function get_temp_file() {
    local tmppath=${1:-/tmp}
    local tmpfile=$2${2:+-}
    tmpfile=$tmppath/$tmpfile$RANDOM$RANDOM.tmp
    if [ -e $tmpfile ]
    then
        tmpfile=$(gettmpfile $1 $2)
    fi
    echo $tmpfile
}

TEMP_FILE=$(get_temp_file /tmp torch)
echo "sampling pid $PID for $DURATION seconds" && \
perf record -o $TEMP_FILE -F 199 -p $PID -a --call-graph dwarf -- sleep $DURATION > /dev/null && \
echo "saving flame graph to $OUTPUT" && \
perf script -i $TEMP_FILE | ./stackcollapse-perf.pl | ./flamegraph.pl > $OUTPUT && \
echo "done."
rm -rf $TEMP_FILE
