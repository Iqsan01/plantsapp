import 'package:flutter/material.dart';
import 'package:plantapps/screen/admin_screen.dart';
import 'package:plantapps/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();

    super.dispose();
  }

  void _login(ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (ctx) => AdminScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.0,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    child: Container(
                      child: Image.asset(
                        "assets/images/img_logo.png",
                        width: 90,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 14.0, 24.0, 14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang",
                        style: TextStyle(
                            fontFamily: "Noto",
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xFF36455A)),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Kontrol Penuh Konten Anda",
                        style: TextStyle(
                          color: Color(0xFF495566),
                          fontFamily: "Noto",
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            color: focusNode.hasFocus
                                ? Color(0xFF2DDA93)
                                : Color(0xFF6A6F7D),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF2DDA93),
                              width: 2.0,
                            ),
                          ),
                        ),
                        cursorColor: Color(0xFF2DDA93),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextField(
                        focusNode: focusNode,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: focusNode.hasFocus
                                ? Color(0xFF2DDA93)
                                : Color(0xFF6A6F7D),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF2DDA93),
                              width: 2.0,
                            ),
                          ),
                        ),
                        cursorColor: Color(0xFF2DDA93),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      ElevatedButton(
                        onPressed: () => _login(context),
                        child: Text('LOGIN'),
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          primary: Color(0xFF2DDA93),
                        ),
                      ),
                      SizedBox(
                        height: 42.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
