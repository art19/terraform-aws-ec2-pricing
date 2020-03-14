output "cpus" {
  value       = "${data.external.selected.result["vcpu"] * 1}"
  description = "Number of CPU cores available on the instance"
}

output "memory" {
  value       = "${replace(data.external.selected.result["memory"], " GiB", "") * 1}"
  description = "Memory available on the instance, in gibibytes (GiB)"
}
