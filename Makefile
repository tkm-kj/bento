.PHONY: generate-stub-server run-stub-server
generate-stub-server:
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate -i /local/apidocs/openapi.yml -o /local/apidocs/ -g openapi
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate -i /local/apidocs/openapi.yml -o /local/stub_server -g ruby-sinatra
run-stub-server:
	docker-compose run -p 4567:4567 app bash -c "cd stub_server/ && rackup -p 4567 -o 0.0.0.0"
