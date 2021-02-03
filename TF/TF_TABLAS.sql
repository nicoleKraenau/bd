-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-11-26 19:03:26.763

-- tables
-- Table: Area_Trabajador
CREATE TABLE Area_Trabajador (
    CAreadeTrabajador char(5)  NOT NULL,
    NAreadeTrabajador nvarchar(30)  NOT NULL,
    CONSTRAINT Area_Trabajador_pk PRIMARY KEY  (CAreadeTrabajador)
);

-- Table: Cantidad
CREATE TABLE Cantidad (
    CCantidad char(5)  NOT NULL,
    NCantidad nvarchar(30)  NOT NULL,
    CONSTRAINT Cantidad_pk PRIMARY KEY  (CCantidad)
);

-- Table: Caracteristica
CREATE TABLE Caracteristica (
    CCaracteristica char(5)  NOT NULL,
    NCaracteristica nvarchar(30)  NOT NULL,
    CONSTRAINT Caracteristica_pk PRIMARY KEY  (CCaracteristica)
);

-- Table: Categoria
CREATE TABLE Categoria (
    CCategoria char(5)  NOT NULL,
    NCategoria nvarchar(30)  NOT NULL,
    CONSTRAINT Categoria_pk PRIMARY KEY  (CCategoria)
);

-- Table: Cliente
CREATE TABLE Cliente (
    CCliente char(5)  NOT NULL,
    NNombrescompletos nvarchar(30)  NOT NULL,
    NApellidosCompletos nvarchar(50)  NOT NULL,
    DFnacimiento datetime  NOT NULL,
    CDni char(8)  NOT NULL,
    NTelefono nvarchar(9)  NOT NULL,
    Temail nvarchar(50)  NOT NULL,
    CGenero char(5)  NOT NULL,
    CONSTRAINT Cliente_pk PRIMARY KEY  (CCliente)
);

-- Table: Compania
CREATE TABLE Compania (
    CCompania char(5)  NOT NULL,
    NCompania nvarchar(30)  NOT NULL,
    TDireccionWeb ntext  NOT NULL,
    CDistrito char(5)  NOT NULL,
    CONSTRAINT Compania_pk PRIMARY KEY  (CCompania)
);

-- Table: Contacto_Compania
CREATE TABLE Contacto_Compania (
    CContacto_Compania char(5)  NOT NULL,
    NContacto nvarchar(30)  NOT NULL,
    NApellido nvarchar(50)  NOT NULL,
    TCorreo_Contacto nvarchar(50)  NOT NULL,
    NumTelefono_Contacto nvarchar(9)  NOT NULL,
    CCompania char(5)  NOT NULL,
    CGenero char(5)  NOT NULL,
    CONSTRAINT Contacto_Compania_pk PRIMARY KEY  (CContacto_Compania)
);

-- Table: Delivery
CREATE TABLE Delivery (
    CDelivery char(5)  NOT NULL,
    CVenta char(5)  NOT NULL,
    CEmpresa_Delivery char(5)  NOT NULL,
    CDireccion char(5)  NOT NULL,
    MDelivery money  NOT NULL,
    DLlegada date  NOT NULL,
    CONSTRAINT Delivery_pk PRIMARY KEY  (CDelivery)
);

-- Table: DeliveryxEstado
CREATE TABLE DeliveryxEstado (
    CDelivery char(5)  NOT NULL,
    CEstado_Delivery char(5)  NOT NULL,
    Dfechamodificacion datetime  NOT NULL,
    TObservacion nvarchar(60)  NOT NULL,
    CONSTRAINT DeliveryxEstado_pk PRIMARY KEY  (CDelivery,CEstado_Delivery)
);

-- Table: Departamento
CREATE TABLE Departamento (
    CDepartamento char(5)  NOT NULL,
    NDepartamento nvarchar(30)  NOT NULL,
    CPais char(5)  NOT NULL,
    CONSTRAINT Departamento_pk PRIMARY KEY  (CDepartamento)
);

-- Table: Descuento
CREATE TABLE Descuento (
    CDescuento char(5)  NOT NULL,
    DInicio datetime  NOT NULL,
    Dfinal datetime  NOT NULL,
    CONSTRAINT Descuento_pk PRIMARY KEY  (CDescuento)
);

