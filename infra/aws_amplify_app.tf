resource "aws_amplify_app" "amplify_newbie" {
  name       = "amplify-newbie"
  repository = "https://github.com/yktakaha4/amplify-newbie"

  build_spec = file("${path.module}/build_spec.yml")

  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  environment_variables = {
    ENV = "prd"
  }
}
