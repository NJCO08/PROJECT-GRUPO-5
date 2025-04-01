CREATE TABLE Tarifas (
    id_tarifa INT PRIMARY KEY IDENTITY(1,1),
    valor_hora DECIMAL(10,2) NOT NULL,
    fecha_implementacion DATETIME DEFAULT GETDATE()
);

CREATE TABLE Carros (
    placa VARCHAR(10) PRIMARY KEY,
    hora_entrada TIME NOT NULL,
    CHECK (hora_entrada BETWEEN '06:00' AND '21:00')
);

CREATE TABLE Puestos (
    numero_puesto INT PRIMARY KEY,
    placa_carro VARCHAR(10) NULL,
    FOREIGN KEY (placa_carro) REFERENCES Carros(placa)
);

CREATE TABLE Movimientos (
    id_movimiento INT PRIMARY KEY IDENTITY(1,1),
    placa_carro VARCHAR(10) NOT NULL,
    numero_puesto INT NOT NULL,
    hora_entrada DATETIME NOT NULL,
    hora_salida DATETIME NULL,
    valor_pagado DECIMAL(10,2) NULL,
    FOREIGN KEY (placa_carro) REFERENCES Carros(placa),
    FOREIGN KEY (numero_puesto) REFERENCES Puestos(numero_puesto)
);

CREATE TABLE Configuracion (
    id_config INT PRIMARY KEY DEFAULT 1,
    hora_actual DATETIME NOT NULL DEFAULT GETDATE(),
    CHECK (id_config = 1)
);