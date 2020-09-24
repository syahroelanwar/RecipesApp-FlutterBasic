class Meal{
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal(this.strMeal, this.strMealThumb, this.idMeal);

  factory Meal.fromJson(dynamic json) {
    return Meal(json['strMeal']as String, json['strMealThumb'] as String, json['idMeal'] as String);
  }

  @override
  String toString() {
    return '{ ${this.strMeal}, ${this.strMealThumb}, ${this.idMeal} }';
  }
}