build:
	docker build -t abibby/code-server .

rebuild:
	docker build --no-cache -t abibby/code-server .

run:
	docker run -p '8443:8443' -v $$PWD/config:/config abibby/code-server