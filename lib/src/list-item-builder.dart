import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemsBuilder<T> extends StatefulWidget {
  const ListItemsBuilder(
      {Key key, this.snapshot, this.itemBuilder, this.controller})
      : super(key: key);
  @required
  final AsyncSnapshot<List<T>> snapshot;
  @required
  final ItemWidgetBuilder<T> itemBuilder;
  final ScrollController controller;

  @override
  _ListItemsBuilderState<T> createState() => _ListItemsBuilderState<T>();
}

class _ListItemsBuilderState<T> extends State<ListItemsBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    if (widget.snapshot.hasData) {
      final List<T> items = widget.snapshot.data;

      if (items.isNotEmpty) {
        return _buildList(items, context, widget.controller);
      } else {
        return Center(
          child: Container(
              height: 220,
              width: 220,
              child: FlareActor("assets/empty_not_found_404.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: "idle")),
        );
      }
    } else if (widget.snapshot.hasError) {
      return Center(child: Container(child: Text('Error Loading')));
    }
    return Container(
        child: Image.asset("assets/images/logo.gif"), color: Colors.white);
  }

  Widget _buildList(List<T> items, BuildContext context,
      [ScrollController controller]) {
    return ListView.builder(
      controller: controller ?? null,
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) =>
          widget.itemBuilder(context, items[index]),
    );
  }
}
