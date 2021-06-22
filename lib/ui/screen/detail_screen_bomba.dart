
import 'dart:io';
import 'package:eps/ui/widget/card_bomba.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';



class DetailScreenBomba extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailScreenBomba();
  }
}

class _DetailScreenBomba extends State<DetailScreenBomba>{
  List listaDatos=[];
  String selectedItem= "";
  var result = "";
  File pickedImage;
  File imagenRecortada;
  var imageFile;
  bool isImageLoaded = false;
  int colorAppbar=0xFF5574E4;
  int colorFront=0xFF3B4C71;//0xFF93D3CB


  getImageFromGallery() async {
    var tempStore = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      pickedImage=File(tempStore.path);
    });
    File cropped = await ImageCropper.cropImage(
        sourcePath: pickedImage.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
          CropAspectRatioPreset.ratio5x4
        ],
        compressQuality: 100,
        cropStyle: CropStyle.rectangle,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Editar Imagen',
          toolbarColor: Color(colorFront),
          statusBarColor: Color(colorFront),
          lockAspectRatio: false,
          toolbarWidgetColor: Colors.white,

        )
    );
    setState(() {
      imagenRecortada=cropped;
    });
    if(imagenRecortada!=null){
      setState(() {
        isImageLoaded=true;
      });
    }
  }

  getImageFromCamera() async {
    var tempStore = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      pickedImage=File(tempStore.path);
    });
    File cropped = await ImageCropper.cropImage(
        sourcePath: pickedImage.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
          CropAspectRatioPreset.ratio5x4
        ],
        compressQuality: 100,
        cropStyle: CropStyle.rectangle,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Editar Imagen',
          toolbarColor: Color(colorFront),
          statusBarColor: Color(colorFront),
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: false
        )
    );
    setState(() {
      imagenRecortada=cropped;
    });
    if(imagenRecortada!=null){
      setState(() {
        isImageLoaded=true;
      });
    }

  }

  readTextFromAnImage()  async{
    final inputImage = InputImage.fromFile(imagenRecortada);
    final textDetector = GoogleMlKit.vision.textDetector();
    //final textDetector1 = GoogleMlKit.vision.;
    final RecognisedText recognisedText = await textDetector.processImage(inputImage);
    //final RecognisedText ksjdfnd = await

    List listaTotal=new List();
    List listaDatos=new List();

    String text = recognisedText.text;
    for (TextBlock block in recognisedText.blocks) {
      final Rect rect = block.rect;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
          print(element.text);
          setState(() {
            result = result +'\n '+ element.text;
          });
        }
      }
    }

    /*FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(imagenRecortada);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    TextRecognizer cloudTextRecognizer = FirebaseVision.instance.cloudTextRecognizer();
    VisionText readText = await recognizeText.processImage(myImage);
    //VisionText readText = await  cloudTextRecognizer.processImage(myImage);

    List listaDa=new List();

    String text = readText.text;
    for (TextBlock block in readText.blocks) {
      final Rect boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
          print(element.text);
          setState(() {
            result = result +'\n '+ element.text;
          });

        }
      }

    }*/


  }

  final _scaffoldkey = GlobalKey<ScaffoldState>();
  // variable para el key que permite acceder al formulario actual del codigo
  final _formkey =  GlobalKey<FormState>();
  // creamos las variables para guardar los datos

  int color1= 0xFF2EBFF7;


  @override
  Widget build(BuildContext context) {
    selectedItem = ModalRoute.of(context).settings.arguments.toString();
    //variables para el largo y ancho de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(colorFront),
        title: Text('Captura Bomba Inf.',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading:  IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
          Navigator.pop(context);
        }),
        actions: [
          IconButton(
              icon: Icon(Icons.image_search , color: Colors.white,),
              onPressed: (){
                getImageFromGallery();
              }
          ),
          IconButton(
              icon: Icon(Icons.add_a_photo , color: Colors.white,),
              onPressed: (){
                getImageFromCamera();
              }
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 100),
          isImageLoaded ? Center(
            child: Container(
              height: screenHeight/1.8,
              width: screenWidht,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(imagenRecortada),

                  )
              ),
            ),
          ) : Container(),
          Container(
              margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              alignment: Alignment.center,
              child: CardBomba(
                listaDatos: listaDatos,
                result: result,
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(colorFront),
          child: Icon(Icons.check,color: Colors.white,),
          onPressed: readTextFromAnImage
      ),

    );




  }
}

