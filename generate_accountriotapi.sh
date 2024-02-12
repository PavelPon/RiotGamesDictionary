MODULE="Modules/AccountRiotApiNetwork/Sources/AccountRiotApiNetwork"
openapi-generator generate -i "accountriotapi.yml" -g swift5 --additional-properties=responseAs=AsyncAwait -o "ddriotapi3"
rm -r $MODULE""*
cp -R "ddriotapi3/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "ddriotapi3"
