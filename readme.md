Docker video dummy
==================

## How to use

```bash
docker volume create --name x11tmp

docker rm -f video-dummy

docker run -d \
	--name video-dummy \
	-v x11tmp:/tmp/.X11-unix \
	brugnara/video-dummy

# now you can use the dummy video with something like:

docker volume create --name atom-home

docker rm -f atom

docker run -d \
	--name atom \
	-v x11tmp:/tmp/.X11-unix/ \
        -v atom-home:/home/atom/.atom \
	-e DISPLAY=:1 \
        brugnara/atom
```

## Credits

- https://techoverflow.net/2019/02/23/how-to-run-x-server-using-xserver-xorg-video-dummy-driver-on-ubuntu/
- https://stackoverflow.com/questions/39085462/xdummy-in-docker-container
