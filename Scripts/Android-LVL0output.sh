UnityPortExperimentsPath=/home/colbydray/Experiments/UnityPort

rm $UnityPortExperimentsPath/Temp/level0
rm $UnityPortExperimentsPath/Temp/level0.split0

unzip -p "$@" assets/bin/Data/level0 > $UnityPortExperimentsPath/Temp/level0
unzip -p "$@" assets/bin/Data/level0.split0 > $UnityPortExperimentsPath/Temp/level0.split0

[ -s $UnityPortExperimentsPath/Temp/level0 ] || rm $UnityPortExperimentsPath/Temp/level0
[ -s $UnityPortExperimentsPath/Temp/level0.split0 ] || rm $UnityPortExperimentsPath/Temp/level0.split0

if [ -f "$UnityPortExperimentsPath/Temp/level0" ]; then
  UnityPlayerVersion=$(strings "$UnityPortExperimentsPath/Temp/level0" | head -1)
fi

if [ -f "$UnityPortExperimentsPath/Temp/level0.split0" ]; then
  UnityPlayerVersion=$(strings "$UnityPortExperimentsPath/Temp/level0.split0" | head -1)
fi

if [ -f "$UnityPortExperimentsPath/Player/$UnityPlayerVersion.rar" ]; then
  echo $@
  echo "$UnityPlayerVersion Available"
  echo ""
else
  echo $@
  echo "$UnityPlayerVersion Not Available"
  echo ""
fi