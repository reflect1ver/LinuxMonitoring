#!/bin/bash

export START=$(date +%s%N)
if [ $# != 1 ]
then
echo "Error 1"
elif [ ${1: -1} != "/" ]
then 
echo "Error 2"
else
export number_folders=$(sudo find $1 -type d | wc -l)  # -type d  --- поиск папки, wc -l ---- Вывести количество строк в объекте
export big_folders=$(sudo du -Sh $1 | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}')  # du позволяет пользователю быстро получить информацию об использовании диска,  -sh позволяют нам получить сводку об использовании каталога в удобночитаемом формате. 
# -rh сортировать в обратном порядке в читаемом виде,  head выводит начальные строки (по умолчанию — 10)  из одного или нескольких документов, -5 --- вывести топ 5, cat -n нумеровать все строки, awk вывод поля 
export number_files=$(sudo find $1 -type f | wc -l)  # -type f искать только файлы
export export conf_number_files=$(sudo find $1 -type f -name "*.conf" | wc -l)  # -name - поиск файлов по имени
export exe_number_files=$(sudo find $1 -type f -executable -exec du -h {} + | wc | awk '{ print $1 }')  # для поиска исполняемых файлов -executable,  du позволяет вывести размер всех файлов в определённой папке в байтах или в более удобном формате, 
# -h выводить размер в единицах измерения удобных для человека 
export txt_number_files=$(sudo find $1 -type f -name "*.txt" | wc -l)
export log_number_files=$(sudo find $1 -type f -name "*.log" | wc -l)
export archive_number_files=$(sudo find $1 -regex '.*\(tar\|zip\|gz\|rar\)' | wc -l )
export link_number_files=$(sudo find $1 -type l | wc -l)
export big_files=$(sudo find $1 -type f -exec du -Sh {} + | sort -rh | head -10 | cat -n | awk '{print $1" - "$3", "$2}')
export big_exe_files=$(sudo find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | cat -n | awk '{print $1" - "$3", "$2}')
chmod 777 print.sh
./print.sh
fi