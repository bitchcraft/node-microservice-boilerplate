COMMIT_HASH = $(shell git rev-parse HEAD)
DIRNAME = $(shell basename `git rev-parse --show-toplevel`)

build:
				yarn build

clean:
				rm -rf build

docker:
				docker build --no-cache -t ${DIRNAME}:${COMMIT_HASH} .

install:
				yarn install

lint:
				yarn lint

test: lint
				yarn test

run:
				node index.js
