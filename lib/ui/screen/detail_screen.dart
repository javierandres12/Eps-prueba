
import 'dart:io';
import 'package:eps/ui/widget/card_monitor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';



class DetailScreen extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailScreen();
  }
}

class _DetailScreen extends State<DetailScreen>{
  int colorFront=0xFF3B4C71;//0xFF93D3CB
  List listaDatosTotal=[];
  List listaDatosLetras=[];
  String selectedItem= "";
  var result = "";
  File pickedImage;
  File imagenRecortada;
  var imageFile;
  bool isImageLoaded = false;
  int colorAppbar=0xFF5574E4;
  String valueChoose;
  List item=['Dragger Infinity Vista XL','Mindray iMEC12'];


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

  readTextFromAnImage()  async{

    final inputImage = InputImage.fromFile(imagenRecortada);
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText = await textDetector.processImage(inputImage);

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
          listaTotal.add(element.text);
          setState(() {
            listaDatosTotal=listaTotal;
          });
          setState(() {
            result = result +' '+ element.text;
          });
          print(result);
          print(listaDatosLetras);
          if(element.text.length<=4 && element.text.length>1 ){
            listaDatos.add(element.text);
            setState(() {
              listaDatosLetras=listaDatos;
            });
          }

        }
      }
    }

    //fin


    /*String text = readText.text;
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
          listaTotal.add(element.text);
          setState(() {
            listaDatosTotal=listaTotal;
          });
          setState(() {
            result = result +' '+ element.text;
          });
          print(result);
          print(listaDatosLetras);
          if(element.text.length<=4 && element.text.length>1 ){
            listaDatos.add(element.text);
            setState(() {
              listaDatosLetras=listaDatos;
            });
          }

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
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Color(colorFront),
        title: Text('Captura Monitor',style: TextStyle(color: Colors.white),),
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
          /*Container(
            margin: EdgeInsets.only(left: 5,right: 5,top: 8,bottom: 5),
            width: screenWidht-30,
            height: 40,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(colorFront),
                  )
                ]
            ),
            child: DropdownButton(
                hint: Text('Seleccinar Monitor'),
                value: valueChoose,
                isExpanded: true,
                autofocus: true,
                items: item.map((valueItem){
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
                onChanged: (newValue){
                  setState(() {
                    valueChoose = newValue;
                  });
                }
            ),
          ),*/
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
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: CardMonitor(
                listaDatos: listaDatosTotal,
                listaDatosLetras: listaDatosLetras,
                ReferenciaMonitor: valueChoose,
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

