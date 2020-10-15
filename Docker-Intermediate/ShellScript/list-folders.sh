#!/bin/bash/

function print_tree() {
	separator="$1"
	shift
	parent="$1"
	shift
	for sub_dir
	do
		if [ "${sub_dir}" != "" ]
		then
			echo "${separator}${sub_dir}"
			current_dir="${parent}/${sub_dir}"
			if [ -d "${current_dir}" ]
			then
				folder_descriptor="$(ls -A "${current_dir}")"
				readarray -t sub_dirs <<< "${folder_descriptor}"
				print_tree "${separator}--" "${current_dir}" "${sub_dirs[@]}"
				parent="${parent}/.."
				separator="${separator%--}"
			fi
		fi
	done
}

print_tree "" "." "/"
