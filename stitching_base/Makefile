tag_name=bepro/stitching_base:cv_gl
run_options=--runtime=nvidia -e NVIDIA_DRIVER_CAPABILITIES=utility,video,compute

build:
	docker build --pull --progress=plain --no-cache -t $(tag_name) .

push:
	docker push $(tag_name)

run:
	docker run -it --rm $(run_options) $(tag_name)
