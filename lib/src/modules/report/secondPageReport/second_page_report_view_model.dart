import 'dart:io';
import 'package:app_patinha/src/core/helpears/messages.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SecondPageReportViewModel with MessageStateMixin {
  final fieldSelectedCollar = signal<String>('');
  final fieldSelectedBruised = signal<String>('');
  final fieldSelectedMalnourished = signal<String>('');
  final fieldSelectedMeek = signal<String>('');
  final camera = signal<bool>(true);

  final List<File> photos = List.empty(growable: true);
  XFile? image;

  late final optionFieldSelectedCollar = computed(
    () => fieldSelectedCollar.value.compareTo('Sim') == 0
        ? 'com coleira'
        : 'sem coleira',
  );

  late final optionFieldSelectedBruised = computed(
    () => fieldSelectedBruised.value.compareTo('Sim') == 0
        ? 'está machucado'
        : 'não está machucado',
  );

  late final optionFieldSelectedMalnourished = computed(
    () => fieldSelectedMalnourished.value.compareTo('Sim') == 0
        ? 'está desnutrido'
        : 'não está desnutrido',
  );

  late final optionFieldSelectedMeek = computed(
    () =>
        fieldSelectedMeek.value.compareTo('Sim') == 0 ? 'dócil' : 'não é dócil',
  );

  adicionarFoto() {
    photos.add(File(image!.path));
  }

  capturePhoto({bool camera = true}) async {
    XFile? temp;

    final ImagePicker picker = ImagePicker();
    if (camera) {
      temp = await picker.pickImage(source: ImageSource.camera);
    } else {
      temp = await picker.pickImage(source: ImageSource.gallery);
    }

    if (temp != null) {
      image = temp;
    }
  }
}
