import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    read.avatar();
    read.name();
    read.type();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _sizedBox = 25;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFF),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        children: <Widget>[
          Text(
            "Настройки",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          SizedBox(height: _sizedBox),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                databaseHelper.avatar,
                height: MediaQuery.of(context).size.height / 8,
              ),
            ),
          ),
          SizedBox(height: _sizedBox / 2),
          Center(
            child: Text(
              databaseHelper.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: _sizedBox / 2),
          AccountView(),
          SizedBox(height: _sizedBox / 2),
          AdditionalView(),
        ],
      ),
    );
  }
}

class AccountView extends StatelessWidget {
  const AccountView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _titleTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    final TextStyle _descriptionTextStyle = TextStyle(
      fontSize: 12,
      color: Colors.black54,
    );
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFF66BB6A)),
              child: Icon(
                Icons.book,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text("Имя и фамилия", style: _titleTextStyle),
            subtitle:
                Text("Изменение имени и фамилии", style: _descriptionTextStyle),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFFA726)),
              child: Icon(
                Icons
                    .security, //если Нурали не понравиться дизайн, то использовать verified_user
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text("Изменить пароль", style: _titleTextStyle),
            subtitle:
                Text("Изменение старого пароля", style: _descriptionTextStyle),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFF7043)),
              child: Icon(
                Icons.notifications_active,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text("Уведомления", style: _titleTextStyle),
            subtitle:
                Text("Настройка уведомлений", style: _descriptionTextStyle),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class AdditionalView extends StatelessWidget {
  const AdditionalView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _titleTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    final TextStyle _descriptionTextStyle = TextStyle(
      fontSize: 12,
      color: Colors.black54,
    );
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFAB47BC)),
              child: Icon(
                Icons.live_help,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text("FAQ. Помощь", style: _titleTextStyle),
            subtitle: Text("Ответы на самые частые вопросы",
                style: _descriptionTextStyle),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFEF5350)),
              child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text("Выйти из системы", style: _titleTextStyle),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
