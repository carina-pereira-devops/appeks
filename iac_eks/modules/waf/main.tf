# Regra de bloqueio de IPs
resource "aws_wafv2_ip_set" "ip_blacklist" {
  name               = "ip-address"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = ["179.156.237.96/32"]
}

resource "aws_wafv2_web_acl" "blockip" {
  name        = "ip-block"
  scope       = "REGIONAL" # or "CLOUDFRONT"

  default_action {
    allow {}
  }
  rule {
    name     = "ip-address"
    priority = "1"

    action {
        block {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.ip_blacklist.arn
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "BlacklistedIP"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "Allowed"
    sampled_requests_enabled   = true
  }
}