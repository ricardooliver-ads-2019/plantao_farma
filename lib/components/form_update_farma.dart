// ignore_for_file: prefer_const_constructors, implementation_imports, prefer_final_fields, unused_field, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/provides/services/auth_service.dart';
import 'package:plantao_farma/provides/services/firestore_service.dart';
import 'package:plantao_farma/provides/services/time_service.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
import 'package:provider/src/provider.dart';
import 'package:validatorless/validatorless.dart';

import 'default_button.dart';

class FormUpdateFarma extends StatefulWidget {
  const FormUpdateFarma({ Key? key, required this.farmacia }) : super(key: key);
  final Farmacia farmacia;
  @override
  _FormUpdateFarmaState createState() => _FormUpdateFarmaState();
}

class _FormUpdateFarmaState extends State<FormUpdateFarma> {
  final _formKey = GlobalKey<FormState>();
  var _nameEC = TextEditingController();
  var _emailEC = TextEditingController();
  var _cnpjEC = TextEditingController();
  var _logoEC = TextEditingController();
  var _telefoneEC = TextEditingController();
  var _telefone2EC = TextEditingController();
  var _whatsaapEC = TextEditingController();
  var _enderecoEC = TextEditingController();
  var _bairroEC = TextEditingController();
  var _cidadeEC = TextEditingController();
  var _ufEC = TextEditingController();
  var _cepEC = TextEditingController();
  TimeOfDay? _hA = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay? _hF = TimeOfDay(hour: 22, minute: 0);
  List<int> horaAber = [8, 0];
  List<int> horaFech = [22, 0];
  bool? _platao;
  @override
  void initState() {
    horaAber[0] = widget.farmacia.horarioA[0];
    horaAber[1] = widget.farmacia.horarioA[1];
    horaFech[0] = widget.farmacia.horarioF[0];
    horaAber[1] = widget.farmacia.horarioF[1];
    _hA = TimeOfDay(hour: widget.farmacia.horarioA[0], minute: widget.farmacia.horarioA[1]);
    _hF = TimeOfDay(hour: widget.farmacia.horarioF[0], minute: widget.farmacia.horarioF[1]);
    _platao = widget.farmacia.plantao;
    _nameEC.text = widget.farmacia.nome;
    _cnpjEC.text = widget.farmacia.cnpj;
    _emailEC.text = widget.farmacia.email;
    _logoEC.text = widget.farmacia.logo;
    _telefoneEC.text = widget.farmacia.telefone;
    _whatsaapEC.text = widget.farmacia.whatsapp;  
    _enderecoEC.text = widget.farmacia.endereco;
    _bairroEC.text = widget.farmacia.bairro;
    _cidadeEC.text = widget.farmacia.cidade;
    _cepEC.text = widget.farmacia.cep;
    _ufEC.text = widget.farmacia.uf;
    super.initState();
  }

  
  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _cnpjEC.dispose();
   _telefoneEC.dispose();
    _telefone2EC.dispose();
    _whatsaapEC.dispose();   
    _enderecoEC.dispose();
    _bairroEC.dispose();
    _cidadeEC.dispose();
    _cepEC.dispose();
    _ufEC.dispose();
    super.dispose();
  }


  void clearTextEditingController(){
    //limpar formulario
    setState(() {
      _nameEC.clear();
      _emailEC.clear();
      _cnpjEC.clear();
      _logoEC.clear();
      _telefoneEC.clear();
      _telefone2EC.clear();
      _whatsaapEC.clear();
      _enderecoEC.clear();
      _bairroEC.clear();
      _cidadeEC.clear();
      _cepEC.clear();
      _ufEC.clear();
      _platao = false;
      _hA = TimeOfDay(hour: 8, minute: 0);
      _hF = TimeOfDay(hour: 22, minute: 0);
    });
  }


  Future pickTimeAbertura(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: _hA ?? initialTime,
    );

    if (newTime == null) return;

    setState(() { _hA = newTime;
      final hours = _hA!.hour.toString().padLeft(2, '0');
      final minutes = _hA!.minute.toString().padLeft(2, '0');
      horaAber.clear();
      horaAber.add(_hA!.hour);
      horaAber.add(_hA!.minute);
      //print(horaAber);
      context.read<TimeService>().getHorarioAbertura(newTime);
    });
    
  }

  Future pickTimeFechameto(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 22, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: _hF ?? initialTime,
    );

    if (newTime == null) return;

    setState(() { _hF = newTime;
      final hours = _hF!.hour.toString().padLeft(2, '0');
      final minutes = _hF!.minute.toString().padLeft(2, '0');
      horaFech.clear();
      horaFech.add(_hF!.hour);
      horaFech.add(_hF!.minute);
      //print(horaFech);
      context.read<TimeService>().getHorarioFechamento(newTime);
    });
    
  }

  getHorasParaMinutos(TimeOfDay horas){
     // tranformando a hora para minutos
    var minutos = horas.hour * 60 + horas.minute;
    return minutos;
  }


  conferiSeHoraAberturaeMenorQHoraFechamennto(TimeOfDay horaA, TimeOfDay horaF){
    // discubrindo qual das horas é a maior
    var horaAberMinutos = getHorasParaMinutos(horaA);
    var horaFechMinutos = getHorasParaMinutos(horaF);
    if (horaAberMinutos >= horaFechMinutos) {
      return true;
    } else {
      return false;
    }
  }





  atualizar()async{
    var _farmacia = Farmacia(
      id: widget.farmacia.id,
      nome: _nameEC.text,
      cnpj: _cnpjEC.text,
      email: _emailEC.text,
      logo: 'assets/images/imgFarmacias/imgFarmacia2.png',
      telefone: _telefoneEC.text, 
      telefone2: _telefone2EC.text,
      whatsapp: _whatsaapEC.text,
      endereco: _enderecoEC.text,
      bairro: _bairroEC.text,
      cidade: _cidadeEC.text,
      cep: _cepEC.text,
      uf: _ufEC.text, 
      horarioAbertura: _hA!.hour.toString().padLeft(2, '0') + ' : ' + _hA!.minute.toString().padLeft(2, '0'), 
      horarioFechamento: _hF!.hour.toString().padLeft(2, '0') + ' : ' + _hF!.minute.toString().padLeft(2, '0'),
      horarioA: horaAber,
      horarioF: horaFech,
      plantao: _platao!,
      
      
    );
    try{
      await context.read<FirestoreService>().update(_farmacia);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Icon(Icons.check, size: 50, color: Colors.green))));
    } on FirestoreExceptions catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    var telaWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
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
                  hintText: "Informe o nome da farmácia",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required('Campo obrigatório!'),
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
                  Validatorless.required('Campo obrigatório!'),
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
                  hintText: "Informe o CNPJ",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Campo obrigatório!'),
                  Validatorless.cnpj('CNPJ Invalido!')
                ])
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
                  hintText: "Informe um telefone para cadastro",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required("Campo obrigatório!"),
              ),
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _telefone2EC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Telefone2",
                  hintText: "Informe um segundo telefone para cadastro",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
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
                  labelText: "Whatsapp",
                  hintText: "Informe o número de whatsapp",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required('Campo obrigatório!'),
              ),
            ),
            
            Container(
              child: TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: _enderecoEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Endereço",
                  hintText: "Informe o Endereço do estabelecimento",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required('Campo obrigatório!'),
              ),
            ),

            Container(
              child: TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: _bairroEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Bairro",
                  hintText: "Informe o Bairro do estabelecimento",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required('Campo obrigatório!'),
              ),
            ),

            Container(
              child: TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: _cidadeEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Cidade",
                  hintText: "Informe a cidade do estabelecimento",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required('Campo obrigatório!'),
              ),
            ),

            Container(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _cepEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "CEP",
                  hintText: "Informe o CEP do estabelecimento",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required('Campo obrigatório!'),
              ),
            ),

            Container(
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: _ufEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "UF",
                  hintText: "Informe a sigla do Estado ex: RO",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required('Campo obrigatório!'),
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
                            Text("${_hA!.hour.toString().padLeft(2, '0')} : ${_hA!.minute.toString().padLeft(2, '0')}",
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
                            Text("${_hF!.hour.toString().padLeft(2, '0')} : ${_hF!.minute.toString().padLeft(2, '0')}",
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

            SizedBox(
              height: 10,
            ),

            Container(
              child: SwitchListTile(
                value: _platao ??= false,
                onChanged: (newValue) {
                  //print(platao);
                  setState(() => _platao = newValue);
                  //print(platao);
                } ,
                title: Text(
                  'Farmacia de Plantão',
                  style: GoogleFonts.nunito(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                subtitle: Text(
                  'Este campo marca a farmácia como Plantonista',
                  style: null,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: true,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            
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
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: DefaultButton(
                        imageSrc: AppAssets.iconEnviar,
                        text: "Salvar!",
                        press: () {
                          var formValid = _formKey.currentState?.validate() ?? false;
                          if (!conferiSeHoraAberturaeMenorQHoraFechamennto(_hA!, _hF!) & (formValid)) {
                            atualizar();
                            
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text('Horario de Fechamento Invalido!'),
                                Text('O Horario de Fechamento NÃO pode ser menor ou igual ao horario de Abertura'),
                              ],
                            )));
                          }
                          
                        }
                        ,
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
  loading(){
    return Scaffold(
      body: Container(
        color: AppColor.bgColor,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: CircularProgressIndicator(color: AppColor.primaryColor))
      ),
    );
  }
}