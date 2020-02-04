UnityPortExperimentsPath=/home/colbydray/Experiments/UnityPort
UnityPlayerVersion=$(strings "$@" | head -1)
if [ -f "$UnityPortExperimentsPath/Player/$UnityPlayerVersion.rar" ]; then
  echo $@
  echo "$UnityPlayerVersion Available"
  echo ""
fi