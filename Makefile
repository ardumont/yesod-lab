install:
	(aptitude show haskell-platform 2>/dev/null && dpkg -l | grep haskell-platform) || sudo aptitude install -y haskell-platform
	(aptitude show mysql-server 2>/dev/null && dpkg -l | grep mysql-server) || sudo aptitude install -y mysql-server libmysqlclient-dev

deps: install
	cabal update ; cabal install yesod-platform yesod-bin

init: deps create-db
	cabal sandbox init && cabal install --enable-tests && yesod devel

create-db:
	~/bin/db/create-mysql-db.sh YESODLAB yesodlab

create-test-db:
	~/bin/db/create-mysql-db.sh YESODLAB_test yesodlab

test:
	yesod test

dev:
	yesod devel

add-handler:
	yesod add-handler
