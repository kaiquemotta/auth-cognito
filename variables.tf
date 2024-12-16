variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "user_pool_name" {
  description = "Nome do Cognito User Pool"
  type        = string
  default     = "authcode-user-pool"
}

variable "app_client_name" {
  description = "Nome do Cognito App Client"
  type        = string
  default     = "authcode-app-client"
}

variable "domain_prefix" {
  description = "Prefixo do domínio Cognito para autenticação"
  type        = string
  default     = "authcode-auth-domain"
}

variable "oauth_scopes" {
  description = "Escopos permitidos para OAuth"
  type        = list(string)
  default     = ["openid", "profile", "email"] # Escopos padrão
}

variable "callback_urls" {
  description = "URLs de retorno de chamada para o Authorization Code Grant"
  type        = list(string)
  default     = ["https://example.com/callback"] # Substitua pelo seu domínio
}

variable "logout_urls" {
  description = "URLs de redirecionamento após logout"
  type        = list(string)
  default     = ["https://example.com/logout"] # Substitua pelo seu domínio
}
