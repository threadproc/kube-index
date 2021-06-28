GOOS ?= linux
GOARCH ?= amd64

.PHONY: build-image
build-image:
	mkdir -p output
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o output/kube-index-linux-amd64
	docker build -t ghcr.io/threadproc/kube-index:latest .

push-image: build-image
	docker push ghcr.io/threadproc/kube-index:latest