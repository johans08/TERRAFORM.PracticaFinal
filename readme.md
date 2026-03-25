# 🚀 Terraform Practica Final - Infraestructura AWS

## 📌 Descripción

Este proyecto implementa una infraestructura en AWS utilizando **Terraform**, siguiendo buenas prácticas de modularización y separación de entornos mediante **workspaces (`dev` y `prod`)**.

El objetivo es simular un entorno real de trabajo donde se gestionan recursos de infraestructura como código (IaC), permitiendo escalabilidad, reutilización y consistencia entre ambientes.

---

## 🧱 Arquitectura

La infraestructura desplegada incluye:

* VPC
* Subnet pública
* Internet Gateway
* Route Table
* EC2 Instance (máquina virtual)
* (Opcional) Security Group

---

## 📊 Diagrama de arquitectura

> Generado con Terraform + Graphviz

```bash
terraform graph | dot -Tpng > diagrama.png
```

---

## 📁 Estructura del proyecto

```bash
PracticaFinal/
├── terraform.tf
├── provider.tf
├── variables.tf
├── main.tf
├── output.tf
├── network/
│   ├── variables.tf
│   ├── vpc.tf
│   └── output.tf
├── infra/
│   ├── variables.tf
│   ├── vm.tf
│   └── outputs.tf
├── security/ (opcional)
└── .gitignore
```

---

## ⚙️ Tecnologías utilizadas

* Terraform (~> 4.0)
* AWS (EC2, VPC, Networking)
* Graphviz (para diagramas)
* Git / GitHub

---

## 🧩 Diseño de la solución

### 🔹 Uso de módulos

Se implementaron módulos independientes para separar responsabilidades:

* **network** → gestión de red (VPC, subnet, routing)
* **infra** → creación de instancias EC2
* **security (opcional)** → control de acceso mediante Security Groups

---

### 🔹 Uso de workspaces

Se utilizan workspaces de Terraform para manejar múltiples entornos:

* `dev`
* `prod`

Esto permite reutilizar el mismo código con configuraciones diferentes.

---

### 🔹 Variables por entorno

Se utilizan mapas (`map`) junto con `terraform.workspace`:

```hcl
lookup(var.region, terraform.workspace)
```

Esto permite definir configuraciones específicas por entorno:

| Variable  | dev        | prod       |
| --------- | ---------- | ---------- |
| Región    | us-east-1  | us-east-2  |
| AMI       | ami-033... | ami-0b6... |
| Instancia | t3a.nano   | t3a.micro  |

---

## 🚀 Despliegue

### 1. Inicializar Terraform

```bash
terraform init
```

---

### 2. Crear workspaces

```bash
terraform workspace new dev
terraform workspace new prod
```

---

### 3. Desplegar en entorno DEV

```bash
terraform workspace select dev
terraform plan
terraform apply
```

---

### 4. Desplegar en entorno PROD

```bash
terraform workspace select prod
terraform plan
terraform apply
```

---

## 📤 Outputs generados

El sistema retorna información clave:

* IP pública de la instancia
* ID de la instancia
* Nombre (tag)
* Availability Zone
* ID de la VPC
* ID de la Subnet
* Owner

---

## 🧹 Destrucción de recursos

Para evitar costos en AWS:

```bash
terraform workspace select dev
terraform destroy
```

```bash
terraform workspace select prod
terraform destroy
```

---

## 🔐 Seguridad (opcional)

Se puede agregar un módulo de Security Group que permita:

* SSH (22)
* HTTP (80)

Esto simula una configuración básica de acceso en entornos reales.

---

## 🧠 Buenas prácticas aplicadas

* Infraestructura como código (IaC)
* Separación por entornos (dev / prod)
* Modularización
* Uso de variables tipadas
* Uso de tags para gobernanza
* Código reutilizable y escalable

---

## 📌 Posibles mejoras

* Uso de backend remoto (S3 + DynamoDB)
* Integración con CI/CD (GitHub Actions)
* Uso de Terraform Cloud
* Implementación en múltiples regiones
* Seguridad avanzada (NACLs, IAM roles)

---

## 👨‍💻 Autor

**Ing. Johans Valverde Diaz**

* Ingeniero en Sistemas
* Especialización en Cloud & DevOps

---

## ⭐ Nota

Este proyecto fue desarrollado como práctica final, siguiendo estándares similares a los utilizados en entornos profesionales de infraestructura cloud.
