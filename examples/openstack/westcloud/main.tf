module "openstack" {
  source = "git::ssh://gitlab@git.computecanada.ca/fafor10/slurm_cloud.git//openstack"

  # JupyterHub + Slurm definition
  cluster_name        = "phoenix"
  nb_nodes            = 5
  nb_users            = 10
  shared_storage_size = 100
  domain_name         = "jupyter2.calculquebec.cloud"
  public_key_path     = "./pub.key"

  # OpenStack specifics
  os_external_network = "VLAN3337"
  os_image_name       = "CentOS-7-x86_64-GenericCloud-1809"
  os_flavor_node      = "p2-3gb"
  os_flavor_login     = "p2-3gb"
  os_flavor_mgmt      = "p2-3gb"
  os_floating_ip      = ""
}

output "public_ip" {
	value = "${module.openstack.ip}"
}

output "domain_name" {
	value = "${module.openstack.domain_name}"
}

output "admin_passwd" {
	value = "${module.openstack.admin_passwd}"
}

output "guest_passwd" {
	value = "${module.openstack.guest_passwd}"
}
