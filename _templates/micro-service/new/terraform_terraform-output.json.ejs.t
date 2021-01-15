---
to: terraform/terraform-output.json
---
{
  "invokeUrl": {
    "sensitive": false,
    "type": [
      "object",
      {
        "created_date": "string",
        "description": "string",
        "execution_arn": "string",
        "id": "string",
        "invoke_url": "string",
        "rest_api_id": "string",
        "stage_description": "string",
        "stage_<%= name.toLowerCase() %>": "string",
        "triggers": [
          "map",
          "string"
        ],
        "variables": [
          "map",
          "string"
        ]
      }
    ],
    "value": {
      "created_date": "2021-01-15T04:52:25Z",
      "description": "",
      "execution_arn": "arn:aws:execute-api:us-east-1:828522498790:yr5mt3m6xa/micro-service",
      "id": "8kfz21",
      "invoke_url": "https://yr5mt3m6xa.execute-api.us-east-1.amazonaws.com/micro-service",
      "rest_api_id": "yr5mt3m6xa",
      "stage_description": null,
      "stage_<%= name.toLowerCase() %>": "micro-service",
      "triggers": null,
      "variables": null
    }
  }
}
