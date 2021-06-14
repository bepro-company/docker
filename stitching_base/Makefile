tag_name=bepro/stitching_base:latest
run_options=--runtime=nvidia -e NVIDIA_DRIVER_CAPABILITIES=utility,video,compute

build:
	docker build --pull -t $(tag_name) .

push:
	docker push $(tag_name)

run:
	docker run -it --rm $(run_options) $(tag_name)
