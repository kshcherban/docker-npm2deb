# docker-npm2deb
npm modules debian packages building automatization

Example of building npm module bem version 0.10.1
```
git clone https://github.com/kshcherban/docker-npm2deb /tmp/npm2deb
cd /tmp/npm2deb
docker build -t npm2deb .
docker run --name=bem_0.10.1 npm2deb npm2deb bem=0.10.1
docker cp bem_0.10.1:/opt/buildroot .
docker rm bem_0.10.1
```

Now you can use image npm2deb to build any npm packages like this:
```
docker run npm2deb npm2deb <package-name>=<version>
```

This image uses fpm as package builder for npm modules.  
Version of node is 0.12.7, you can change it in Dockerfile.
