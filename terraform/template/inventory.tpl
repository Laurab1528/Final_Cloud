all:
  children:
    bastion:
      hosts:
        bastion_host:
          ansible_host: ${bastion_ip}
    frontend:
      hosts:
        frontend_server:
          ansible_host: ${frontend_ip}
    backend:
      hosts:
        backend_server:
          ansible_host: ${backend_ip}