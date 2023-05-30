SHELL=/bin/bash
REPO_ROOT ?= /root
VENV_ROOT ?= /root/venvs

uname_m := $(shell uname -m)
$(info uname_m=$(uname_m))

docker_file=Dockerfile
tag_name=bepro/opencv:23.05
run_options=`nvidia-smi &> /dev/null && echo "--runtime=nvidia -e NVIDIA_DRIVER_CAPABILITIES=utility,video,compute --network=host -e PYTHONPATH="${PYTHONPATH}:/root/opencv-python/_skbuild/linux-x86_64-3.8/cmake-build/lib/python3""`

build:
	docker build --no-cache --progress=plain -t $(tag_name) -f Dockerfile .
	docker tag $(tag_name) bepro/opencv:new
run:
	docker run -it --rm --pid=host $(run_options) $(tag_name)
clean:
	rm -rf volume