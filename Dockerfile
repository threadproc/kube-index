FROM scratch
COPY output/kube-index-linux-amd64 /kube-index
CMD ["/kube-index"]