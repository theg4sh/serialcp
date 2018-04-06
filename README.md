# serialcp

Transfering files between your computer and another computer using usart connection

## Requirements
On both systems require to be installed the following tools: `base64` `gzip`

On system where you going to use _serialcp_ also needs to be installed: `expect` `screen`

```
apt-get install -y expect screen gzip
```

### Remote OS support

Currently, that code was verified with Ubuntu on remote host. Have not been tested with other linux systems.

## Usage

### Configuring

```
cd serialcp
make
$EDITOR ./serialcp
```

Here you can set device, it's baudrate, remote's username and password.

Now, the tool is ready to transfer files: 

```
./serialcp <local_filename> <remote_filename> [in|out]
```

Temporary, an order of arguemnts of local and remote filename is fixed as it described above.
3rd argument set a direction of transferring, where `out` means _send file to remote_ and `in` - _receive from remote_.

### TODO

 - User-friendly argument passing.
 - Stop killing an existing _screen_'s session when transfer is done.
