# En cas de problème à l'exécution, se référer à :
#     https://github.com/casey/just/issues/2702

metaschema schema:
    jsonschema metaschema {{ schema }}

test:
    jsonschema test test/ --extension test.json --resolve schemas/ --extension schema.json
    find validation/ -type f -name etat.json -exec jsonschema validate schemas/etat.schema.json '{}' ';'
    find validation/ -type f -name etat.json -exec jsonschema validate schemas/etat.schema.json '{}' ';'
    find validation/ -type f -name transition.json -exec jsonschema validate schemas/transitions/transition.schema.json '{}' ';'
