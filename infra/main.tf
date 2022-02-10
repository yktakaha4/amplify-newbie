resource "aws_amplify_app" "amplify_newbie" {
  name       = "amplify-newbie"
  repository = "https://github.com/yktakaha4/amplify-newbie"

  access_token = var.github_personal_access_token

  build_spec = file("${path.module}/build_spec.yml")

  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.amplify_newbie.id
  branch_name = "main"

  framework = "React"
  stage     = "PRODUCTION"

  environment_variables = {
    ENV = "production"
  }
}
