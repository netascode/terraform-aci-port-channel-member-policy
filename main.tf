resource "aci_rest" "lacpIfPol" {
  dn         = "uni/infra/lacpifp-${var.name}"
  class_name = "lacpIfPol"
  content = {
    name   = var.name
    prio   = var.priority
    txRate = var.rate
  }
}
