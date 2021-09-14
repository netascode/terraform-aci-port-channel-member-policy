terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name     = "FAST"
  priority = 10
  rate     = "fast"
}

data "aci_rest" "lacpIfPol" {
  dn = "uni/infra/lacpifp-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "lacpIfPol" {
  component = "lacpIfPol"

  equal "name" {
    description = "name"
    got         = data.aci_rest.lacpIfPol.content.name
    want        = module.main.name
  }

  equal "prio" {
    description = "prio"
    got         = data.aci_rest.lacpIfPol.content.prio
    want        = "10"
  }

  equal "txRate" {
    description = "txRate"
    got         = data.aci_rest.lacpIfPol.content.txRate
    want        = "fast"
  }
}
