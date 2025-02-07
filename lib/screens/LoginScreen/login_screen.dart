import 'package:flutter/material.dart';
import '../HomeScreen/homepage.dart';

class LoginScreenState extends StatefulWidget {
  const LoginScreenState({super.key});

  @override
  State<LoginScreenState> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenState> {
  bool isMale = true;
  bool isSignUpScreen = true;
  bool isRememberMe = false;

  Map<String, String> usernameAndPassword = {
    'user1': 'password1',
    'user2': 'password2',
    'user3': 'password3',
  };

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController usernameController2 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController confirmPasswordController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    usernameController2 = TextEditingController();
    passwordController2 = TextEditingController();
    confirmPasswordController2 = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameController2 = TextEditingController();
    passwordController2 = TextEditingController();
    confirmPasswordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hand.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Colors.orange.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                        children: [
                          TextSpan(
                            text: isSignUpScreen ? 'Hand in Hand,' : 'Back,',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'RobotoSlab',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignUpScreen
                          ? 'Signup to Continue'
                          : 'Login to Continue',
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white70,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),

              // child: Container(
              //   color: Colors.orange,
              // ),
            ),
          ),
          buildBottomHalfContainer(true),
          //Main Container for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            top: 150,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.ease,
              height: isSignUpScreen ? 350 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignUpScreen
                                      ? Colors.black
                                      : Colors.orange,
                                  fontFamily: 'RobotoSlab',
                                ),
                              ),
                              if (!isSignUpScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.blueAccent,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SIGNUP',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignUpScreen
                                      ? Colors.black
                                      : Colors.orange,
                                  fontFamily: 'RobotoSlab',
                                ),
                              ),
                              if (isSignUpScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.blueAccent,
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignUpScreen) buildSignupSection(),
                    if (!isSignUpScreen) buildLoginScreen(),
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(false),
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(
                  isSignUpScreen ? "Or Signup with" : "Or Login with",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildtextButton(Icons.facebook_outlined, 'Facebook',
                          Colors.blueAccent),
                      buildtextButton(
                          Icons.email_outlined, 'Gmail', Colors.red),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildLoginScreen() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.person_2_outlined, "Username", false, true,
              usernameController),
          buildTextField(
              Icons.lock_outlined, "Password", true, false, passwordController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.person_2_outlined, 'Username', false, false,
              usernameController2),
          buildTextField(Icons.lock_outlined, 'Password', true, false,
              passwordController2),
          buildTextField(Icons.lock, 'Confirm Password', true, false,
              confirmPasswordController2),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to our",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                  ),
                  children: [
                    TextSpan(
                      text: " terms & conditions",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildtextButton(
      IconData icon, String title, Color backgraoundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.white70),
          minimumSize: Size(145, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          iconColor: Colors.white,
          backgroundColor: backgraoundColor),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  AnimatedPositioned buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.ease,
      top: isSignUpScreen ? 455 : 355,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orangeAccent, Colors.redAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        if (showShadow)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                      ]),
                  child: IconButton(
                    onPressed: () {
                      if (isSignUpScreen) {
                        String username = usernameController2.text;
                        String password = passwordController2.text;
                        String confirmPassword =
                            confirmPasswordController2.text;
                        addToMapIfMatch(username, password, confirmPassword);
                        setState(() {});
                      } else {
                        String username = usernameController.text;
                        String password = passwordController.text;

                        checkCredentials(username, password);
                      }
                    },
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  void checkCredentials(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please input username and password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'RobotoSlab',
            ),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
        ),
      );
    } else {
      if (usernameAndPassword.containsKey(username)) {
        // Username found in the map
        if (usernameAndPassword[username] == password) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Invalid Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(10),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Username does not exist',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'RobotoSlab',
              ),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
          ),
        );
      }
    }
  }

  void addToMapIfMatch(
      String username, String password, String confirmPassword) {
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please input username and password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'RobotoSlab',
            ),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
        ),
      );
    } else {
      if (password == confirmPassword) {
        if (!usernameAndPassword.containsKey(username)) {
          usernameAndPassword[username] = password;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'User added successfully!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(10),
            ),
          );
          usernameController2.clear();
          passwordController2.clear();
          confirmPasswordController2.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Username already exists',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(10),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Password don't match",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'RobotoSlab',
              ),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
          ),
        );
      }
    }
  }

  Widget buildTextField(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
