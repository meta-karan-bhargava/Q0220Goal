#!/bin/bash/

function print_tree() {
	separator="$1"
	shift
	#the parent directory
	parent="$1"
	shift

	#iterate over the sub directories
	for sub_dir
	do
		if [ "${sub_dir}" != "" ]
		then
			echo "${separator}${sub_dir}"
			current_dir="${parent}/${sub_dir}"
			if [ -d "${current_dir}" ]
			then
				#desribe the contents of folder
				folder_descriptor="$(ls -A "${current_dir}")"
				#convert it to array
				readarray -t sub_dirs <<< "${folder_descriptor}"
				#recursively call
				print_tree "${separator}--" "${current_dir}" "${sub_dirs[@]}"
				#backtrack
				parent="${parent}/.."
				#update the separator along with parent
				separator="${separator%--}"
			fi
		fi
	done
}

print_tree "" "." "/"
