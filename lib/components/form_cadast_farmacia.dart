// ignore_for_file: prefer_final_fields, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/components/default_button.dart';
import 'package:plantao_farma/provides/services/time_service.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
import 'package:provider/src/provider.dart';
import 'package:validatorless/validatorless.dart';

class FormCadastFarmacia extends StatefulWidget {
  const FormCadastFarmacia({ Key? key }) : super(key: key);

  @override
  _FormCadastFarmaciaState createState() => _FormCadastFarmaciaState();
}

class _FormCadastFarmaciaState extends State<FormCadastFarmacia> {
  final _formKey = GlobalKey<FormState>();
  var _nameEC = TextEditingController();
  var _emailEC = TextEditingController();
  var _cnpjEC = TextEditingController();
  var _telefoneEC = TextEditingController();
  var _whatsaapEC = TextEditingController();
  var _cepEC = TextEditingController();
  var _ederecoEC = TextEditingController();
  TimeOfDay? _hAbertura = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay? _hFechamento = TimeOfDay(hour: 22, minute: 0);
  String horaAber = "";
  String horaFech = "";
  //var _horarioFechamentoEC;
  var _plantaoEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _cnpjEC.dispose();
    _telefoneEC.dispose();
    _whatsaapEC.dispose();   
    _cepEC.dispose();
    _ederecoEC.dispose();
    _plantaoEC.dispose();
    super.dispose();
  }

  void clearTextEditingController(){
    setState(() {
      _nameEC = TextEditingController();
      _emailEC = TextEditingController();
      _cnpjEC = TextEditingController();
      _telefoneEC = TextEditingController();
      _whatsaapEC = TextEditingController();
      _cepEC = TextEditingController();
      _ederecoEC = TextEditingController();
      _plantaoEC = TextEditingController();
    });
  }

  Future pickTimeAbertura(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: _hAbertura ?? initialTime,
    );

    if (newTime == null) return;

    setState(() { _hAbertura = newTime;
      final hours = _hAbertura!.hour.toString().padLeft(2, '0');
      final minutes = _hAbertura!.minute.toString().padLeft(2, '0');
      horaAber = '$hours:$minutes';
      //print(horaAber);
      context.read<TimeService>().getHorarioAbertura(newTime);
    });
    
  }

  Future pickTimeFechameto(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 22, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: _hFechamento ?? initialTime,
    );

    if (newTime == null) return;

    setState(() { _hFechamento = newTime;
      final hours = _hFechamento!.hour.toString().padLeft(2, '0');
      final minutes = _hFechamento!.minute.toString().padLeft(2, '0');
      horaFech = '$hours:$minutes';
      //print(horaFech);
      context.read<TimeService>().getHorarioAbertura(newTime);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    var telaWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [            
            Container(
              child: TextFormField(
                controller: _nameEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Nome",
                  hintText: "Nome",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required('Informe seu nome!'),
              ),
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Email",
                  hintText: "Digite email",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.multiple([
                  Validatorless.email('Email Inválido!'),
                  Validatorless.required('Informe seu email!'),
                ]),
                
              ),
            ),
            Container(
              child: TextFormField(
                controller: _cnpjEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "CNPJ",
                  hintText: "Informe o Asunto",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required("Informe O assunto da mensagem!"),
              ),
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _telefoneEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Telefone",
                  hintText: "Informe o Asunto",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required("Informe O assunto da mensagem!"),
              ),
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _whatsaapEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Whatsaap",
                  hintText: "Informe o Asunto",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required("Informe O assunto da mensagem!"),
              ),
            ),
            Container(
              child: TextFormField(
                controller: _cepEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "CEP",
                  hintText: "Informe o Asunto",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required("Informe O assunto da mensagem!"),
              ),
            ),
            Container(
              child: TextFormField(
                controller: _ederecoEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Endereço",
                  hintText: "Informe o Asunto",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required("Informe O assunto da mensagem!"),
              ),
            ),

            Container(
              child: Column(

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('Informe o Horario de Funcionamento',
                      style: GoogleFonts.oswald(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 135,
                        width: 120,
                        color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Abertura",
                              style: GoogleFonts.nunito(
                                color: AppColor.bgColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("${_hAbertura!.hour.toString().padLeft(2, '0')} : ${_hAbertura!.minute.toString().padLeft(2, '0')}",
                              style: GoogleFonts.nunito(
                                color: AppColor.bgColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            GestureDetector(
                              child: Icon(Icons.access_time_outlined, size: 50),
                              onTap: ()=> pickTimeAbertura(context),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 135,
                        width: 120,
                        color: Colors.amber,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Fechamento",
                              style: GoogleFonts.nunito(
                                color: AppColor.bgColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                             SizedBox(
                              height: 10,
                            ),
                            Text("${_hFechamento!.hour.toString().padLeft(2, '0')} : ${_hAbertura!.minute.toString().padLeft(2, '0')}",
                              style: GoogleFonts.nunito(
                                color: AppColor.bgColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            GestureDetector(
                              child: Icon(Icons.access_time_outlined, size: 50),
                              onTap: ()=> pickTimeFechameto(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
            
            Container(
              child: TextFormField(
                controller: _plantaoEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Plantão",
                  hintText: "Informe o Asunto",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required("Informe O assunto da mensagem!"),
              ),
            ),

            SizedBox(height: 40),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: clearTextEditingController,
                    child: Image.asset(AppAssets.buttonReset,width: 15,),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 20,
                runSpacing: 20,
                children: [
                  FittedBox(
                    child: Container(
                      height: 24,
                      width: telaWidth > 350 ? 110 : 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: DefaultButton(
                        imageSrc: AppAssets.iconEnviar,
                        text: "Enviar!",
                        press: () {
                          var formValid = _formKey.currentState?.validate() ?? false;
                          if(formValid){
                            //chamada da função para enviar email
                            //_nameEC.text, 
                            //_emailEC.text, 
                            //_descrisionEC.text, 
                            //_mesageEC.text

                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
