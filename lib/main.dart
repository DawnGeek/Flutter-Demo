// 导入包
import 'package:flutter/material.dart'; // 此行代码作用是导入了Material UI组件库。Material是一种标准的移动端和web端的视觉设计语言， Flutter默认提供了一套丰富的Material风格的UI组件
import 'package:english_words/english_words.dart'; // 随机英文
import 'package:flutter/services.dart' show rootBundle; // 通过rootBundle 对象加载：每个Flutter应用程序都有一个rootBundle对象， 通过它可以轻松访问主资源包
import 'dart:async' show Future;
import 'dart:developer'; // debugger

// 加载 assets
/* 您的应用可以通过AssetBundle对象访问其asset 。有两种主要方法允许从Asset bundle中加载字符串或图片(二进制)文件。 */

// 文字加载
Future<String> loadsset() async {
  return await rootBundle.loadString('assets/json/data.json');
}

void test() => print(123);


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

      //注册路由表
      routes: {
        "new_page": (context) => NewRoute(),
      },
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
    /*Navigator是一个路由管理的widget，它通过一个栈来管理一个路由widget集合。
      通常当前屏幕显示的页面就是栈顶的路由。Navigator提供了一系列方法来管理路由栈，在此我们只介绍其最常用的两个方法：
        1.Future push(BuildContext context, Route route) 将给定的路由入栈（即打开新的页面），返回值是一个Future对象，用以接收新路由出栈（即关闭）时的返回数据。
        2.bool pop(BuildContext context, [ result ]) 将栈顶路由出栈，result为页面关闭时返回给上一个页面的数据。
      Navigator 还有很多其它方法，如Navigator.replace、Navigator.popUntil等。

      Navigator类中第一个参数为context的静态方法都对应一个Navigator的实例方法,
      比如Navigator.push(BuildContext context, Route route) 等价于Navigator.of(context).push(Route route)
      */

    // 路由传参
    Navigator.of(context).pushNamed("new_page", arguments: this._count);
    return;
    Navigator.pushNamed(context, "new_page");
    return;
    Navigator.push(context,

      // MaterialPageRoute继承自PageRoute类，PageRoute类是一个抽象类，表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建及切换时过渡动画的相关接口及属性。

      /* MaterialPageRoute({
        WidgetBuilder builder, builder 是一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例
        RouteSettings settings, 包含路由的配置信息，如路由名称、是否初始路由（首页）
        bool maintainState = true, 默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false
        bool fullscreenDialog = false, 表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向
      })*/
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
            ),
            RandomWordsWidget(), // 随机字符串
            LoadImg()
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

    // 接受参数
    var routeParams = ModalRoute.of(context).settings.arguments;

    print(routeParams);

//    return Scaffold(
//      appBar: AppBar(
//        title: Text("New route"),
//      ),
//      body: Center(
//        child: new Column(
//          children: <Widget>[
//            LoadImg(),
//            new Text('hellow shaopeng', style: new TextStyle(fontSize: 32.5,),),
//            Echo(text: '123',)
//          ],
//        )
//      ),
//    );
    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Row(
              /*您可以控制行或列如何使用mainAxisAlignment和crossAxisAlignment属性来对齐其子项。
                对于行(Row)来说，主轴是水平方向，横轴垂直方向。对于列（Column）来说，主轴垂直方向，横轴水平方向*/
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(child: Image.asset('assets/images/shagou.jpeg'),),
                new Expanded(child: Image.asset('assets/images/shagou.jpeg'), flex: 2,),
                new Expanded(child: Image.asset('assets/images/shagou.jpeg'), flex: 2,),
                new Expanded(child: Image.asset('assets/images/shagou.jpeg'),),
              ],
            ),
            new Center(
              child: new Text('Hello MaiMai',
                  style: new TextStyle(fontSize: 40.0, color: Colors.black87)),
            ),
            LoadImg(),
            StarVm()
          ],
        ),
      ),
    );
  }
}

class StarVm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(20.0),
      color: Colors.tealAccent,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Icon(Icons.star, color: Colors.blue),
              new Icon(Icons.star, color: Colors.blue),
              new Icon(Icons.star, color: Colors.blue),
              new Icon(Icons.star, color: Colors.blue),
              new Icon(Icons.star, color: Colors.blue)
            ],
          ),
          new Text(
            'wahahhaha',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: .5,
              fontSize: 20.0
            ),
          )
        ],
      ),
    );
  }
}


// 随机字符串组件
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

// 引入图片
class LoadImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new Expanded(
      child: Image.asset('assets/images/maimai.jpeg'),
    );
  }
}

// Stateless Widget
class Echo extends StatelessWidget {
  /*按照惯例，widget的构造函数应使用命名参数，命名参数中的必要参数要添加@required标注，
    这样有利于静态代码分析器进行检查，另外，在继承widget时，第一个参数通常应该是Key，
    如果接受子widget的child参数，那么通常应该将它放在参数列表的最后。*/
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor:Colors.blueAccent,
  }):super(key:key);

  // widget的属性应被声明为final，防止被意外改变。
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

