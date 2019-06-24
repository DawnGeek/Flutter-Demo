// 导入包
import 'package:flutter/material.dart';
// 此行代码作用是导入了Material UI组件库。Material是一种标准的移动端和web端的视觉设计语言， Flutter默认提供了一套丰富的Material风格的UI组件


// 应用入口
void main() => runApp(new MyApp());
/*
* 与C/C++、Java类似，Flutter 应用中main函数为应用程序的入口，main函数中调用了，runApp 方法，它的功能是启动Flutter应用，它接受一个Widget参数，
* 在本示例中它是MyApp类的一个实例，该参数代表Flutter应用。
* main函数使用了(=>)符号，这是Dart中单行函数或方法的简*/

// 应用结构
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //应用名称
      title: 'Flutter Demo',
      theme: new ThemeData(
        //蓝色主题
        primarySwatch: Colors.blue,
      ),
      //应用首页路由
      home: new MyHomePage(title: '首页'),
    );
  }
}

/*MyApp类代表Flutter应用，它继承了 StatelessWidget 类，这也就意味着应用本身也是一个widget。
  在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)。
  Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
  MaterialApp 是Material库中提供的Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
  Scaffold 是Material库中提供的页面脚手架，它包含导航栏和Body以及FloatingActionButton（如果需要的话）。 本书后面示例中，路由默认都是通过Scaffold创建。
  home 为Flutter应用的首页，它也是一个widget。*/

// 首页
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 1;

  void _addCount() {
    setState(() {
      _count += 1;
    });
  }

  // 跳转NewRoute
  void _jumpRoute() {
    print('点击');
    Navigator.push(context,
      new MaterialPageRoute(builder: (context) {
        return new NewRoute();
      })
    );
  }

  // 构建UI界面

  /*构建UI界面的逻辑在build方法中，当MyHomePage第一次创建时，_MyHomePageState类会被创建，
    当初始化完成后，Flutter框架会调用Widget的build方法来构建widget树，最终将widget树渲染到设备屏幕上。*/
  Widget build(BuildContext context) {

    // Scaffold 是 Material库中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),

      /* body的widget树中包含了一个Center widget，Center 可以将其子widget树对齐到屏幕中心，
        Center 子widget是一个Column widget，Column的作用是将其所有子widget沿屏幕垂直方向依次排列， 此例中Column包含两个 Text 子widget，
        第一个Text widget显示固定文本 “You have pushed the button this many times:”，第二个Text widget显示_counter状态的数值。 */
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('你点了'),
            new Text('$_count', style: Theme.of(context).textTheme.display1,),
            FlatButton(
              child: Text('点我'),
              textColor: Colors.blue,
              onPressed: _jumpRoute,
            )
          ],
        ),
      ),
      /* floatingActionButton是页面右下角的带“➕”的悬浮按钮，
      它的onPressed属性接受一个回调函数，代表它被点击后的处理器，本例中直接将_incrementCounter作为其处理函数 */
      floatingActionButton: new FloatingActionButton(
        onPressed: _addCount,
        tooltip: '点击',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}

// 创建一个新路由，命名“NewRoute”
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}