-- Table: DescuestoxProducto
CREATE TABLE DescuestoxProducto (
    CDescuento char(5)  NOT NULL,
    CProducto char(5)  NOT NULL,
    PercentDescuento float(5)  NOT NULL,
    CONSTRAINT DescuestoxProducto_pk PRIMARY KEY  (CDescuento,CProducto)
);

-- Table: Detalle_Orden_Compra
CREATE TABLE Detalle_Orden_Compra (
    COrden_Compra char(5)  NOT NULL,
    CProducto char(5)  NOT NULL,
    Qproductos smallint  NOT NULL,
    Mparcial money  NOT NULL,
    CONSTRAINT Detalle_Orden_Compra_pk PRIMARY KEY  (COrden_Compra,CProducto)
);

-- Table: Detalle_Producto
CREATE TABLE Detalle_Producto (
    CProducto char(5)  NOT NULL,
    CUnidad char(5)  NULL,
    CCaracteristica char(5)  NOT NULL,
    CCantidad char(5)  NULL,
    CONSTRAINT Detalle_Producto_pk PRIMARY KEY  (CProducto,CCaracteristica)
);

-- Table: Detalle_Venta
CREATE TABLE Detalle_Venta (
    CVenta char(5)  NOT NULL,
    CProducto char(5)  NOT NULL,
    QProductos int  NOT NULL,
    MParcialVenta money  NOT NULL,
    MPesoParcial float(5)  NOT NULL,
    CONSTRAINT Detalle_Venta_pk PRIMARY KEY  (CVenta,CProducto)
);

-- Table: Direccion
CREATE TABLE Direccion (
    CDireccion char(5)  NOT NULL,
    TCalle nvarchar(30)  NULL,
    TManzana nvarchar(30)  NULL,
    TLote nvarchar(30)  NULL,
    CDistrito char(5)  NOT NULL,
    CONSTRAINT Direccion_pk PRIMARY KEY  (CDireccion)
);

-- Table: Distrito
CREATE TABLE Distrito (
    CDistrito char(5)  NOT NULL,
    NDistrito nvarchar(30)  NOT NULL,
    CDepartamento char(5)  NOT NULL,
    CONSTRAINT Distrito_pk PRIMARY KEY  (CDistrito)
);

-- Table: Empresa_Delivery
CREATE TABLE Empresa_Delivery (
    CEmpresa_Delivery char(5)  NOT NULL,
    NEmpresa_Delivery nvarchar(30)  NOT NULL,
    CTipoEnvio char(5)  NOT NULL,
    CONSTRAINT Empresa_Delivery_pk PRIMARY KEY  (CEmpresa_Delivery)
);

-- Table: Estado
CREATE TABLE Estado (
    CEstado char(5)  NOT NULL,
    NEstado nvarchar(30)  NOT NULL,
    CONSTRAINT Estado_pk PRIMARY KEY  (CEstado)
);

-- Table: Estado_Contacto
CREATE TABLE Estado_Contacto (
    CEstado char(5)  NOT NULL,
    CContacto_Compania char(5)  NOT NULL,
    DCambioEstadoContacto date  NOT NULL,
    TObervacionContactoEmpresa nvarchar(80)  NOT NULL,
    CONSTRAINT Estado_Contacto_pk PRIMARY KEY  (CEstado,CContacto_Compania,DCambioEstadoContacto)
);

-- Table: Estado_Delivery
CREATE TABLE Estado_Delivery (
    CEstado_Delivery char(5)  NOT NULL,
    NTipoEstado nvarchar(30)  NOT NULL,
    CONSTRAINT Estado_Delivery_pk PRIMARY KEY  (CEstado_Delivery)
);

-- Table: Estado_Trabajador
CREATE TABLE Estado_Trabajador (
    CEstado char(5)  NOT NULL,
    Empleado_CEmpleado char(5)  NOT NULL,
    DCambioEstadoTrabajador date  NOT NULL,
    TObservacionTrabajador nvarchar(80)  NOT NULL,
    CONSTRAINT Estado_Trabajador_pk PRIMARY KEY  (CEstado,Empleado_CEmpleado,DCambioEstadoTrabajador)
);

