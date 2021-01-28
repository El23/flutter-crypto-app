import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password)async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;

  }catch(e){
    print(e);
    return false;
  }

}



Future<bool> register(String email, String password)async{
  try{
     await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password:password);
    return true;
  } on FirebaseAuthException catch (e){
    if(e.code=='week - password'){
      print('password provided is too weak');

    }else if (e.code=='email-already-in-use'){
      print('account already exist');
    }return false;
  }catch(e)
{
  print(e.toString());
}return false;
}