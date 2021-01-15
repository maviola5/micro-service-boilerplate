---
to: package.json
---
{
  "<%= name.toLowerCase() %>": "micro-service-boilerplate",
  "version": "1.0.0",
  "description": "",
  "main": "./dist/index.js",
  "scripts": {
    "test": "jest",
    "dev": "rm -r ./dist && concurrently \"tsc --w --p tsconfig.build.json\" \"nodemon --delay 1 ./dist/index.js\"",
    "build": "rm -r ./dist; tsc --p tsconfig.build.json",
    "pack": "cp ./package.json ./dist/package.json && cp ./package-lock.json ./dist/package-lock.json && pushd ./dist && npm ci --production && npm dedupe && zip -r handler.zip .",
    "tf:deploy": "pushd ./terraform && terraform init && terraform workspace select $AWS_PROFILE || terraform workspace new $AWS_PROFILE && terraform plan && terraform apply --auto-approve && terraform output --json > terraform-output.json",
    "tf:destroy": "pushd ./terraform && terraform workspace select $AWS_PROFILE || terraform workspace new $AWS_PROFILE && terraform destroy --auto-approve",
    "deploy": "npm run build && npm run pack && npm run tf:deploy"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "@types/jest": "^26.0.20",
    "@types/koa": "^2.11.6",
    "@types/koa-bodyparser": "^4.3.0",
    "@types/koa-router": "^7.4.1",
    "concurrently": "^5.3.0",
    "jest": "^26.6.3",
    "nodemon": "^2.0.7",
    "ts-jest": "^26.4.4",
    "typescript": "^4.1.3"
  },
  "dependencies": {
    "aws-sdk": "^2.826.0",
    "dotenv": "^8.2.0",
    "koa": "^2.13.1",
    "koa-bodyparser": "^4.3.0",
    "koa-router": "^10.0.0",
    "serverless-http": "^2.6.0",
    "winston": "^3.3.3"
  }
}
