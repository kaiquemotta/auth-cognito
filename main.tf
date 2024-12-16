resource "aws_cognito_user_pool" "user_pool" {
  name = var.user_pool_name

  schema {
    name   = "email"
    attribute_data_type = "String"
    required = true
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name                   = var.app_client_name
  user_pool_id           = aws_cognito_user_pool.user_pool.id
  generate_secret        = false # Authorization Code Grant não precisa de segredo
  allowed_oauth_flows    = ["code"] # Permitir Authorization Code Grant
  allowed_oauth_scopes   = var.oauth_scopes
  supported_identity_providers = ["COGNITO"]

  allowed_oauth_flows_user_pool_client = true

  explicit_auth_flows = [
    "ALLOW_USER_SRP_AUTH",      # Para login com senha
    "ALLOW_REFRESH_TOKEN_AUTH"  # Para refresh token
  ]

  callback_urls = var.callback_urls
  logout_urls   = var.logout_urls
}

resource "aws_cognito_user_pool_domain" "user_pool_domain" {
  domain       = var.domain_prefix
  user_pool_id = aws_cognito_user_pool.user_pool.id
}
