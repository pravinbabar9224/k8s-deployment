#!/bin/bash
#title	:helm.sh
#author :<Aliabbas Kothawala bloglearn72@gmail.com>
#description: kubernetes deployment using helm chart
#======================================================
echo "lets fire💥💯"
#======================================
chart_name="nginx"
release_name="nginxdeploy"
present="$(helm ls |sed '1d'|awk '{print $1}'|grep -i $release_name)"
image="cloudmonster123/docker"
if [ "nginxdeploy" == "$release_name" ]
then
helm upgrade --install $release_name $chart_name --set image.name=$image --set image.tag=v$BUILD_NUMBER
else
helm install $chart_name --name-template=$release_name --set image.name=$image --set image.tag=v$BUILD_NUMBER
fi
