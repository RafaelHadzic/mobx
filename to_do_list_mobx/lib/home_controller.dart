import 'package:mobx/mobx.dart';
import 'package:to_do_list_mobx/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ObservableList<ItemModel> listItems = [
    ItemModel(title: "Tarefa 1", check: true),
    ItemModel(title: "Tarefa 2", check: false),
    ItemModel(title: "Tarefa 3", check: true),
  ].asObservable();

  @action 
  addItem(ItemModel model){
    listItems.add(model);
  }

  @action 
  removeItem(ItemModel model){
    listItems.removeWhere((item) => item.title == model.title);
  }

}