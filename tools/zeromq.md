# ZeroMQ

A messaging queue that focuses on simplicity, prioritizing removing complexity over adding new functionality.


## Links

- [Getting Started Guide](https://zguide.zeromq.org/)
- [API](http://api.zeromq.org/)





## Installation
If these don't work then go to the [ZMQ Download page](https://zeromq.org/download/).

### Python
```bash
pip install pyzmq
```

### C Headers
```bash
apt-get install libzmq3-dev    # Debian / Ubuntu
pacman -S zeromq               # Arch / Manjaro
```




## Basic Client and Server Setup in C

### Server

```c
//  Example server

#include <zmq.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <assert.h>

int main (void)
{
    // Establish socket connection
    void *context = zmq_ctx_new ();
    void *responder = zmq_socket (context, ZMQ_REP);
    int rc = zmq_bind (responder, "tcp://*:5555");    // "*" receives from all sources
    assert (rc == 0);

    while (1) {
        char buffer [255];
        zmq_recv (responder, buffer, 255, 0);          // zmq_recv (SOCKET, BUFFER, BUFFER SIZE, FLAGS)

        // Act on request (do work)

        // Send response to client
        zmq_send (responder, "RESPONSE", 9, 0);       // zmq_send (SOCKET, BUFFER, BUFFER SIZE, FLAGS)
    }

    // Close socket and clean up
    zmq_close (responder);
    zmq_ctx_destroy (context);

    return 0;
}
```

### Client

```c
//  Example client

#include <zmq.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>

int main (void)
{
    // Establish socket connection
    printf ("Connecting to ZMQ server...\n");
    void *context = zmq_ctx_new ();
    void *requester = zmq_socket (context, ZMQ_REQ);
    zmq_connect (requester, "tcp://localhost:5555");    // Change localhost to your server

    //  Send request
    char buffer [10];                                   // Make buffer large enought to store response
    zmq_send (requester, "RESPONSE", 9, 0);             // zmq_send (SOCKET, BUFFER, BUFFER SIZE, FLAGS)
    zmq_recv (requester, buffer, 255, 0);               // Make buffer large enought to store response

    // Close socket and clean up
    zmq_close (requester);
    zmq_ctx_destroy (context);

    return 0;
}
```

### ZeroMQ Strings in C
Strings received in C they might not be terminated correctly.
If you are sending strings from a C context you can include the `NULL` byte.
For example: `zmq_send (requester, "send", 5, 0);`
However, messages sent from non-null byte terminated languages (e.g. Python) will not, and overrunning will occur.

Best practice is always to copy the message to a new buffer and terminate the buffer with a null byte.
There is a function called `s_recv` in the [zhelpers.h](https://github.com/booksbyus/zguide/blob/master/examples/C/zhelpers.h) file provided by the ZeroMQ developers that does this well.
