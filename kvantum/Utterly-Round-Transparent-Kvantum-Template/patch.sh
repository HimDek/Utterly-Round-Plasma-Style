#! /bin/bash

CONFIG='./example.patchconfig'
SAVE='./patchedKvantum'
TEMPLATE='.'
HELP=0

while [ True ]; do
if [ "$1" = "--config" -o "$1" = "-c" ]; then
    CONFIG=$2
    shift 2
elif [ "$1" = "--save" -o "$1" = "-s" ]; then
    SAVE=$2
    shift 2
elif [ "$1" = "--template" -o "$1" = "-t" ]; then
    TEMPLATE=$2
    shift 2
elif [ "$1" = "--help" -o "$1" = "-h" ]; then
    HELP=1
    shift 1
else
    break
fi
done

#ARG=( "${@}" )

#for i in ${ARG[@]}; do
#    echo $i
#done

if [[ $HELP = 1 ]]; then
    echo '
Usage:
    patch.sh [options]

    -h, --help
        show this help message

    -c path, --config=path (default="./example.patchconfig")
        path to patchconfig file

    -s path, --save=path (default="./patchedKvantum")
        path where to save the patched Kvantum theme folder

    -t path, --template=path (default=".")
        path to the template Kvantum theme folder

Patchconfig file syntax:
    # Colors in hex format. Should not be empty
    background=#2e3440
    foreground=#eceff4
    accent=#5e81ac
    negative=#bf616a
    button=#4c566a
    inactive=#d8dee9
    link=#81a1c1
    visitedlink=#8fbcbb

    # Details. "name" should not be empty
    name=general-name-of-color-scheme
    author="Name of author to put in kvconfig"
    comment="This comment will be put in kvconfig"
    '
    exit 0
fi

get_base_name() {
  echo "$(basename "$(cd  "$1" && pwd)")"
}

templateName="$(get_base_name $TEMPLATE)"

if [[ -f "$CONFIG" ]]; then
    . $CONFIG
else
    echo error: $CONFIG is not a file
    exit 1
fi

if [[ -f "$TEMPLATE/$templateName.info" &&  -f "$TEMPLATE/$templateName.svg" && -f "$TEMPLATE/$templateName.kvconfig" ]]; then
    . $TEMPLATE/$templateName.info
else
    echo error: $TEMPLATE is not a valid template folder
    exit 2
fi

if ! [[ $background =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ &&
        $foreground =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ &&
        $accent =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ &&
        $negative =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ &&
        $button =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ &&
        $inactive =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ &&
        $link =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ &&
        $visitedlink =~ ^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$ &&
        -n "$name"
    ]] ; then
    echo error: $CONFIG is not a valid patchconfig. To get the syntax of a valid patchconfig, see the help message \(patch.sh -h\)
    exit 3
fi

mkdir -p $SAVE/$finalName/

sed "
    s/#000000/$background/
    s/#ffffff/$foreground/
    s/#0000ff/$accent/
    s/#ff0000/$negative/
    s/#444444/$button/
    s/#888888/$inactive/
    " $TEMPLATE/$templateName.svg > $SAVE/$finalName/$finalName.svg

sed "
    s/author_name/$author/
    s/comment_line/$comment/
    s/#000000/$background/
    s/#ffffff/$foreground/
    s/#0000ff/$accent/
    s/#ff0000/$negative/
    s/#444444/$button/
    s/#888888/$inactive/
    s/#8888ff/$link/
    s/#4444ff/$visitedlink/
    " $TEMPLATE/$templateName.kvconfig > $SAVE/$finalName/$finalName.kvconfig

echo success: Patched Kvantum theme saved in $SAVE/$finalName/
