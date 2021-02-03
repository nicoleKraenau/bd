 --La empresa desea saber cuales son los contactos que proveen más a la compañia ya que desea enviarles un regalo por el empeño demostrado 

create View Cantidad_Proveedor as
select  c.NContacto, p.CProducto, p.NProducto, doc.Qproductos
from Contacto_Compania c join Orden_Compra oc on c.CContacto_Compania = oc.CContacto_Compania 
				 join Detalle_Orden_Compra doc on oc.COrden_Compra = doc.COrden_Compra
				 join Producto p on p.CProducto=doc.CProducto

create view Cantidad_Maxima_Producto as
select CMP.CProducto ,Maximo = MAX(CMP.Qproductos)
from Cantidad_Proveedor CMP
group by CMP.CProducto

create Procedure Cantidad_X_Contacto as 
select CMP.NContacto, sum(CMP.Qproductos)
from Cantidad_Proveedor CMP join Cantidad_Maxima_Producto CM on CMP.CProducto = CM.CProducto
where CM.Maximo = CMP.Qproductos
group by CMP.NContacto
ORDER BY  sum(CMP.QProductos) DESC

exec dbo.Cantidad_X_Contacto