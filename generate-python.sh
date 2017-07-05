#!/bin/sh

[ -z $1 ] && [ -z $2 ] && [ -z $3 ] && {
    echo "Usage: $0 <proto-path> <out-dir> <proto-file>"
    echo '    $1 = absolute path to folder where the .proto is'
    echo '    $2 = absolute output dir'
    echo '    $3 = absolute path to .proto file'
    exit 1
}

python -m pip install grpcio grpcio-tools > /dev/null 2>&1

# $1 = absolute path to folder where the .proto is
# $2 = absolute output dir
# $3 = absolute path to .proto file

python -m grpc_tools.protoc -I$1 --python_out=$2 --grpc_python_out=$2 $3

sed -i "s/import messages_pb2 as messages__pb2/import eu.softfire.tub.messaging.grpc.messages_pb2 as messages__pb2/g" $2/messages_pb2_grpc.py
