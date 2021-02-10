
run:
	docker-compose -p at-template down && docker-compose pull && docker-compose -p at-template up --remove-orphans

clear-db:
	docker-compose -p at-template down && docker volume rm at-template_datomic

export-document-plans:
	@curl -s -X POST http://localhost:3001/_graphql \
         -H "Content-Type: application/json" \
         -d "{\"query\": \"{documentPlans{items{id uid name kind blocklyXml documentPlan}}}\"}" | \
    jq -r '.data.documentPlans.items[] | @base64 ' | \
    while read -r item; \
    	do echo $${item} | \
    	   base64 --decode | \
    	   jq -r $${1} '.' | \
    	   jq '.documentPlan = (.documentPlan | fromjson)' | \
    	   cat > item.json.tmp && \
    	   mv item.json.tmp $${dir:=resources/document-plans}/$$(cat item.json.tmp | jq -r '.id').json  ; \
    done
