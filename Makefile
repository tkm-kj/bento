.PHONY: generate-stub-server run-stub-server
generate-stub-server:
	docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli-v3:3.0.11 generate -i /local/apidocs/openapi.yml -o /local/apidocs -l openapi
	docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli-v3:3.0.11 generate -i /local/apidocs/openapi.yml -o /local/stub_server -l nodejs-server
run-stub-server:
	docker-compose run -p 8080:8080 app bash -c "cd stub_server/ && npm start"
