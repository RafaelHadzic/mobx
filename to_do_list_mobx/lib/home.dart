import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list_mobx/home_controller.dart';
import 'package:to_do_list_mobx/item_model.dart';
import 'package:to_do_list_mobx/item_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = HomeController();

  _dialog() {
    var model = ItemModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Adicionar tarefa"),
            content: TextField(
              onChanged: model.setTitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nova Tarefa",
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  controller.addItem(model);
                  Navigator.pop(context);
                },
                child: Text("Salvar"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              _dialog();
            },
          ),
        ],
        title: Text("Lista de Tarefas"),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: controller.listItems.length,
          itemBuilder: (_, index) {
            var item = controller.listItems[index];
            return ItemWidget(
              item: item,
              removeClicked: () {
                controller.removeItem(item);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _dialog();
          }),
    );
  }
}
