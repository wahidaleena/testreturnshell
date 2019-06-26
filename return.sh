lockdir="somedir"
test() {
    retval=""

    if mkdir "$lockdir"
        then    # Directory did not exist, but it was created successfully
            echo >&2 "successfully acquired lock: $lockdir"
            retval="true"
        else
            echo >&2 "cannot acquire lock, giving up on $lockdir"
            retval="false"
    fi
    return retval
}


retval=test()
if [ "$retval" == "true" ]
    then
        echo "directory not created"
    else
        echo "directory already created"
fi
