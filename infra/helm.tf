data "template_file" "timezoneapp_values" {
  template = file("${path.module}/templates/helm_values.yaml")
  vars = {
    repo_name = aws_ecr_repository.timezoneapp.repository_url
  }
}

resource "kubernetes_namespace" "timezone" {
  metadata {
    name = var.timezone_app_name
  }
}

 resource "helm_release" "timezone" {
  repository = "${path.module}/../helm/"
  name       = var.chart_name
  chart      = var.chart_name
  namespace  = kubernetes_namespace.timezone.id

  values = [
    data.template_file.timezoneapp_values.rendered,
  ]
}