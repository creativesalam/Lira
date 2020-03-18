#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # get current directory
#echo $DIR
#source $DIR/venv/bin/activate
#cd $DIR/src
#python classify.py
python3 -m venv $DIR/venv
source $DIR/venv/bin/activate
pip install -r $DIR/requirements.txt

echo "[Desktop Entry]" > ~/.local/share/applications/Lira.desktop
echo "Version=1.0" >> ~/.local/share/applications/Lira.desktop
echo "Type=Application" >> ~/.local/share/applications/Lira.desktop
echo "Terminal=false" >> ~/.local/share/applications/Lira.desktop
echo "Icon[en_US]=$DIR/lira/icons/xdiagnose-lira.png" >> ~/.local/share/applications/Lira.desktop
echo "Exec=$DIR/lira/lira.sh" >> ~/.local/share/applications/Lira.desktop
echo "Name[en_US]=Lira" >> ~/.local/share/applications/Lira.desktop
echo "Comment[en_US]=Launch L.I.R.A." >> ~/.local/share/applications/Lira.desktop
echo "Name=Lira" >> ~/.local/share/applications/Lira.desktop
echo "Comment=Launch L.I.R.A." >> ~/.local/share/applications/Lira.desktop
echo "Icon=$DIR/lira/icons/xdiagnose-lira.png" >> ~/.local/share/applications/Lira.desktop
echo "GenericName[en_US]=Classify Bacterial Lesions" >> ~/.local/share/applications/Lira.desktop

curl https://downloads.imagej.net/fiji/latest/fiji-linux64.zip --output $DIR/fiji.zip
unzip $DIR/fiji.zip -d $DIR/src/
rm $DIR/fiji.zip

mkdir $DIR/../Input\ Images
mkdir $DIR/../Output\ Stats
mkdir $DIR/data
mkdir $DIR/data/images
mkdir $DIR/data/user_progress
mkdir $DIR/data/type_one_detections_before_editing
mkdir $DIR/data/type_one_detections_after_editing
mkdir $DIR/data/prediction_grids_before_editing
mkdir $DIR/data/prediction_grids_after_editing
mkdir $DIR/data/unit_tests