#!/bin/sh

RED='\033[0;31m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
LIGHTCYAN='\033[1;36m'
NC='\033[0m'

echo ""
echo ""
echo -e "${ORANGE}   ___ ___   __  __  ____    ____    __  __     "
echo -e "${ORANGE} /' __` __`\/\ \/\ \/\_ ,`\ /\_ ,`\ /\ \/\ \    "
echo -e "${ORANGE} /\ \/\ \/\ \ \ \_\ \/_/  /_\/_/  /_\ \ \_\ \   "
echo -e "${ORANGE} \ \_\ \_\ \_\ \____/ /\____\ /\____\\/`____ \  "
echo -e "${ORANGE}  \/_/\/_/\/_/\/___/  \/____/ \/____/ `/___/> \ "
echo -e "${ORANGE}                                         /\___/ "
echo -e "${ORANGE}                                         \/__/  "
echo ""
echo ""
echo -e "${YELLOW}┏ Muzzy Git Control ------------"
echo -e "${LIGHTCYAN}"
echo ""
read -p "   Would you like to update NPM Version? [y/n]: " updateState
echo ""
echo ""
read -p "   Please Enter Your Commit Message: " msg
echo ""
echo ""
if [ $updateState == 'y' ];
  then
    echo "   Which version is it?"
    select yn in "Major" "Minor" "Patch"; do
        case $yn in
            Major )
              echo "   Selected Major Version."
              echo ""
              echo "   Updating NPM version to Major and pushing to git."
              echo ""
              npm version major --force -m "$msg"
              break;;
            Minor )
              echo "   Selected Minor Version."
              echo ""
              echo "   Updating NPM version to Minor and pushing to git."
              echo ""
              npm version minor --force -m "$msg"
              break;;
            Patch )
              echo "   Selected Patch Version."
              echo ""
              echo "   Updating NPM version to Patch and pushing to git."
              echo ""
              npm version patch --force -m "$msg"
              break;;
        esac
    done
  else
    echo ""
    echo "   Adding Files to git"
    git add .
    echo ""
    echo "   Commiting Files"
    git commit -m "$msg"
    echo ""
    echo "   Pushing Files to Git"
    git push -u origin master
    echo ""
    echo "   Pushed Successfully."
fi
echo ""
echo ""
echo -e "${GREEN}   All Operations are done."
echo ""
echo ""
echo -e "${YELLOW}┗ --------------------------------"
echo ""
echo -e "${NC}"
