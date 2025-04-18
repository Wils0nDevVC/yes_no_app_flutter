

enum FromWho { me, hers}

class Message {

  final String text;
  final String? imagUrl;
  final FromWho fromWho;

  Message({required this.text,  this.imagUrl, required this.fromWho});
  
}