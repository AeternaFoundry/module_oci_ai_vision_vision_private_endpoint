resource "oci_ai_vision_vision_private_endpoint" "ai_vision_vision_private_endpoints" {
  for_each = var.ai_vision_vision_private_endpoints

  compartment_id = each.value.compartment_id
  subnet_id      = each.value.subnet_id
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

