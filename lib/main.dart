import 'package:flutter/material.dart';

void main() => runApp(TPHUPanelApp());

class TPHUPanelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TPHU Panel',
      home: PasswordScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  String _errorText = '';

  void _checkPassword() {
    if (_controller.text == 'leminho') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      setState(() {
        _errorText = 'Sai mật khẩu. Vui lòng thử lại!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nhập mật khẩu để vào TPHU Panel',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Mật khẩu',
                  errorText: _errorText.isEmpty ? null : _errorText,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkPassword,
                child: Text('Vào app'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, bool> features = {
    'ESP': false,
    'Aim Lock': false,
    'No Recoil': false,
    'Bullet Track': false,
    'Magnet': false,
    'Spread Reduce': false,
    'Anti Shake': false,
    'Crosshair Lock': false,
    'Aim Drag Assist': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TPHU Panel'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: features.keys.map((String key) {
          return SwitchListTile(
            title: Text(key),
            value: features[key]!,
            onChanged: (bool value) {
              setState(() {
                features[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
