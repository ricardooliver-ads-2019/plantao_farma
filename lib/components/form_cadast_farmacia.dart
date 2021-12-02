// ignore_for_file: prefer_final_fields, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, implementation_imports

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/app_routes.dart';
import 'package:plantao_farma/components/default_button.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/provides/services/auth_service.dart';
import 'package:plantao_farma/provides/services/firestore_service.dart';
import 'package:plantao_farma/provides/services/time_service.dart';
import 'package:plantao_farma/screens/login_screen.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
import 'package:plantao_farma/utils/mask_formatter.dart';
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
  var _telefone2EC = TextEditingController();
  var _whatsaapEC = TextEditingController();
  var _enderecoEC = TextEditingController();
  var _bairroEC = TextEditingController();
  var _cidadeEC = TextEditingController();
  var _ufEC = TextEditingController();
  var _cepEC = TextEditingController();
  var _logoEC = TextEditingController();
  TimeOfDay? _hA = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay? _hF = TimeOfDay(hour: 22, minute: 0);
  List<int> horaAber = [8, 0];
  List<int> horaFech = [22, 0];
  bool? _platao;

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
    _logoEC.clear();
    super.dispose();
  }

  void clearTextEditingController(){
    //limpar formulario
    setState(() {
      _nameEC.clear();
      _emailEC.clear();
      _cnpjEC.clear();
      _telefoneEC.clear();
      _telefone2EC.clear();
      _whatsaapEC.clear();
      _enderecoEC.clear();
      _bairroEC.clear();
      _cidadeEC.clear();
      _cepEC.clear();
      _ufEC.clear();
      _logoEC.clear();
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
      //print("********************* ${horaAber}");
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
      //print('Tadoido***** ${horaFech}');
      context.read<TimeService>().getHorarioAbertura(newTime);
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

  cadastrar()async{
    var _farmacia = Farmacia(
      nome: _nameEC.text,
      cnpj: _cnpjEC.text,
      email: _emailEC.text,
      logo: _logoEC.text,
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
      await context.read<FirestoreService>().cadastrar(_farmacia);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Icon(Icons.check, size: 50, color: Colors.green))));
      clearTextEditingController();
      Navigator.of(context).pushReplacementNamed(AppRoutes.AREA_ADM);
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
                inputFormatters: [MaskFormatter().maskCNPJ],
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
                inputFormatters: [MaskFormatter().maskPhone],
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
                inputFormatters: [MaskFormatter().maskPhone],
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
                inputFormatters: [MaskFormatter().maskCel],
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
                inputFormatters: [MaskFormatter().maskCEP],
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
              child: TextFormField(
                keyboardType: TextInputType.url,
                controller: _logoEC,
                onChanged: (value) {},
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Foto",
                  hintText: "Informe o endereço da imagem",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                validator: Validatorless.required('Campo obrigatório!'),
              ),
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
                          if(formValid){
                            if (auth.isLoading) {
                              return loading();
                            }else if(auth.usuario == null){
                              //volta para pagina de login
                              return LoginScreen();
                            }else if(conferiSeHoraAberturaeMenorQHoraFechamennto(_hA!, _hF!)){
                              return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(
                                child: Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text('Horario de Fechamento Invalido!'),
                                    Text('O Horario de Fechamento NÃO pode ser menor ou igual ao horario de Abertura'),
                                  ],
                                ),
                              )));    
                              
                            }else{
                               //salvando no firebas
                              return cadastrar();
                            }
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
  loading(){
    return Scaffold(
      body: Container(
        color: AppColor.bgColor,
        height: MediaQuery.of(context).size.height,
        child: Center(child: CircularProgressIndicator(color: AppColor.primaryColor,),)
      ),
    );
  }
}