-- Table: Genero
CREATE TABLE Genero (
    CGenero char(5)  NOT NULL,
    NTipo char(12)  NOT NULL,
    CONSTRAINT Genero_pk PRIMARY KEY  (CGenero)
);

-- Table: HorarioLaboral
CREATE TABLE HorarioLaboral (
    CHorario char(5)  NOT NULL,
    NHorario nvarchar(30)  NOT NULL,
    NumHoras smallint  NOT NULL,
    CONSTRAINT HorarioLaboral_pk PRIMARY KEY  (CHorario)
);

-- Table: Local
CREATE TABLE Local (
    CLocal char(5)  NOT NULL,
    NLocal nvarchar(30)  NOT NULL,
    QDimensionLargo float(5)  NOT NULL,
    QDimensionAncho float(5)  NOT NULL,
    NumAforo int  NOT NULL,
    CTipoLocal char(5)  NOT NULL,
    CDistrito char(5)  NOT NULL,
    CONSTRAINT Local_pk PRIMARY KEY  (CLocal)
);

-- Table: Local_Producto
CREATE TABLE Local_Producto (
    CLocal char(5)  NOT NULL,
    CProducto char(5)  NOT NULL,
    DStock datetime  NOT NULL,
    QStock int  NOT NULL,
    TObservacionStock nvarchar(60)  NOT NULL,
    CONSTRAINT Local_Producto_pk PRIMARY KEY  (CLocal,CProducto,DStock)
);

-- Table: Marca
CREATE TABLE Marca (
    CMarca char(5)  NOT NULL,
    NMarca nvarchar(30)  NOT NULL,
    CCategoria char(5)  NOT NULL,
    CONSTRAINT Marca_pk PRIMARY KEY  (CMarca)
);

-- Table: Modelo
CREATE TABLE Modelo (
    CModelo char(5)  NOT NULL,
    NModelo nvarchar(30)  NOT NULL,
    CMarca char(5)  NOT NULL,
    CONSTRAINT Modelo_pk PRIMARY KEY  (CModelo)
);

-- Table: Orden_Compra
CREATE TABLE Orden_Compra (
    COrden_Compra char(5)  NOT NULL,
    CContacto_Compania char(5)  NOT NULL,
    CTrabajador char(5)  NOT NULL,
    DOrdenCompra datetime  NOT NULL,
    MTotal money  NOT NULL,
    CONSTRAINT Orden_Compra_pk PRIMARY KEY  (COrden_Compra)
);

-- Table: Pais
CREATE TABLE Pais (
    CPais char(5)  NOT NULL,
    NPais nvarchar(30)  NOT NULL,
    CONSTRAINT Pais_pk PRIMARY KEY  (CPais)
);

-- Table: Producto
CREATE TABLE Producto (
    CProducto char(5)  NOT NULL,
    NProducto nvarchar(30)  NOT NULL,
    MPrecio_Producto money  NOT NULL,
    QPesoProducto float(5)  NOT NULL,
    CModelo char(5)  NOT NULL,
    CONSTRAINT Producto_pk PRIMARY KEY  (CProducto)
);

-- Table: TipoLocal
CREATE TABLE TipoLocal (
    CTipoLocal char(5)  NOT NULL,
    NTipoLocal nvarchar(45)  NOT NULL,
    CONSTRAINT TipoLocal_pk PRIMARY KEY  (CTipoLocal)
);

-- Table: Tipo_Envio
CREATE TABLE Tipo_Envio (
    CTipoEnvio char(5)  NOT NULL,
    NTipoEnvio nvarchar(30)  NOT NULL,
    CONSTRAINT Tipo_Envio_pk PRIMARY KEY  (CTipoEnvio)
);

-- Table: Tipo_Pago
CREATE TABLE Tipo_Pago (
    CTipo_Pago char(5)  NOT NULL,
    NTipo_Pago nvarchar(30)  NOT NULL,
    CONSTRAINT Tipo_Pago_pk PRIMARY KEY  (CTipo_Pago)
);

