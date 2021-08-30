# Python Debugging in Docker

This enables remote python debugging in a docker container using the debugpy pip package. One benefit that an IDE like VSCode provides is the ability to add breakpoints easily. However, because of the use of docker, this breakpoint does not stop unless additional steps are done. This is a quick tutorial to creating that mapping between the local machine and the remote machine (docker in this case) so that those breakpoints will stop the code running in the container.

Flow:

1. Run Container
2. Run pytest
3. Add breakpoints (interchangeable with previous step)
4. Launch python debugger (using VSCode)

**Note**: The following lines must be included for the remote debugger to work properly. It creates a listener that hooks into VSCode by following the DAG (Debug Adapter Protocol)

```
debugpy.listen(("0.0.0.0", 5678)) // address and port in the docker container
debugpy.wait_for_client()
```

The above will wait for the client (in this case vscode) to complete the tcp handshake. Once the python debugger is "launched", the pytest will run as normal.

## Dependencies

- debugpy >= 1.4.1
- pytest >= 6.2.4

## Quickstart

To run, simply run

```
make run
```

## Breakpoints

Simply add breakpoints through VSCode

## Pytest

pytest is a python testing framework. To run, in a separate terminal:

```sh
make exec
```

This will essentially ssh or exec into the running docker container. Then run

```sh
pytest
```

To ensure that debugpy is running, the output in terminal should say

```sh
collecting...
```
