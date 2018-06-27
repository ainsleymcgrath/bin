#!/bin/bash

# a function to ease python development
function pystart() {

    #gracious welcome
    echo "Hey, dude. Welcome back.\n"

    # got pipenv?
    if [ -f "Pipfile" ] ;then
        echo "Activating pipenv..."
        pipenv shell
        echo "Done!"

        # developing a flask app?
        if grep "flask" Pipfile --quiet ;then
            echo "Debug mode?"
            read answer
            if [[ "$answer" =~  "[yY]" ]] ;then
                echo "Setting up flask debugging..."
                export FLASK_DEBUG=1      
            else 
                echo "No debug for you."
                export FLASK_DEBUG=0
            fi          
        else
           echo "You're env is ready, my dear."
        fi
    else 
        echo "Would you like to create a new pipenv?"
        read answer
        if [[ "$answer" =~  "[yY]" ]] ;then
            echo "Let's do it!"
        else
            echo "Alright then...."
        fi
    fi
}