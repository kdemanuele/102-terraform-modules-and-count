resource "azurerm_logic_app_workflow" "logic-app-workflow" {
  name                = "logic-echo-dev-001"
  location            = var.environment.location
  resource_group_name = var.environment.resource_group_name
}

resource "azurerm_logic_app_trigger_http_request" "logic-app-trigger" {
  name         = "HTTP_Request"
  logic_app_id = azurerm_logic_app_workflow.logic-app-workflow.id
  schema       = <<SCHEMA
{
    "type": "object",
    "properties": {
        "hello": {
            "type": "string"
        }
    }
}
SCHEMA
}

resource "azurerm_logic_app_action_custom" "logic-app-response" {
  name         = "HTTP_Response"
  logic_app_id = azurerm_logic_app_workflow.logic-app-workflow.id
  body         = <<BODY
{
    "inputs": {
        "body": "Hello @{triggerBody()?['hello']}",
        "headers": {
            "Content-Type": "text/plain"
        },
        "statusCode": 200
    },
    "kind": "http",
    "runAfter": {},
    "type": "Response"
}
BODY
}
