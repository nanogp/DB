SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE datos_contratos (
  cod_empleado int(11) DEFAULT NULL,
  fecha_contrato date DEFAULT NULL,
  cuota int(11) DEFAULT NULL,
  ventas int(11) DEFAULT NULL,
  PRIMARY KEY (cod_empleado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;



CREATE TABLE documentos (
  cod_documento int(11) NOT NULL,
  descripcion varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (cod_documento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE fabricantes (
  cod_fabricante int(11) DEFAULT NULL,
  razon_social varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (cod_fabricante)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE listas (
  cod_lista int(11) DEFAULT NULL,
  descripcion varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  ganancia float DEFAULT NULL,
  PRIMARY KEY (cod_lista)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE productos (
  cod_producto int(11) DEFAULT NULL,
  descripcion varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  precio float DEFAULT NULL,
  cantidad_stock int(11) DEFAULT NULL,
  punto_reposicion int(11) DEFAULT NULL,
  cod_fabricante int(11) DEFAULT NULL,
  PRIMARY KEY (cod_producto),
  FOREIGN KEY (cod_fabricante) REFERENCES fabricantes (cod_fabricante)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


CREATE TABLE clientes (
  cod_cliente int(11) NOT NULL,
  cod_lista int(11) DEFAULT NULL,
  razon_social varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (cod_cliente),
  FOREIGN KEY (cod_lista) REFERENCES listas (cod_lista)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE oficinas (
  cod_oficina int(11) DEFAULT NULL,
  codigo_director int(11) DEFAULT NULL,
  descripcion varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (cod_oficina)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE empleados (
  cod_empleado int(11) DEFAULT NULL,
  apellido varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  nombre varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  fecha_nacimiento date DEFAULT NULL,
  num_doc int(11) DEFAULT NULL,
  cod_jefe int(11) DEFAULT NULL,
  cod_oficina int(11) DEFAULT NULL,
  cod_documento int(11) DEFAULT NULL,
  PRIMARY KEY (cod_empleado),
  FOREIGN KEY (cod_jefe) REFERENCES empleados (cod_empleado),
  FOREIGN KEY (cod_oficina) REFERENCES oficinas (cod_oficina),
  FOREIGN KEY (cod_documento) REFERENCES documentos (cod_documento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE pedidos (
  cod_pedido int(11) DEFAULT NULL,
  fecha_pedido date DEFAULT NULL,
  cod_empleado int(11) DEFAULT NULL,
  cod_cliente int(11) DEFAULT NULL,
  PRIMARY KEY (cod_pedido),
  FOREIGN KEY (cod_empleado) REFERENCES empleados (cod_empleado),
  FOREIGN KEY (cod_cliente) REFERENCES clientes (cod_cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


CREATE TABLE precios (
  cod_producto int(11) DEFAULT NULL,
  cod_lista int(11) DEFAULT NULL,
  precio float DEFAULT NULL,
  PRIMARY KEY (cod_producto, cod_lista),
  FOREIGN KEY (cod_producto) REFERENCES productos (cod_producto),
  FOREIGN KEY (cod_lista) REFERENCES listas (cod_lista)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE detalle_pedidos (
  cod_pedido int(11) DEFAULT NULL,
  numero_linea int(11) DEFAULT NULL,
  cod_producto int(11) DEFAULT NULL,
  cantidad int(11) DEFAULT NULL,
  PRIMARY KEY (cod_pedido, cod_producto),
  FOREIGN KEY (cod_pedido) REFERENCES pedidos (cod_pedido),
  FOREIGN KEY (cod_producto) REFERENCES productos (cod_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

ALTER TABLE oficinas ADD FOREIGN KEY (codigo_director) REFERENCES empleados (cod_empleado);