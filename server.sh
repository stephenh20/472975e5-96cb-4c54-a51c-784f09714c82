#/bin/bash
#
# This script starts / stops the docker development environment
# it also resets the database back to the test data
#
# set some paths
# archive of test db 
datafile=docker/db/data.tar.gz
# location of database data
dbdir=docker/db/data
# do some simple checks
if [ ! -f docker-compose.yml ]
then
    echo "No docker-compose file - are you in the project directory ?"
    exit 0
fi
`UID_GID="$(id -u):$(id -g)" docker-compose config -q`
dc=$?
if [ $dc -ne 0 ] 
then
    echo "docker-compose not in path / not installed / config failed"
    exit 0
fi
# process options and do the work
while getopts udr flag
do
    case "${flag}" in
        u) UID_GID="$(id -u):$(id -g)" docker-compose up;;
        d) docker-compose down;;
        r) 
            if [ -f ${datafile} ]
            then
                if [ -d ${dbdir} ]
                then
                    echo "about to clear database dir (${dbdir})"
                    echo "<ENTER> to continue <ctrl-c> to exit"
                    read
                    docker-compose down
                    rm -rf ${dbdir}/*
                    tar xzvf ${datafile} -C ${dbdir}
                    chown -R $(id -u):$(id -g) ${dbdir}
                    UID_GID="$(id -u):$(id -g)" docker-compose up
                else
                    echo "No database dir found (${dbdir})"
                    exit 0
                fi
            else
                echo "No data.tar.gz file to extract (${datafile})"
                exit 0
            fi
        ;;
        *) echo "$0 -u = up, -d = down, -r = reset"; exit 0;;
    esac
done

