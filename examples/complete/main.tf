module "aci_port_channel_member_policy" {
  source  = "netascode/port-channel-member-policy/aci"
  version = ">= 0.0.1"

  name     = "FAST"
  priority = 10
  rate     = "fast"
}
