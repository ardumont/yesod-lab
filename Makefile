install:
	dpkg -l | grep haskell-platform || sudo apt-get install -y haskell-platform

deps: install
	cabal update ; cabal install yesod-platform yesod-bin

init:
	cabal sandbox init && cabal install --enable-tests . yesod-platform yesod-bin --max-backjumps=-1 --reorder-goals && yesod devel
