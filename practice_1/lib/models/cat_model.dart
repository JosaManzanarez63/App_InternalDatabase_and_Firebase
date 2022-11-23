class Cat{
  final int? id;
  final String categoria;
  final String precio;
  final String ranking;
  final String titulo;
  final String description;
  final String calorias;
  final String aditivos;
  final String vitaminas;
  final String? imagen;
  

  Cat(
    {
      this.id, required this.categoria, required this.precio, required this.ranking, required this.titulo, required this.description,
      required this.calorias, required this.aditivos, required this.vitaminas, this.imagen
    }
  );

  factory Cat.fromMap(Map<String, dynamic> json) => 
    Cat(id: json['id'], categoria: json['categoria'], precio: json['precio'], ranking: json['ranking'], titulo: json['titulo'],
    description: json['description'], calorias: json['calorias'], aditivos: json['aditivos'], vitaminas: json['vitaminas'],
    imagen: json['imagen']);

    Map<String, dynamic> toMap(){
      return{
        'id': id,
        'categoria': categoria,
        'precio': precio,
        'ranking': ranking,
        'titulo': titulo,
        'description': description,
        'calorias': calorias,
        'aditivos': aditivos,
        'vitaminas': vitaminas,
        'imagen': imagen,
      };
    }
}