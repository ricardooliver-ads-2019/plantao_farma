import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormatter{
  final maskCel = MaskTextInputFormatter(mask: '(##) # ####-####');
  final maskPhone = MaskTextInputFormatter(mask: '(##) ####-####');
  final maskCPF = MaskTextInputFormatter(mask: '###.###.###-##');
  final maskCNPJ = MaskTextInputFormatter(mask: '##.###.###/####-##');
  final maskCEP = MaskTextInputFormatter(mask: '#####-###');

}