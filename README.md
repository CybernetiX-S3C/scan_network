proto# scan_network

**scan_network** is a network scanning tool written in Fortran. It can be used to scan for open ports, services, and vulnerabilities on a network. The script can be compiled with the following command:

```
gfortran scan_network.f90 -o scan_network
```

Once the script is compiled, you can run it by typing the following command:

```
./scan_network [options]
```

The options that you can use with the script are:

* `-h, --help` - Show this help message.
* `-p, --port` - Specify the port to scan.
* `-s, --service` - Specify the service to scan.
* `-v, --version` - Print the version of the script.
* `-m, --multiple` - Scan multiple hosts.
* `-f, --file` - Scan hosts from a file.
* `-t, --timeout` - Set the timeout for each connection (in seconds).
* `-c, --count` - Count the number of open ports.
* `-b, --banner` - Print the banner of the service.
* `-e, --encryption` Print the encryption used by the service.
* `-r, --resolve` - Resolve host names.
* `-w, --whois` - Resolve host names and print whois information.
* `-d, --debug` - Output debug information.
* `-p, --protocol` - Specify the protocol to scan (e.g., HTTP, SSH, DNS).

For more information on how to use the script, you can run the `-h` option.

The script is still under development, but it is already a powerful tool for network scanning. I hope you find it useful!


* The script is written in Fortran, which is a high-performance language that is well-suited for network programming.
* The script is portable and can be run on any platform that has a Fortran compiler.
* The script is open source and is available on GitHub.
* The script is well-documented and includes a help message that explains how to use it.


## License

The script is licensed under the MIT License.

## Author

The script was created by John Modica
