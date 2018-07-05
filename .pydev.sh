#!/bin/bash

RED='\033[0;31m'
BLUE='\e[34m'
GRAY='\e[90m'
NO_COLOR='\033[0m'
CLEAR_LINE='\r\033[K'

# to ease python boilerplate
function pystart() {

    #gracious welcome
    printf "${CLEAR_LINE}👋 ${BLUE} Hey, dude. Welcome back.\n"

    # got pipenv?
    if [ -f "Pipfile" ] ;then

        printf "${CLEAR_LINE}🐍 ${NO_COLOR} Activating pipenv...\n"
        pipenv shell --bare
        printf "${CLEAR_LINE}👌 ${GRAY} Done!\n"

        # developing a flask app?
        if grep "flask" Pipfile --quiet ;then

            printf "${CLEAR_LINE}🐞 ${NO_COLOR} Debug mode?\n"
            
            read user_response
            if [[ "$user_response" =~  "[yY]" ]] ;then

                printf "Setting up flask debugging...\n"
                export FLASK_DEBUG=1   
                printf "${CLEAR_LINE}👌 ${GRAY} Done!\n" 

            else 

                printf "${CLEAR_LINE} ${BLUE} No debug for you. 🙅‍\n"
                export FLASK_DEBUG=0

            fi          

            # TODO: prompt to pick a .py file as FLASK_APP

        else

           printf "${CLEAR_LINE} ${BLUE}You're env is ready, my dear. 😊\n"

        fi

    else 

        printf "${CLEAR_LINE} ${BLUE} Would you like to create a new pipenv?\n"

        read user_response
        if [[ "$user_response" =~  "[yY]" ]] ;then

            printf "Let's do it!\n 🥈 or 🥉?\n"

            REGEX='(three)|3'
            read user_response
            if [[ "$user_response" =~ $REGEX ]] ;then
            
                printf "${CLEAR_LINE}🐍 ${NO_COLOR} Creating python3 pipenv...\n"
                pipenv --three
                printf "${CLEAR_LINE}👌 ${GRAY} Done!\n" 

                printf "${CLEAR_LINE}🐍 ${NO_COLOR} Activating pipenv...\n"
                pipenv shell
                printf "${CLEAR_LINE}👌 ${GRAY} Done!\n"

            else 
            
                printf "${CLEAR_LINE}🐍 ${NO_COLOR} Creating python2 pipenv...\n"
                pipenv --two 
                printf "${CLEAR_LINE}👌 ${GRAY} Done!\n" 

                printf "${CLEAR_LINE}🐍 ${NO_COLOR} Activating pipenv...\n"
                pipenv shell
                printf "${CLEAR_LINE}👌 ${GRAY} Done!\n"

            fi

        else

            printf "${CLEAR_LINE} ${BLUE} There's nothing for us to do then bye. 🙆‍👌\n"
        
        fi
    
    fi
}


# to shut down the env
function pystop() {
    
    printf "${CLEAR_LINE}🐍 ${NO_COLOR} Dectivating pipenv...\n"
    deactivate #TODO: check if this works``
    printf "${CLEAR_LINE}👌 ${GRAY} Done!\n"
    
}


# to destroy the env and un-python the directory
function pysmash() {
    printf "${CLEAR_LINE}💥 ${NO_COLOR} Destroying pipenv...\n"
    pipenv --rm --bare
    rm -f Pipfile Pipfile.lock 
}