-- Table: Trabajador
CREATE TABLE Trabajador (
    CTrabajador char(5)  NOT NULL,
    NTrabajador nvarchar(30)  NOT NULL,
    NApellido nvarchar(30)  NOT NULL,
    DNacimiento datetime  NOT NULL,
    CDni char(8)  NOT NULL,
    NumTelefono nvarchar(9)  NOT NULL,
    MSueldoFinal money  NOT NULL,
    CJefe char(5)  NULL,
    CAreadeTrabajador char(5)  NOT NULL,
    CLocal char(5)  NOT NULL,
    CHorario char(5)  NOT NULL,
    CGenero char(5)  NOT NULL,
    CDistrito char(5)  NOT NULL,
    CONSTRAINT Trabajador_pk PRIMARY KEY  (CTrabajador)
);

-- Table: Unidad
CREATE TABLE Unidad (
    CUnidad char(5)  NOT NULL,
    NUnidad nvarchar(30)  NOT NULL,
    CONSTRAINT Unidad_pk PRIMARY KEY  (CUnidad)
);

-- Table: Venta
CREATE TABLE Venta (
    CVenta char(5)  NOT NULL,
    CCliente char(5)  NOT NULL,
    CTipo_Pago char(5)  NOT NULL,
    CTrabajador char(5)  NOT NULL,
    DVenta datetime  NOT NULL,
    MTotalVenta money  NOT NULL,
    CONSTRAINT Venta_pk PRIMARY KEY  (CVenta)
);

-- foreign keys
-- Reference: Cliente_Genero (table: Cliente)
ALTER TABLE Cliente ADD CONSTRAINT Cliente_Genero
    FOREIGN KEY (CGenero)
    REFERENCES Genero (CGenero);

-- Reference: Compania_Distrito (table: Compania)
ALTER TABLE Compania ADD CONSTRAINT Compania_Distrito
    FOREIGN KEY (CDistrito)
    REFERENCES Distrito (CDistrito);

-- Reference: Contacto_Compania_Compania (table: Contacto_Compania)
ALTER TABLE Contacto_Compania ADD CONSTRAINT Contacto_Compania_Compania
    FOREIGN KEY (CCompania)
    REFERENCES Compania (CCompania);

-- Reference: Contacto_Compania_Genero (table: Contacto_Compania)
ALTER TABLE Contacto_Compania ADD CONSTRAINT Contacto_Compania_Genero
    FOREIGN KEY (CGenero)
    REFERENCES Genero (CGenero);

-- Reference: Delivery_Direccion (table: Delivery)
ALTER TABLE Delivery ADD CONSTRAINT Delivery_Direccion
    FOREIGN KEY (CDireccion)
    REFERENCES Direccion (CDireccion);

-- Reference: Delivery_Empresa_Delivery (table: Delivery)
ALTER TABLE Delivery ADD CONSTRAINT Delivery_Empresa_Delivery
    FOREIGN KEY (CEmpresa_Delivery)
    REFERENCES Empresa_Delivery (CEmpresa_Delivery);

-- Reference: Delivery_Venta (table: Delivery)
ALTER TABLE Delivery ADD CONSTRAINT Delivery_Venta
    FOREIGN KEY (CVenta)
    REFERENCES Venta (CVenta);

-- Reference: DeliveryxEstado_Delivery (table: DeliveryxEstado)
ALTER TABLE DeliveryxEstado ADD CONSTRAINT DeliveryxEstado_Delivery
    FOREIGN KEY (CDelivery)
    REFERENCES Delivery (CDelivery);

-- Reference: DeliveryxEstado_Estado_Delivery (table: DeliveryxEstado)
ALTER TABLE DeliveryxEstado ADD CONSTRAINT DeliveryxEstado_Estado_Delivery
    FOREIGN KEY (CEstado_Delivery)
    REFERENCES Estado_Delivery (CEstado_Delivery);

-- Reference: Departamento_Pais (table: Departamento)
ALTER TABLE Departamento ADD CONSTRAINT Departamento_Pais
    FOREIGN KEY (CPais)
    REFERENCES Pais (CPais);

-- Reference: DescuestoxProducto_Descuento (table: DescuestoxProducto)
ALTER TABLE DescuestoxProducto ADD CONSTRAINT DescuestoxProducto_Descuento
    FOREIGN KEY (CDescuento)
    REFERENCES Descuento (CDescuento);

-- Reference: DescuestoxProducto_Producto (table: DescuestoxProducto)
ALTER TABLE DescuestoxProducto ADD CONSTRAINT DescuestoxProducto_Producto
    FOREIGN KEY (CProducto)
    REFERENCES Producto (CProducto);

