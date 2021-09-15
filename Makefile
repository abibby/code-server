build:
	docker build -t abibby/code-server .

run:
	docker run -p '8443:8443' abibby/code-server