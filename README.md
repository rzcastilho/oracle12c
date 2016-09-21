[![](https://images.microbadger.com/badges/image/rodrigozc/oracle12c.svg)](https://microbadger.com/images/rodrigozc/oracle12c "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/rodrigozc/oracle12c.svg)](https://microbadger.com/images/rodrigozc/oracle12c "Get your own version badge on microbadger.com")

# Oracle12c + SSH Server
Oracle12c XE with SSH Server

---------------------------------------
### Installation and Usage

    docker pull rodrigozc/oracle12c
---------------------------------------
Run with all ports opened:

    docker run -d -p 1521:1521 -p 8080:8080 -p 2222:22 rodrigozc/oracle12c
---------------------------------------
Oracle user password for ssh access:

    welcome1
---------------------------------------
Database password for SYSTEM and SYS:

    oracle
