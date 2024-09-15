# from Keycloak's cabral-idp config

export IDP_DISCOVERY_DOCUMENT=https://keycloak.35.190.9.46.nip.io/realms/cabral-idp/.well-known/openid-configuration
export TEST_IDP_APIGEE_CLIENT_ID=apigee-keycloak
export TEST_IDP_APIGEE_CLIENT_SECRET=aop5qL0sgkMxpu2UIAc7JuojcZPCItet # got from Keycloak

# Apigee callback, to be configured in KeyCloak https://dev.35.227.240.213.nip.io/v1/oauth20/callback

export IS_PKCE_ENABLED=true

export APIGEE_X_ORG=cabral-apigee
export APIGEE_X_ENV=dev
export APIGEE_X_HOSTNAME=dev.35.227.240.213.nip.io

cd ./devrel/references/identity-facade/
./pipeline.sh --googleapi

#### Export locally the KVM config
#  apigeecli kvms entries export -e dev -m idpConfigIdentityProxy -o cabral-apigee -t $(gcloud auth print-access-token) 

# Sample output: 

# {
#   "keyValueEntries": [
#     {
#       "name": "idp.token.hostname",
#       "value": "keycloak.35.190.9.46.nip.io"
#     },
#     {
#       "name": "idp.token.uri",
#       "value": "realms/cabral-idp/protocol/openid-connect/token"
#     },
#     {
#       "name": "idp.apigee.client_id",
#       "value": "apigee-keycloak"
#     },
#     {
#       "name": "idp.jwks.uri",
#       "value": "realms/cabral-idp/protocol/openid-connect/certs"
#     },
#     {
#       "name": "idp.jwks.hostname",
#       "value": "keycloak.35.190.9.46.nip.io"
#     },
# ...

# We can simply change the file and import it back!
# apigeecli kvms entries import -e dev -m idpConfigIdentityProxy -o cabral-apigee -t $(gcloud auth print-access-token) -f ./env__dev__idpConfigIdentityProxy__kvmfile__0.json