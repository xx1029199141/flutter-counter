import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //构造函数，用于接受调用者的参数
  MyHomePage({Key key, this.title}) : super(key: key);
  //声明了一个字符串类型的final变量，并在构造函数中初始化
  final String title;
  /*
  *所有继承自StatefulWidget的组件都要重写createState()方法
  *用于指定该页面的状态是由谁来控制的
  *在Dart中，以下划线开头的变量和方法的默认访问权限就是私有的
  *类似于Java中用private关键字修饰的变量和方法，只能在类的内部访问
   */
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*
*State是一个状态对象，<>里面表示该状态是与谁绑定的。
*在修改状态时，在该类中进行编写
 */
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //实现计数值加1的函数
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /**
     *Scaffold是一个Material Design风格的组件，
     *它继承自StatefulWidget， 包含appBar、body、drawer等属性
     */
    return Scaffold(
      /*顶部导航栏 */
      appBar: AppBar(
        /*
        *这里的Widget其实就是MyHomePage，
        *它在这里调用了上面传递过来的title变量
         */
        title: Text(widget.title),
      ),
      //Scaffold中的主体布局
      body: Center(
        /**
         * 在Center组件中有一个child属性，用来定义它的子组件Column，
         * Column表示以行的形式显示其子组件
         */
        child: Column(
          /**
           *mainAxisAlignment用来控制子组件的对齐方式，
           *也可以把值设置为start、end等
           */
          mainAxisAlignment: MainAxisAlignment.center,
          /**
           * Column组件的children属性用于指定它的子组件，
           * 它接受一个数组，可以向该属性传递多个组件
           */
          children: <Widget>[
            //Text组件，用于显示文本
            Text(
              'You have pushed the button this many times:',
            ),
            //Text组件，使用style属性来设置它的样式
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      /**
       * FloatingActionButton 也是Material Design风格的组件，
       * 可以在onPressed属性中定义其单击事件
       */
      floatingActionButton: FloatingActionButton(
        //通过单击触发_incrementCounter函数
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        //指定child的子组件为一个"+"号图标
        child: Icon(Icons.add),
      ),
    );
  }
}
