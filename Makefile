format:
	gofmt -w -s ./...

test:
	go test -v ./...

.PHONY: format test
