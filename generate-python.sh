python -m pip install grpcio
python -m pip install grpcio-tools

# $1 = absolute path to folder where the .proto is
# $2 = absolute output dir
# $3 = absolute path to .proto file

python -m grpc_tools.protoc -I$1 --python_out=$2 --grpc_python_out=$2 $3
