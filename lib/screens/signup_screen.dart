import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../homepage.dart';
import 'login_screen.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff0c3358),
          elevation: 0,
          automaticallyImplyLeading: true,
          title: const Text(
            "Giriş Yap",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 290,
                  height: 230,
                  child: Image.asset(
                    "assets/images/signup.png",
                    color: null,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          suffixIcon: Icon(Icons.person),
                          hintText: 'Ad',
                          labelText: 'Ad',
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintText: 'Soyad',
                          labelText: 'Soyad',
                          contentPadding: EdgeInsets.all(20.0),
                          suffixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintText: 'Mail',
                          labelText: 'Mail',
                          contentPadding: EdgeInsets.all(20.0),
                          suffixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintText: 'Şifre',
                          labelText: 'Şifre',
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                      ),
                    ),
                    Center(
                      child: CheckboxListTile(
                        title:
                        const Text('Okudum, kabul ediyorum.'),
                        value: timeDilation != 1.0,
                        onChanged: (bool? value) {
                          setState(() {
                            timeDilation = value! ? 5.0 : 1.0;
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                            email: email.text, password: password.text)
                            .then((value) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }).onError((error, stackTrace) {
                          print("Hata");
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        primary: Color(0xff0c3358),
                      ),
                      child: Text(
                        "Hesap Oluştur",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Zaten üyeliğin var mı? Giriş yap.',
                        style:
                        TextStyle(color: Color(0xff0c3358), fontSize: 12),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Login()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
