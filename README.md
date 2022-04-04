# ACER coding challenge for DevOps Candidates

With this challenge we hope to learn how you approach technical tasks.

Please read the entirety of this document carefully, paying attention to the 'Requirements', and most importantly the "What we are looking for" sections.

We are interested in seeing how you work with code in general and understand that you may not be able to create a complete solution. If that is the case, please pick what you would consider the core aspects of the solution. As you go through the requirements you might have a lot questions. Our suggestion is to make assumptions and document them for the interview.

As part of ACER's recruitment process this challenge is confidential, is expressly shared by ACER to you for the purpose of assessing your job application and will not be shared by you to anyone else, nor will you share your response to this challenge.

## The interview
We will be reviewing your response to the challenge prior to the interview, and then during the interview we will be discussing together on the following:
* Confirming your understanding of the requirements
* Any modeling, assumptions or decision making that you made during your solution design
* How you went about solving the requirements in code and decisions about your solution architecture
* We might add a new requirement to understand your ability to adapt to change
* Taking into account anything omitted, how the code could be improved given time

## What are we looking for
This coding challenge is designed to assess the following
* How do you respond to feedback
* Understanding scope and constraints
* Quality of code
* Design and Best practices
* Maintainability and Extensibility of the code

## Requirements
Your task involves creating a local development environment using Docker. This development environment will be used by software developers to develop a LAMP application. Therefore, it should include:
1. A **docker-compose.yaml** file which defines 1 network and 3 services:
   * "app" - Apache (or Nginx) + PHP
   * "db" - A relational database, such as MySQL, MS SQL Server, etc
   * "cache" - A memory cache service, such as Redis, Memcached, etc
2. The **"app" Docker image** should have related PHP extension bundles built in so that the application can connect to the relational database and memory cache services.
3. The above Docker images can be either built from Dockerfile or pulled from Docker hubs.
4. There should be volumes defined for each Docker image so that configuration files (such as http.conf and php.ini) and data files (such as mysql/data) can be organised outside Docker containers.
5. A shell or Python script **server.sh (or server.py)** should be provided to:
   * build / initialise the Docker images, and provision a default database
   * start / stop / restart all docker containers
6. A "readme.md" file to provide the information that necessary for the developers to quickly start their work. The information may be including but not limited to:
   * how to use the script
   * database connection information
   * memory cache connection information
7. The final folder structure may look like
    ```
    /
    |--docker
    |  |--app               // "app" image resources, such as Dockerfile, *.conf, *.ini, etc
    |  |--db                // database image resoures
    |  `--cache             // memory cache image resources
    |--docker-compose.yml
    |--readme.md
    |--server.sh            // or server.py
    `--src                  // PHP src folder, should be mapped to "/usr/local/www/src"
    ```

## How to submit coding challenge response back to ACER
1. Create a public repository in GitHub. Set the repository name to a UUID. Generate a [UUID here](https://www.uuidgenerator.net/)
2. As you develop, make commits to this repository
3. When completed, send the repository URL through an email to the ACER staff who shared this exercise

## Open questions
Please also provide your answers to the following open questions. You may organise the answers in the **readme.md** or a separate file in the same repository.
### Question 1
Describe how you would approach designing a resilient and fault-tolerant hosting infrastructure with AWS for an application currently running on an on-premises load-balanced cluster of application servers and a single MySQL database server. How would you configure networking within that infrastructure? What AWS services would you use and why?

MySQL db using RDS
 - 2 nodes (minimum) in different AZs
 - depending on required performance may add read replica for reporting






### Question 2
If you are given Windows 10 as your work machine (with 8-core CPUs and 16GB RAM), but you need to work with many Pythons and Linux Bash scripting along with many different Linux based docker containers.

Assuming you cannot change the machine’s operating system and cannot re-partition any of the local HDDs; However, you have admin access to install software and enabling some Windows features.

How would you setup your work environment on the machine?

The specifications of the supplied machine are quite high which means that any of the alternatives below could be used. 

1. Use a development environment machine 

Some workplaces keep a development environment within aws as such all that
would be needed is access to this environment via vpn and ssh to access the 
individual machines. 
On windows this could be done with the openVPN windows client and putty.
An advantage to this approach is that code does not leave the development
environment.

2. Windows Subsystem for Linux 

This installs a Linux kernel within Windows.
This supports Docker and shell.

3. Windows Docker

Docker is supported on Windows.
Once Docker is running on windows you can have access to multiple linux 
containers.

4. Virtual Machines

Create a Linux virtual machine and do most of your work within the virtual
machine.
VirtualBox can be used to do this.

If access to Windows pre-installed applications is required I would probably 
start out using WSL and if that is proving to be a problem install a linux
virtual machine.


