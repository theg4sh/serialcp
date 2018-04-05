CWD=$(shell pwd)

build:
	cp $(CWD)/src/serialcp.sh $(CWD)/serialcp
	base64 $(CWD)/src/serialcp.exp >> $(CWD)/serialcp
	chmod +x $(CWD)/serialcp

all: build
