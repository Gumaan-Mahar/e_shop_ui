import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/filter_model.dart';

class FilterDetailController extends GetxController {
  RxList<FilterModel> brands = [
    FilterModel(name: 'Gucci', isFavorite: true),
    FilterModel(name: 'Louis Vuitton', isFavorite: false),
    FilterModel(name: 'Chanel', isFavorite: true),
    FilterModel(name: 'Prada', isFavorite: false),
    FilterModel(name: 'Dior', isFavorite: true),
    FilterModel(name: 'Versace', isFavorite: false),
    FilterModel(name: 'Bottega Veneta', isFavorite: true),
    FilterModel(name: 'Dolce & Gabbana', isFavorite: false),
    FilterModel(name: 'Fendi', isFavorite: true),
  ].obs;
  void selectTab(index){
    brands[index].isFavorite =
                        !brands[index].isFavorite;
                       brands.refresh();
  }

  
}