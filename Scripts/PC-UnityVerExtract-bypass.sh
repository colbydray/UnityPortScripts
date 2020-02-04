
UnityPortExperimentsPath=/home/colbydray/Experiments/UnityPort

UnityPlayerVersion="5.4.0f3"

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