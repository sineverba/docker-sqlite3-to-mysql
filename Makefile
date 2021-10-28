build:
	docker build --tag sineverba/testdockersqlite3tomysql .

test:
	docker run --rm -it sineverba/testdockersqlite3tomysql python3 --version | grep "Python 3.10.0"
	docker run --rm -it sineverba/testdockersqlite3tomysql sqlite3mysql --version | grep "CPython 3.10.0"
	docker run --rm -it sineverba/testdockersqlite3tomysql sqlite3mysql --version | grep "1.4.8"

destroy:
	docker image rm sineverba/testdockersqlite3tomysql