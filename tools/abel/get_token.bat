@echo off

FOR /F "delims=" %%i IN ('gcloud auth application-default print-access-token') DO set token=%%i
SET header=Authorization: Bearer 
SET auth_token="%header%%token%"

curl -X POST -H %auth_token% -H "Content-Type: application/json; charset=utf-8" -d @token_request.json "https://iamcredentials.googleapis.com/v1/projects/-/serviceAccounts/demo-830@modular-ground-327709.iam.gserviceaccount.com:generateAccessToken" > spreadsheet_token.json

more spreadsheet_token.json
