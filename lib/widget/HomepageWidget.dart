import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/entity/banner.dart';
import 'package:flutterapp/vm/TestViewModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomePage> {

  TextViewModel model = new TextViewModel(1);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextViewModel>.value(
        // ignore: non_constant_identifier_names
        value: model,
        child: Consumer<TextViewModel>(builder: (context, model, widget) {
          return Column(
            children: <Widget>[
              new Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.info),
                  label: Text("加载数据"),
                  onPressed: () {
                    Provider.of<TextViewModel>(context, listen: false)
                        .loadData();
                  },
                ),
              ),
              new Expanded(
                  child: new ListView.separated(
                      itemCount: model.getCount(),
                      itemBuilder: (context, index) {
                        return BodyWidget(banner: model?.banners[index]);
                      },
                      separatorBuilder: (context, index) =>
                          Divider(height: .0)) //
                  )
            ],
          );
        }));
  }
}

class BodyWidget extends StatelessWidget {
  final BannerEntity banner;

  const BodyWidget({Key key, this.banner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${banner.desc}"), //1
    );
  }
}
