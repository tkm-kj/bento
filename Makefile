.PHONY: swagger-codegen
swagger-codegen:
	swagger-codegen generate -i apidocs/*.yaml -o apidocs/ -l openapi
