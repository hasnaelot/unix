

function check_guess {
    local files=$(ls -l | grep "^-" | wc -l)  
    local guess=$1 

    if [[ $guess -lt $files ]]; then
        echo "Trop bas ! Essayez à nouveau."
    elif [[ $guess -gt $files ]]; then
        echo "Trop haut ! Essayez à nouveau."
    else
        echo "Félicitations ! Vous avez deviné le bon nombre de fichiers : $files"
        exit 0
    fi
}


function main {
    echo "Bienvenue dans le jeu de devinette du nombre de fichiers dans le répertoire actuel."

    while true; do
        echo "Combien de fichiers se trouvent dans le répertoire actuel ?"
        read -p "> " guess  

        if [[ $guess =~ ^[0-9]+$ ]]; then
            check_guess $guess  
        else
            echo "Veuillez saisir un nombre entier positif."
        fi
    done
}

main  

