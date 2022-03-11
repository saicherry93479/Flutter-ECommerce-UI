import 'package:flutter/material.dart';
import 'package:learning_three/SCREENS/Message/models.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  List Messages = [];
  Ruler r = Ruler();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Messages.addAll(MessageList);
    print("length is ${Messages.length} ");
  }

  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children:
              List.generate(Messages.length, (index) => MessageTile(index)),
        ),
      ),
    );
  }

  Widget MessageTile(index) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(Messages[index].image),
          ),
          title: Text(
            Messages[index].name,
            style:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
          ),
          subtitle: Text(
            Messages[index].message,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            children: [
              Text(
                Messages[index].time,
                style: TextStyle(fontSize: 8),
              ),
              SizedBox(
                height: r.getAppropiateHeight(4),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor:
                    Messages[index].n > 0 ? kprimaryColor : Colors.white,
                child: Text(
                  (Messages[index].n).toString(),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
