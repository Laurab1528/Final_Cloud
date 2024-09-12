# Proyecto de Migración a AWS

Este proyecto contiene la infraestructura como código y scripts de configuración para migrar una aplicación de tres capas (frontend, backend, base de datos) a AWS.

## Decisiones de Diseño

1. Uso de Terraform Workspaces: Implementamos workspaces para manejar los ambientes de QA y Producción, permitiendo una gestión eficiente de múltiples entornos.

2. Almacenamiento remoto del estado: Utilizamos S3 para almacenar el estado de Terraform, facilitando el trabajo colaborativo y remoto del equipo.

3. Modularización: Creamos módulos para networking, compute, database y load balancer, permitiendo la reutilización del código en otras áreas de la empresa.

4. Seguridad: Implementamos un bastion host, subnets públicas y privadas, y grupos de seguridad restrictivos para mejorar la postura de seguridad.

5. Optimización de costos: Utilizamos instancias y servicios del free tier de AWS para reducir costos.

6. Ansible: Usamos Ansible para la configuración de instancias, permitiendo una gestión de configuración consistente y automatizada.

7. Monitoreo: Implementamos CloudWatch para monitorear los recursos y el rendimiento de la aplicación.

## Arquitectura

[Insertar diagrama de arquitectura aquí]

## Instrucciones de Despliegue

[Instrucciones detalladas de despliegue]

## Cumplimiento de Requisitos del Cliente

