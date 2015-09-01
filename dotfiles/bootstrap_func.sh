#!/bin/sh

ln_files_in () {

    dir=${1}
    pre=${2:-.}

    for filepath in ${CONFDIR}/${dir}/*; do
        filename=$(basename "$filepath")

        echo "${pre}${filename}"

        rm -f "${HOME}/${pre}${filename}"
        ln -s "${CONFDIR}/${dir}/${filename}" "${HOME}/${pre}$filename"
    done
}


ln_file () {

    filename=$1
    pre=${2:-.}

    echo "${pre}${filename}"

    rm -f "${HOME}/${pre}${filename}"
    ln -s "${CONFDIR}/${filename}" "${HOME}/${pre}$filename"
}
