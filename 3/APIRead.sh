#!/bin/bash

mail=$1 #Mail del usuario como argumento 1
idalbcustom=$2 #Mail del album como argumento 2
iduser=$(curl --silent "https://jsonplaceholder.typicode.com/Users?email="${1} | jq '.[]|.id')
echo "\n El ID del Usuario " $mail " es " ${iduser}
postuser=$(curl --silent "https://jsonplaceholder.typicode.com/posts?userId="${iduser}  | jq '.')
echo "\n Los Post de este user son" ${postuser}
albumuser=$(curl --silent "https://jsonplaceholder.typicode.com/albums?userId="${iduser}  | jq '.')
echo "\n Los albumes de este user son" ${albumuser}
titleNumAlbum=$(curl --silent "https://jsonplaceholder.typicode.com/albums?id="${idalbcustom} | jq '.[]|.title' | sed 's/\ /%20/g' | sed 's/\"//g')
echo "\n Nombre del album" $titleNumAlbum
customalbumser=$(curl --silent "https://jsonplaceholder.typicode.com/users/"${iduser}"/albums?title="${titleNumAlbum}  | jq '.[]')
echo "\n Album " idalbcustom " de este user " ${customalbumser}
