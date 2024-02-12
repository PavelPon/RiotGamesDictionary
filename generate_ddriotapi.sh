MODULE="Modules/LoLDictionaryNetwork/Sources/LoLDictionaryNetwork"
openapi-generator generate -i "ddriotapi.yml" -g swift5 --additional-properties=responseAs=AsyncAwait -o "ddriotapi2"
rm -r $MODULE""*
cp -R "ddriotapi2/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "ddriotapi2"
