import 'package:chatapp/cubit/chat/chat_cubit.dart';
import 'package:chatapp/model/messagemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key, required this.email});

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  final String email;
  List<MessageModel> messageList = [];

  @override
  Widget build(BuildContext context) {
    // StreamBuilder<QuerySnapshot>(
    //     stream: messages.orderBy('createdAt', descending: true).snapshots(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         List<MessageModel> messageList = [];
    //         for (int i = 0; i < snapshot.data!.docs.length; i++) {
    //           final Map<String, dynamic>? data =
    //               snapshot.data!.docs[i].data() as Map<String, dynamic>?;
    //           if (data != null && data.containsKey('message')) {
    //             messageList.add(MessageModel.fromJson(data));
    //           }
    //         }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF095C61),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/scholar.png',
                height: 50,
                width: 50,
              ),
              const Text(
                'Scholar Chat',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Pacifico'),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatCubit, ChatState>(
                listener: (context, state) {
                  if (state is ChatSendSuccess) {
                    messageList = state.message;
                  }
                },
                builder: (context, state) {
                  return ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return messageList[index].id == email
                            ? ChatBuble(
                                message: messageList[index],
                              )
                            : ChatBubleFromFrindes(message: messageList[index]);
                      });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: controller,
                onSubmitted: (value) {
                  BlocProvider.of<ChatCubit>(context)
                      .sendMessage(message: value, email: email);
                  controller.clear();
                  _controller.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFF095C61),
                        width: 1,
                      ),
                    ),
                    hintText: 'Enter your message',
                    suffixIcon: Icon(
                      Icons.send,
                      color: Color(0xFF095C61),
                    )),
              ),
            )
          ],
        ));
  }
}

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.message,
  });
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 5, top: 20, bottom: 20),
          decoration: const BoxDecoration(
            color: Color(0xFF095C61),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Text(
            message.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubleFromFrindes extends StatelessWidget {
  const ChatBubleFromFrindes({
    super.key,
    required this.message,
  });
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 5, top: 20, bottom: 20),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 20, 175, 184),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          child: Text(
            message.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
