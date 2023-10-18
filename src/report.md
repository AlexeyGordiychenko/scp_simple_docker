## Part 1. Ready-made docker
1. `nginx` image download with `docker pull`

    ![docker pull nginx](img/part1_1.png)

1. Check docker images:
   
    ![docker images](img/part1_2.png)

1. Run the docker image, check that it's running and inspecting it:

    ![docker run](img/part1_3.png)

1. Data from the `inspect` output:
    + `size` is `1095`
    + only one `port` is mapped: `80/tcp` to null
    + `ip adress` is `172.17.0.2`
    
    ![inspect size](img/part1_4.png)

    ![inspect ports](img/part1_5.png)

    ![inspect ip](img/part1_6.png)

1. Stop the docker image and check that it's stopped:

    ![stop image](img/part1_7.png)

1. Run the `nginx` image with mapped ports:

    ![run with mapped ports](img/part1_8.png)

1. Check if the `nginx` start page is available:

    ![nginx start page](img/part1_9.png)

1. Restart and check that it's running:

    ![restart](img/part1_10.png)

## Part 2. Operations with container

1. Contents of the `nginx.conf` configuration file inside the docker container:

    ![nginx.conf](img/part2_1.png)

1. Local `nginx.conf` file with the `/status` path configured (commented the default settings with `#include /etc/nginx/conf.d/*.conf`):

    ![nginx.conf edited](img/part2_2.png)

1. Copy the local file to the docker container and restart the service:

    ![copy and restart](img/part2_3.png)

1. Check `localhost:80/status` page:

    ![status page](img/part2_4.png)

1. Export and stop the container:

    ![export and stop](img/part2_5.png)

1. Docker won't let us delete an image if it is used by a container. We can use `-f` flag to force it to remove:

    ![export and stop](img/part2_6.png)

1. Delete the stopped container:

    ![export and stop](img/part2_7.png)

1. Import the container back:

    ![export and stop](img/part2_8.png)

1. Run the imported container:

    ![export and stop](img/part2_9.png)

1. Check that `localhost:80/status` returns the nginx server status page:

    ![export and stop](img/part2_10.png)

## Part 3. Mini web server

1. The source file of the mini web server in `C` and `FastCgi` located in the [mini_server.c](./server/mini_server.c) file. It will return a simple page saying `Hello World!` on every request from `127.0.0.1:8080`. It needs to be compiled with the `gcc` compilator in order to use it:

    `gcc -Wall -Wextra -Werror server/mini_server.c -lfcgi -o server/mini_server`:

    ![server source](img/part3_1.png)

1. Create an nginx config that will proxy all requests from port `81` to the server on `127.0.0.1:8080`:

    ![nginx config](img/part3_2.png)

1. Use the official `nginx` docker image to run the mini web server in a container.

    Run the container, copy the files to it and restart the `nginx` service:

    ![run and copy files](img/part3_3.png)

1. Run an interactive shell on the container and install necessary tools to run the server with commands:

    + `apt-get update`
    + `apt-get install libfcgi-dev`

    ![shell](img/part3_4.png)

1. Run the `server`:

    ![server run](img/part3_5.png)

1. Check that it's working:

    ![check](img/part3_6.png)

## Part 4. Your own docker

1. Create a [docker file](./Dockerfile) (base on the official nginx image) which:

    + builds mini server sources on `FastCgi`
    + runs it on port `8080`
    + copies inside the image written `./nginx/nginx.conf`
    + runs `nginx`

    ![docker file](img/part4_1.png)

    The [script](./run.sh), used in the docker file:

    ![script](img/part4_2.png)

1. Now we can build it and check that it's created:

    ![build](img/part4_3.png)

    ![check images](img/part4_4.png)

1. Next run the image with mappings and check that the web server is working:

    ![run](img/part4_5.png)

    ![check](img/part4_6.png)

1. Add proxying of `/status` page in `./nginx/nginx.conf` to return the nginx server status:

    ![/status add](img/part4_7.png)

1. Restart the container:

    ![restart](img/part4_8.png)

1. Check that the `/status` page is working

    ![check status](img/part4_9.png)

## Part 5. Dockle

1. Check the image with dockle:

    ![dockle](img/part5_1.png)

1. Add clean up command and command to set the user to fix the second error and the first warning:

    + `rm -rf /var/lib/apt/lists`
    + `USER nginx`

    ![edit Dokerfile](img/part5_2.png)

1. Change the tag to fix the second warning:

    ![change the tag](img/part5_3.png)

1. Since the official `nginx` image is used there is no way to directly fix the first error, so the `-ak` flag is used to suppress it:

    ![dockle](img/part5_4.png)
