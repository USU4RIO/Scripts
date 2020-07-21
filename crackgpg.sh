#!/bin/bash
# Brute force em arquivo gpg

if [ $# != 2 ];then
	echo "> Use: $0 [ARQUIVO] [WORDLIST]"
	exit 1
fi

echo "[INFO]: Arquivo -> $1"
echo "        Wordlist -> $2"
echo "[INFO]: Iniciando brute force..."
echo " "

for linha in $(cat $2);do

	echo "[*] Testando -> $linha"
	if gpg --batch --passphrase "$linha" --decrypt $1 &>> /dev/null;
	then
		echo "[+] Senha encontrada -> $linha"
		break
	fi
done

exit 0
