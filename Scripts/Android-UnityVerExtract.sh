unzip -p apk.apk assets/bin/Data/level0 >level0

UnityPortExperimentsPath=/home/colbydray/Experiments/UnityPort

UnityPlayerVersion=$(strings level0 | head -1)
if [ ! -f "$UnityPortExperimentsPath/Player/$UnityPlayerVersion.rar" ]; then
    echo "NA $UnityPlayerVersion"
    exit
fi

unzip $UnityPortExperimentsPath/Games/apk.apk 'assets/bin/Data/*' -d $UnityPortExperimentsPath/Games/
cd $UnityPortExperimentsPath/Games/assets/bin/Data

mkdir $UnityPortExperimentsPath/Games/result
unrar x $UnityPortExperimentsPath/Player/$UnityPlayerVersion.rar $UnityPortExperimentsPath/Games/result
find "$UnityPortExperimentsPath/Games/result/$UnityPlayerVersion/" -name "sharedassets*.assets*" -exec rm -v {} \; 
find "$UnityPortExperimentsPath/Games/result/$UnityPlayerVersion/" -name "level0*" -exec rm -v {} \; 
find "$UnityPortExperimentsPath/Games/result/$UnityPlayerVersion/" -name "level1*" -exec rm -v {} \; 
find "$UnityPortExperimentsPath/Games/result/$UnityPlayerVersion/" -name "globalgamemanagers*" -exec rm -v {} \; 

if [ -d "$UnityPortExperimentsPath/Games/result/$UnityPlayerVersion/player_Data" ]; then
	mv $UnityPortExperimentsPath/Games/result/$UnityPlayerVersion/player_Data $UnityPortExperimentsPath/Games/result/$UnityPlayerVersion/Data
fi
cp -avrf . $UnityPortExperimentsPath/Games/result/$UnityPlayerVersion/Data