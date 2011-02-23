#!/bin/bash
# $Id: makedoc.sh,v 1.2 2007/12/10 01:11:19 ashnazg Exp $ 

#/**
#  * makedoc - PHPDocumentor script to save your settings
#  *
#  * @copyright         makedoc.sh is part of PHPDocumentor project {@link http://freshmeat.net/projects/phpdocu/} and its LGPL
#  * @author            Roberto Berto <darkelder (inside) users (dot) sourceforge (dot) net>
#  * @version           Release-1.1.0
#  */

tmpPath='/tmp/phpboost' && mkdir ${tmpPath} 2> /dev/null
tmpDocPath=${tmpPath}'/doc' && rm -rf ${tmpDocPath} && mkdir ${tmpDocPath}

directory=`pwd`
cd ${1} && source=`pwd`
cd ${directory} && cd ${2} && destination=`pwd`

## Title of generated documentation, default is 'Generated Documentation'
TITLE="PHPBoost Framework Documentation"
## Default package name
PACKAGES="phpboost"
## Directories to parse : directory1,directory2
PATH_PROJECT=$source/*.class.php,$source/*.inc.php
IGNORE_PATH=/lib/,/content/geshi/
## PHPDoc executable
## Output target
PATH_DOCS=${tmpDocPath}

CUSTOM_TAGS=warning ## Custom tags
PRIVATE=on ## Parse private
PEAR=on ## Pear Mode

## Output format to use (html/pdf)
OUTPUTFORMAT=HTML
CONVERTER=Smarty
TEMPLATE=PHP

#### Définir la variable ${PHPBOOST_SVN_PATH} en dehors du script ####
# make documentation
${PHPBOOST_SVN_PATH}'/tools/phpdoc/phpdoc' -f "$PATH_PROJECT" -t "$PATH_DOCS" -ti "$TITLE" -dn $PACKAGES -ct $CUSTOM_TAGS -o $OUTPUTFORMAT:$CONVERTER:$TEMPLATE -p $PEAR -pp $PRIVATE -i $IGNORE_PATH -j on

rm -rf ${destination}'/phpdoc.zip' && cd ${tmpPath} && zip -r ${destination}'/phpdoc.zip' doc > /dev/null