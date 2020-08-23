class Recipe {
  String name;
  int pieces;
  int calories;
  Duration minDuration; // duration type must be changed for fetching data from api
  Duration maxDuration; // duration type must be changed for fetching data from api
  String assetName;
  bool isFavorite;
  int startCount;
  int reviewCount;

  Recipe(this.name, this.pieces, this.calories, this.minDuration,
      this.maxDuration, this.assetName, this.startCount, this.reviewCount,
      {this.isFavorite = false});
}
