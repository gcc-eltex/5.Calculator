#!/bin/bash
#Компилируем всё до обьектных модулей
cd src
for file in `find -type f -name "*.c"`;
do
	gcc $file -c
done
cd ..
#Формируем строку со всем модулями
listf=""
for file in `find ./src -name "*.o"`;
do
	listf="$listf $file"
done
#Сибираем библиотеку 
ar -cr libcalc.a $listf
mv libcalc.a ./lib/
#Компилируем сам программу и запускаем
gcc main.c -o main -L./lib/ -lcalc
./main
exit 0