build:
	docker build --tag sineverba/testdockersqlite3tosql .

test:
	docker run --rm -it sineverba/testdockersqlite3tosql sqlite3mysql --version | grep "3.10.0"
	docker run --rm -it sineverba/testdockersqlite3tosql sqlite3mysql --version | grep "1.4.8"

destroy:
	docker image rm sineverba/testdockersqlite3tosql