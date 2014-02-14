install:
	dpkg -l | grep haskell-platform || sudo apt-get install -y haskell-platform
	dpkg -l | grep libmysqlclient-dev || sudo apt-get install -y libmysqlclient-dev

deps: install
	cabal update ; cabal install yesod-platform yesod-bin

init: create-db
	cabal sandbox init && cabal install --enable-tests && yesod devel

create-db:
	~/bin/db/create-mysql-db.sh YESODLAB yesodlab
