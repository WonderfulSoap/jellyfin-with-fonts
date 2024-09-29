latest_version=$(curl -s  https://api.github.com/repos/jellyfin/jellyfin/releases/latest | jq -r .tag_name)
echo "the latest version is $latest_version"

dockerhub_tags=$(curl -s https://registry.hub.docker.com/v2/repositories/wondersoap/jellyfin-with-fonts/tags)
if [[ "$dockerhub_tags" == *"$latest_version"* ]]; then
    echo "version $latest_version already built and pushed to docker hub. finish"
    exit
fi

# build and push docker image
echo $DOCKER_HUB_TOKEN | docker login -u wondersoap --password-stdin
docker build . --build-arg LATEST_VERSION=$latest_version -t wondersoap/jellyfin-with-fonts:$latest_version -t wondersoap/jellyfin-with-fonts:latest
docker push wondersoap/jellyfin-with-fonts:$latest_version
docker push wondersoap/jellyfin-with-fonts:latest

