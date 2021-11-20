// ignore_for_file: prefer_final_fields, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:plantao_farma/components/default_button.dart';
import 'package:plantao_farma/utils/app_assets.dart';
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
  var _horarioAberturaEC = TextEditingController();
  var _horarioFechamentoEC = TextEditingController();
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
    _horarioAberturaEC.dispose();
    _horarioFechamentoEC.dispose();
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
      _horarioAberturaEC = TextEditingController();
      _horarioFechamentoEC = TextEditingController();
      _plantaoEC = TextEditingController();
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
              child: TextFormField(
                controller: _horarioAberturaEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Horario Abertura",
                  hintText: "Informe o Asunto",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required("Informe O assunto da mensagem!"),
              ),
            ),
            Container(
              child: TextFormField(
                controller: _horarioFechamentoEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Horario Fechamento",
                  hintText: "Informe o Asunto",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required("Informe O assunto da mensagem!"),
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
