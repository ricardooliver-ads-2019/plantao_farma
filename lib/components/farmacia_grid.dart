// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, unnecessary_string_interpolations, implementation_imports, non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantao_farma/models/farmacia.dart';
import 'package:plantao_farma/provides/services/firestore_service.dart';
import 'package:plantao_farma/screens/page_details_farma_screen.dart';
import 'package:plantao_farma/utils/app_assets.dart';
import 'package:plantao_farma/utils/app_color.dart';
import 'package:provider/src/provider.dart';

class FarmaciaGrid extends StatefulWidget {
  const FarmaciaGrid({ Key? key, required this.farmacia }) : super(key: key);
  final Farmacia farmacia;
  @override
  _FarmaciaGridState createState() => _FarmaciaGridState();
}

class _FarmaciaGridState extends State<FarmaciaGrid> {

  bool on_off = false;
  var lat = -9.902495177269794;
  var long = -63.03662180065657;

  listarDetailsFarma()async{
    try{
      await context.read<FirestoreService>().listDetailsFarmaFirestore(widget.farmacia);
    } on FirestoreExceptions catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getHorasParaMinutos(TimeOfDay horas){
     // tranformando a hora para minutos
    var minutos = horas.hour * 60 + horas.minute;
    return minutos;
  }

  abertaOUfechada(int horaAtual, int horaAbrir, int horaFechar, bool plantao){
    if (plantao) {
      return true;
    } else {
      if ((horaAbrir <= horaAtual) & (horaAtual < horaFechar)) {
        return true;
      }else{
        return false;
      }
    }
    
  }
  getLocationFarma()async{

    List<Location> locations = await locationFromAddress("${widget.farmacia.endereco} - ${widget.farmacia.bairro}, ${widget.farmacia.cidade} - ${widget.farmacia.endereco}, ${widget.farmacia.cep}, Brasil");
    for (var item in locations) {
      lat = item.latitude;
      long = item.longitude;
    }
    //print('${lat} -- ${long}');
  }

  

  @override
  Widget build(BuildContext context) {
    getLocationFarma();
    // ignore: unnecessary_brace_in_string_interps
    
    //print('agora vai ${lat} -- ${long}');
    // pegendo a hora atual
    TimeOfDay horaAtual = TimeOfDay.now();
    // tranformando a hora atual para minutos 
    int horaAtu = getHorasParaMinutos(horaAtual); 
    // pegando a hora de fechamento da farmacia
    TimeOfDay horaFechamento = TimeOfDay(hour: widget.farmacia.horarioF[0], minute: widget.farmacia.horarioF[1]);
    int horaFech = getHorasParaMinutos(horaFechamento); 
    // pegando a hora de Abertura da farmacia 
    TimeOfDay horaAbertura = TimeOfDay(hour: widget.farmacia.horarioA[0], minute: widget.farmacia.horarioA[1]);
    int horaAber = getHorasParaMinutos(horaAbertura); 
    on_off = abertaOUfechada(horaAtu, horaAber, horaFech, widget.farmacia.plantao);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: GestureDetector(
        onTap: (){
          listarDetailsFarma();
          Future.delayed(Duration(seconds: 5));
          Navigator.push(context, MaterialPageRoute(builder: (context)=> PageDetailsFarmaScreen(farmacia: widget.farmacia, on_off: on_off, lat: lat, long: long,)));
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(widget.farmacia.logo, scale: 1.0), fit: BoxFit.fill)
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
                ),
                child: Column(                                            
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 5),
                    Text("Horario de Funcionamento", style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),),
                    widget.farmacia.plantao 
                    ? Text('24h',
                        style: GoogleFonts.oswald(
                          color: AppColor.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text("${widget.farmacia.horarioAbertura} - ${widget.farmacia.horarioFechamento}", 
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 5,
              child: Text("${widget.farmacia.nome}", 
                style: GoogleFonts.oswald(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(on_off ? AppAssets.buttonON : AppAssets.buttonOFF, width: 70,)
            ),
          ],
        ),
      ),
    );
  }
}