-- Reference: Detalle_Orden_Compra_Orden_Compra (table: Detalle_Orden_Compra)
ALTER TABLE Detalle_Orden_Compra ADD CONSTRAINT Detalle_Orden_Compra_Orden_Compra
    FOREIGN KEY (COrden_Compra)
    REFERENCES Orden_Compra (COrden_Compra);

-- Reference: Detalle_Orden_Compra_Producto (table: Detalle_Orden_Compra)
ALTER TABLE Detalle_Orden_Compra ADD CONSTRAINT Detalle_Orden_Compra_Producto
    FOREIGN KEY (CProducto)
    REFERENCES Producto (CProducto);

-- Reference: Detalle_Producto_Cantidad (table: Detalle_Producto)
ALTER TABLE Detalle_Producto ADD CONSTRAINT Detalle_Producto_Cantidad
    FOREIGN KEY (CCantidad)
    REFERENCES Cantidad (CCantidad);

-- Reference: Detalle_Producto_Caracteristica (table: Detalle_Producto)
ALTER TABLE Detalle_Producto ADD CONSTRAINT Detalle_Producto_Caracteristica
    FOREIGN KEY (CCaracteristica)
    REFERENCES Caracteristica (CCaracteristica);

-- Reference: Detalle_Producto_Producto (table: Detalle_Producto)
ALTER TABLE Detalle_Producto ADD CONSTRAINT Detalle_Producto_Producto
    FOREIGN KEY (CProducto)
    REFERENCES Producto (CProducto);

-- Reference: Detalle_Producto_Unidad (table: Detalle_Producto)
ALTER TABLE Detalle_Producto ADD CONSTRAINT Detalle_Producto_Unidad
    FOREIGN KEY (CUnidad)
    REFERENCES Unidad (CUnidad);

-- Reference: Detalle_Venta_Producto (table: Detalle_Venta)
ALTER TABLE Detalle_Venta ADD CONSTRAINT Detalle_Venta_Producto
    FOREIGN KEY (CProducto)
    REFERENCES Producto (CProducto);

-- Reference: Detalle_Venta_Venta (table: Detalle_Venta)
ALTER TABLE Detalle_Venta ADD CONSTRAINT Detalle_Venta_Venta
    FOREIGN KEY (CVenta)
    REFERENCES Venta (CVenta);

-- Reference: Direccion_Distrito (table: Direccion)
ALTER TABLE Direccion ADD CONSTRAINT Direccion_Distrito
    FOREIGN KEY (CDistrito)
    REFERENCES Distrito (CDistrito);

-- Reference: Distrito_Departamento (table: Distrito)
ALTER TABLE Distrito ADD CONSTRAINT Distrito_Departamento
    FOREIGN KEY (CDepartamento)
    REFERENCES Departamento (CDepartamento);

-- Reference: Empleado_Area_Trabajador (table: Trabajador)
ALTER TABLE Trabajador ADD CONSTRAINT Empleado_Area_Trabajador
    FOREIGN KEY (CAreadeTrabajador)
    REFERENCES Area_Trabajador (CAreadeTrabajador);

-- Reference: Empleado_Distrito (table: Trabajador)
ALTER TABLE Trabajador ADD CONSTRAINT Empleado_Distrito
    FOREIGN KEY (CDistrito)
    REFERENCES Distrito (CDistrito);

-- Reference: Empleado_Empleado (table: Trabajador)
ALTER TABLE Trabajador ADD CONSTRAINT Empleado_Empleado
    FOREIGN KEY (CJefe)
    REFERENCES Trabajador (CTrabajador);

-- Reference: Empleado_Genero (table: Trabajador)
ALTER TABLE Trabajador ADD CONSTRAINT Empleado_Genero
    FOREIGN KEY (CGenero)
    REFERENCES Genero (CGenero);

-- Reference: Empleado_HorarioLaboral (table: Trabajador)
ALTER TABLE Trabajador ADD CONSTRAINT Empleado_HorarioLaboral
    FOREIGN KEY (CHorario)
    REFERENCES HorarioLaboral (CHorario);

