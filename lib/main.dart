import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'details_page.dart';
import 'login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test company',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Test company'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(window.document.cookie);
    bool authorized = window.document.cookie?.contains('session-id') ?? false;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.elderly),
        title: Text(widget.title),
        actions: [
          if (authorized)
            const Center(
              child: Text('Hello, Alexey!'),
            ),
          IconButton(
            onPressed: _navigateToWiki,
            icon: Icon(Icons.info),
          ),
          if (!authorized)
            IconButton(
              onPressed: _navigateToLogin,
              icon: Icon(Icons.login),
            ),
          if (authorized)
            IconButton(
              onPressed: _logOut,
              icon: Icon(Icons.logout),
            ),
        ],
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 8 * 3,
        mainAxisSpacing: 8 * 3,
        crossAxisCount: 4,
        children: <Widget>[
          _getTile(
            'best-team',
            'images/best_team.jpg',
            'The best team',
            'I have ever seen',
          ),
          _getTile(
            'best-team',
            'images/careful_team.jpg',
            'Careful team',
            'Которую я когда-либо видел',
          ),
          _getTile(
            'collaborative-team',
            'images/collaborative_team.jpg',
            'Collaborative team',
            'I have ever seen',
          ),
          _getTile(
            'friendly-team',
            'images/friendly_team.jpeg',
            'Friendly team',
            'I have ever seen',
          ),
          _getTile(
            'funny-team',
            'images/funny_team.png',
            'Funny team',
            'I have ever seen',
          ),
          _getTile(
            'successful-team',
            'images/successful_team.jpeg',
            'Successful team',
            'Движок Flutter написан преимущественно на C++, поддерживает низкоуровневый рендеринг с помощью графической библиотеки Google Skia, имеет возможность взаимодействовать с платформозависимыми SDK под Android и iOS.\n\nБиблиотека Foundation[4], написанная на языке Dart, содержит основные классы и методы для создания приложений Flutter и взаимодействия с движком Flutter.\n\nДизайн пользовательского интерфейса приложений Flutter предполагает использование виджетов, описываемых как неизменяемые объекты какой-либо части пользовательского интерфейса. Все графические объекты, включая текст, формы и анимацию, создаются с помощью виджетов; комбинированием простых виджетов создаются сложные виджеты. С фреймворком поставляется два основных набора виджетов — Material Design (стиль Google) и Cupertino (стиль Apple). При этом создавать приложения Flutter можно и без виджетов, напрямую вызывая методы библиотеки Foundation для работы с канвой.',
          ),
          _getTile(
            'technological-team',
            'images/technological_team.jpeg',
            'Technological team',
            'I have ever seen',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getTile(String id, String imagePath, String title, String text) =>
      GridTile(
        child: new InkResponse(
          enableFeedback: true,
          onTap: () => _navigateToDetailsPage(id, imagePath, title, text),
          child: Image.asset(
            imagePath,
            width: 450,
            height: 250,
            fit: BoxFit.fitHeight,
          ),
        ),
        footer: Container(
          padding: const EdgeInsets.all(8),
          color: Theme.of(context).secondaryHeaderColor,
          alignment: Alignment.center,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      );

  void _navigateToDetailsPage(
    String id,
    String imagePath,
    String title,
    String text,
  ) {
    window.document.cookie =
        '${id}=true; domain=.test-company.com; path=/; expires=Thu, 01 Jan 2022 00:00:01 GMT;';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => DetailsPage(
          imagePath: imagePath,
          title: title,
          text: text,
        ),
      ),
    );
  }

  void _navigateToWiki() async {
    const url = 'https://wiki.test-company.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _navigateToLogin() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
    );
    setState(() {
      window.document.cookie = '';
    });
  }

  void _logOut() {
    setState(() {
      window.document.cookie =
          'session-id=; domain=.test-company.com; path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    });
  }
}
