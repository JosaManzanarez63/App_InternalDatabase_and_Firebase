class Product{
  final int? id;
  final String nombre;
  final String imagen;
  final double costo;
  final double total;
  final int cantidad;
  

  Product(
    {
      this.id, required this.nombre, required this.imagen, required this.costo, required this.total, required this.cantidad}
  );

  factory Product.fromMap(Map<String, dynamic> json) => 
    Product(id: json['id'], nombre: json['nombre'], costo: json['costo'], imagen: json['imagen'], cantidad: json['cantidad'],total: json['total']);

    Map<String, dynamic> toMap(){
      return{
        'id': id,
        'nombre': nombre,
        'costo': costo,
        'imagen': imagen,
        'cantidad': cantidad,
        'total': total
      };
    }
}