#!/bin/sh

if [ -z ${MINKO_HOME} ]; then
	echo "MINKO_HOME variable is empty"
	exit 1
fi

include_path=${MINKO_HOME}/plugin/assimp/include/minko/file
src_path=${MINKO_HOME}/plugin/assimp/src/minko/file

echo "include path: ${include_path}"
echo "src path: ${src_path}"

cd ${MINKO_HOME}/plugin/assimp/tool/lin/script

source assimp-parser-decl.sh

for loader in ${!loaders[@]}; do
    parser_name=${loader}

    header_file=${include_path}/parser_file_name=${parser_name}ASSIMPParser.hpp
    src_file=${src_path}/parser_file_name=${parser_name}ASSIMPParser.cpp

    rm -v ${header_file} ${src_file}
done

echo "all files successfully removed"
