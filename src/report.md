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
