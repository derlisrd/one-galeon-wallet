import 'package:flutter/material.dart';
import 'package:onegaleon/src/models/register.response.model.dart';
import 'package:onegaleon/src/services/api.services.dart';
import 'package:onegaleon/src/utils/utils.dart';
import 'package:onegaleon/src/widgets/index.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  
  bool passwordVisible=true; 
  bool passwordVisible2=true; 
  String emailError = '';
  String nameError= '';
  String passwordError ='';
  String passwordError2 ='';
  bool _isLoading = false;

  @override 
  void initState(){ 
      super.initState(); 
      //passwordVisible=true; 
  }

  void switchPass (){
    setState(() {
      passwordVisible = !passwordVisible;
    });
  } 
  void switchPass2 (){
    setState(() {
      passwordVisible2 = !passwordVisible2;
    });
  } 

  void _tryregister (BuildContext context) async{
    setState((){
      nameError='';
      emailError='';
      passwordError='';
      passwordError2='';
    });
    if(nameController.text.isEmpty){
      setState(() => nameError='Complete correctamente el nombre',);
      return;
    }
    if( ! isValidEmail(emailController.text) ){
      setState(() => emailError='Complete correctamente el email',);
      return;
    }
    if( passwordController.text.length < 6){
      setState(()=> passwordError='Debe tener al menos 6 caracteres');
      return;
    }
    if( password2Controller.text != passwordController.text){
      setState(() {
        passwordError ='Las contraseñas deben coincidir';
        passwordError2 ='Las contraseñas deben coincidir';
      });
      return;
    }
    setState(() => _isLoading = true,);
    RegisterModelResponse registro = await ApiServices().registerWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      passwordConfirmation: password2Controller.text);
    
      if(registro.success){
        setState(() => _isLoading = false,);
        _mostrarAlert('Registro creado','Ya puedes iniciar sesion con tus credenciales.',(){ if (context.mounted) Navigator.pushNamed(context, 'login');});
        
      }else{
        setState(() => _isLoading = false,);
        _mostrarAlert("Error", registro.message, () => Navigator.pop(context));
      }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: _isLoading ? _loadingScreen() : SingleChildScrollView( child: Center(child: _formulario(context)),)
      ),
    );
  }

  _mostrarAlert(String title, String txt, Function() onPress){
    showDialog(context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(txt),
        actions: [
          TextButton(
            onPressed: onPress,
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
    );
  }


  Widget _formulario(BuildContext context){
    return Container(
      constraints: const BoxConstraints(
                maxWidth: 480,
              ),
      child: (
        Column(
          children: [
            const SizedBox(height: 12),
            const Icon(Icons.person,size: 48),
            const Center(child: TitlePrimary("Registrarme")),
            FieldPrimary( controller: nameController, hintText: 'Nombre',errorText: nameError.isEmpty ? null : nameError ),
            FieldPrimary( controller: emailController, hintText: 'E-mail', errorText: emailError.isEmpty ? null : emailError ),
            FieldPassword( controller: passwordController, oscureText: passwordVisible, hintText: 'Contraseña', onPressed: switchPass,errorText: passwordError.isEmpty ? null : passwordError),
            FieldPassword( controller: password2Controller, oscureText: passwordVisible2, hintText: 'Repetir contraseña', onPressed: switchPass2,errorText: passwordError2.isEmpty ? null : passwordError2,),
            Row(
              children: [
                const SizedBox(width: 18),
                const Subtitle('Ya tienes cuenta?'),
                GestureDetector(
                  onTap: (){ Navigator.pop(context);},
                  child: const Subtitle('Entrar'),
                ),
              ],
            ),
            PrimaryButton(
              text: "REGISTRAR",
              onTap: ()=> _tryregister(context),
            )
          ],
        )
      ),
    );
  }


  Widget _loadingScreen(){
    return  const Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(), // Puedes usar cualquier otro indicador de carga
              SizedBox(height: 16.0),
              Text('Cargando...'),
            ],
          ) 
    );
  }


}
