import 'package:flutter/material.dart';
import 'package:ween_blaqe/function_that_effect_widgets/visable_invsable.dart';
import 'package:ween_blaqe/styles/button_of_acount.dart';
import 'package:ween_blaqe/styles/switch_style.dart';
import 'package:ween_blaqe/widgets/widgets_before_user_reg/account_before_login.dart';
import 'package:ween_blaqe/widgets/widgets_before_user_reg/registration.dart';
import '../../../styles/button.dart';
import '/styles/text_style/aline_style.dart';
//profile screen...
//that could use input and modification about her info
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  void toggle2() {
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    var visible = true;

    var toggle =  VisibilityInVisibility(toggle: ( ){visible;});
    print(visible);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //back arrow button
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: IconButton(onPressed: (){
                    Navigator.of(context).pop(context);
                  }, icon: Icon(Icons.arrow_back_ios,color: Colors.black87,)),
                ),
                const Expanded(child: Text(""))
              ],
            ),
            //title
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                  child: Text(
                    "الملف الشخصي",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Expanded(child: Text(""))

              ],
            ),
            //image and name of user
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 35, 10, 5),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://robohash.org/hicveldicta.png'),
                      radius: 30,
                    ),

                  ),
                  Text("أدهم أنور أبوعلان",style: TextStyle(fontSize: 16,fontFamily: 'IBM',color: Colors.black87),),
                ],
              ),
            ),
            //join history
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0,10, 35),
                  child: Text("انضم في ديسمبر 2023",style: TextStyle(fontSize: 12,fontFamily: 'IBM',color: Colors.grey),),
                ),
                Expanded(child: Text(""))

              ],
            ),
            //about user
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10,0),
                ),
                //about user text
                Text("نبذة عني"
                  ,style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
                Expanded(child: SizedBox()),
                //add TextButton
                Padding(

                  padding: const EdgeInsets.fromLTRB(10, 0, 0,0),
                child:  TextButton(

                    child:Text("إضافة",
                      style: TextStyle( color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontFamily: 'IBM',
                      ),),
                    onPressed: (){
                      toggle;
                      print(toggle);
                    },

                  ),

                )
              ],
            ),
            //input something about your self text
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(210, 0, 10, 10),
                  child: Visibility(
                    visible: !visible,
                    child: Text("أدخل شيئًا عن نفسك"
                        ,style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'IBM',
                        )
                    ),
                  ),
                ),
Padding(
                  padding: const EdgeInsets.fromLTRB(210, 0, 10, 10),
                  child: Visibility(
                    visible: visible,
                    child: TextFormField(
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'IBM',
                        ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.orange,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.orange.shade300,
                              ),
                              borderRadius: BorderRadius.circular(7))
                      ),


                    ),

                  ),
                ),

              ],
            ),
            aline,
            //location
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10,0),
                ),
                //about user text
                Text("الموقع"
                  ,style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
                Expanded(child: SizedBox()),
                //add TextButton
                Padding(

                  padding: const EdgeInsets.fromLTRB(10, 0, 0,0),
                  child:  TextButton(
                    child:Text("إضافة",
                      style: TextStyle( color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontFamily: 'IBM',
                      ),),
                    onPressed: (){
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) {
                      //     return const Register();
                      //   }),
                      // );
                    },

                  ),

                )
              ],
            ),
            //input your location
            Padding(
              padding: const EdgeInsets.fromLTRB(270, 0, 10, 10),
              child: Text("أدخل موقعك"
                  ,style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'IBM',
                  )
              ),
            ),
            aline,
            // major
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10,0),
                ),
                //about user text
                Text("التعليم"
                  ,style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
                Expanded(child: SizedBox()),
                //add TextButton
                Padding(

                  padding: const EdgeInsets.fromLTRB(10, 0, 0,0),
                  child:  TextButton(
                    child:Text("إضافة",
                      style: TextStyle( color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontFamily: 'IBM',
                      ),),
                    onPressed: (){
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) {
                      //     return const Register();
                      //   }),
                      // );
                    },

                  ),

                )
              ],
            ),
            //input your major
            Padding(
              padding: const EdgeInsets.fromLTRB(260, 0, 10, 10),
              child: Text("أدخل تخصصك"
                  ,style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'IBM',
                  )
              ),
            ),
            aline,
            //university
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10,0),
                ),
                //about user text
                Text("الجامعة"
                  ,style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
                Expanded(child: SizedBox()),
                //add TextButton
                Padding(

                  padding: const EdgeInsets.fromLTRB(10, 0, 0,0),
                  child:  TextButton(
                    child:Text("تعديل",
                      style: TextStyle( color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontFamily: 'IBM',
                      ),),
                    onPressed: (){
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) {
                      //     return const Register();
                      //   }),
                      // );
                    },

                  ),

                )
              ],
            ),
            //input your university
            Padding(
              padding: const EdgeInsets.fromLTRB(190, 0, 10, 10),
              child: Text("جامعة بولتكنك فلسطين"
                  ,style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'IBM',
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