-- Reference: Empleado_Local (table: Trabajador)
ALTER TABLE Trabajador ADD CONSTRAINT Empleado_Local
    FOREIGN KEY (CLocal)
    REFERENCES Local (CLocal);

-- Reference: Empresa_Delivery_Tipo_Envio (table: Empresa_Delivery)
ALTER TABLE Empresa_Delivery ADD CONSTRAINT Empresa_Delivery_Tipo_Envio
    FOREIGN KEY (CTipoEnvio)
    REFERENCES Tipo_Envio (CTipoEnvio);

-- Reference: Estado_Contacto_Contacto_Compania (table: Estado_Contacto)
ALTER TABLE Estado_Contacto ADD CONSTRAINT Estado_Contacto_Contacto_Compania
    FOREIGN KEY (CContacto_Compania)
    REFERENCES Contacto_Compania (CContacto_Compania);

-- Reference: Estado_Contacto_Estado (table: Estado_Contacto)
ALTER TABLE Estado_Contacto ADD CONSTRAINT Estado_Contacto_Estado
    FOREIGN KEY (CEstado)
    REFERENCES Estado (CEstado);

-- Reference: Estado_Trabajador_Empleado (table: Estado_Trabajador)
ALTER TABLE Estado_Trabajador ADD CONSTRAINT Estado_Trabajador_Empleado
    FOREIGN KEY (Empleado_CEmpleado)
    REFERENCES Trabajador (CTrabajador);

-- Reference: Estado_Trabajador_Estado (table: Estado_Trabajador)
ALTER TABLE Estado_Trabajador ADD CONSTRAINT Estado_Trabajador_Estado
    FOREIGN KEY (CEstado)
    REFERENCES Estado (CEstado);

-- Reference: Local_Distrito (table: Local)
ALTER TABLE Local ADD CONSTRAINT Local_Distrito
    FOREIGN KEY (CDistrito)
    REFERENCES Distrito (CDistrito);

-- Reference: Local_Producto_Local (table: Local_Producto)
ALTER TABLE Local_Producto ADD CONSTRAINT Local_Producto_Local
    FOREIGN KEY (CLocal)
    REFERENCES Local (CLocal);

-- Reference: Local_Producto_Producto (table: Local_Producto)
ALTER TABLE Local_Producto ADD CONSTRAINT Local_Producto_Producto
    FOREIGN KEY (CProducto)
    REFERENCES Producto (CProducto);

-- Reference: Local_TipoLocal (table: Local)
ALTER TABLE Local ADD CONSTRAINT Local_TipoLocal
    FOREIGN KEY (CTipoLocal)
    REFERENCES TipoLocal (CTipoLocal);

-- Reference: Marca_Categoria (table: Marca)
ALTER TABLE Marca ADD CONSTRAINT Marca_Categoria
    FOREIGN KEY (CCategoria)
    REFERENCES Categoria (CCategoria);

-- Reference: Modelo_Marca (table: Modelo)
ALTER TABLE Modelo ADD CONSTRAINT Modelo_Marca
    FOREIGN KEY (CMarca)
    REFERENCES Marca (CMarca);

-- Reference: Orden_Compra_Contacto_Compania (table: Orden_Compra)
ALTER TABLE Orden_Compra ADD CONSTRAINT Orden_Compra_Contacto_Compania
    FOREIGN KEY (CContacto_Compania)
    REFERENCES Contacto_Compania (CContacto_Compania);

-- Reference: Orden_Compra_Trabajador (table: Orden_Compra)
ALTER TABLE Orden_Compra ADD CONSTRAINT Orden_Compra_Trabajador
    FOREIGN KEY (CTrabajador)
    REFERENCES Trabajador (CTrabajador);

-- Reference: Producto_Modelo (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_Modelo
    FOREIGN KEY (CModelo)
    REFERENCES Modelo (CModelo);

-- Reference: Venta_Cliente (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Cliente
    FOREIGN KEY (CCliente)
    REFERENCES Cliente (CCliente);

-- Reference: Venta_Tipo_Pago (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Tipo_Pago
    FOREIGN KEY (CTipo_Pago)
    REFERENCES Tipo_Pago (CTipo_Pago);

-- Reference: Venta_Trabajador (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Trabajador
    FOREIGN KEY (CTrabajador)
    REFERENCES Trabajador (CTrabajador);

-- End of file.

